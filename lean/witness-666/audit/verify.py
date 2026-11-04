#!/usr/bin/env python3
"""Rebuild every proof module and verify the theorem's kernel dependencies."""

import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys


ROOT = Path(__file__).resolve().parent.parent
THEOREM = "TR25.finiteCertificate"
EXPECTED_AXIOMS = frozenset({"propext", "Classical.choice", "Quot.sound"})
AXIOMS_SOURCE = (
    "import TR25\n\n"
    "example : TR25.FiniteCertificate := TR25.finiteCertificate\n\n"
    "#print axioms TR25.finiteCertificate\n"
)
SOURCE_HASHES_PATH = "audit/source-hashes.json"
SOURCE_HASHES_SHA256 = "c540ae82cca5b916f7f125d9c9f675a7cfe99bfd308b3de4935defa7cecdeec6"
# Keep the literal definitions and the complete finite-certificate proposition fixed.
FIXED_SOURCE_HASHES = {
    'TR25/Definitions.lean':
        '32506bbaac127706ce4eca7a62ce7dd51a5f79b677122840e99950a1ddcb8f9d',
    'TR25/Statement.lean':
        '6aa442f9872b58239ee191601909eb9d9ee39eb89031df6d03ef3a8442a0f3a0',
}
CONFIGURATION_HASHES = {
    'lakefile.toml':
        '85f2d4ee6b872295cf25f55c7efbad85e07483074bd03007637cb066c87fd4b5',
    'lean-toolchain':
        '8190e75a201741065fe508b28955dd64dd72d090babe5f70ce6848879d68ae88',
    'lake-manifest.json':
        '954ad9dc77b6d1a8a62a3a5c57ef4d72b47d82e250cf48d1195f473421cad268',
    'certificate/witness.json':
        '4f856a7ff466a5f4116ea11b64bcdbafae31e70b9049cd2492e4f78f765d54e6',
}
REQUIRED_SOURCES = frozenset({
    "TR25.lean", "TR25/Definitions.lean", "TR25/Statement.lean", "audit/Axioms.lean",
})
MODULE_PATH = re.compile(r"TR25(?:/[A-Za-z][A-Za-z0-9_]*)*\.lean\Z")
SHA256 = re.compile(r"[0-9a-f]{64}\Z")
# Deliberately include comments, strings, and quoted identifiers in this check.
FORBIDDEN = re.compile(
    r"\b(?:sorry|sorryAx|admit|axiom|unsafe|native_decide|implemented_by|ofReduceBool)\b"
)
AXIOMS_OUTPUT = re.compile(
    r"\s*'TR25\.finiteCertificate' depends on axioms: \[([^\[\]\r\n]*)\]\s*\Z"
)


class AuditError(Exception):
    """A verification condition failed."""


def require(condition, message):
    if not condition:
        raise AuditError(message)


def reject_forbidden(source, name):
    match = FORBIDDEN.search(source)
    require(match is None, f"Disallowed proof token in {name}: "
            f"{match.group(0) if match else ''}")


def check_configuration(root):
    """Bind the build to this source directory and the locked dependencies."""
    snapshot = {}
    for name, expected in CONFIGURATION_HASHES.items():
        path = root / name
        require(path.is_file() and not path.is_symlink(), f"Missing or linked configuration: {name}")
        data = path.read_bytes()
        require(hashlib.sha256(data).hexdigest() == expected, f"Build configuration changed: {name}")
        snapshot[name] = data
    return snapshot


def check_source_hashes(root):
    """Require an immutable, complete inventory of proof sources."""
    path = root / SOURCE_HASHES_PATH
    require(path.is_file() and not path.is_symlink(), "Missing or linked source manifest")
    raw = path.read_bytes()
    require(hashlib.sha256(raw).hexdigest() == SOURCE_HASHES_SHA256,
            "Source manifest does not match its SHA256 pin")

    def unique_object(pairs):
        result = {}
        for key, value in pairs:
            require(key not in result, f"Duplicate source-manifest field: {key}")
            result[key] = value
        return result

    try:
        binding = json.loads(raw.decode("utf-8"), object_pairs_hook=unique_object)
    except (UnicodeDecodeError, json.JSONDecodeError) as error:
        raise AuditError("Malformed source manifest") from error
    require(isinstance(binding, dict) and set(binding) == {"schema", "source_hashes"},
            "Unexpected source-manifest fields")
    require(type(binding["schema"]) is int and binding["schema"] == 1,
            "Unsupported source-manifest schema")
    hashes = binding["source_hashes"]
    require(isinstance(hashes, dict) and hashes, "Missing source inventory")
    for name, digest in hashes.items():
        require(isinstance(name, str) and MODULE_PATH.fullmatch(name) is not None,
                f"Invalid bound source path: {name}")
        require(isinstance(digest, str) and SHA256.fullmatch(digest) is not None,
                f"Invalid source digest: {name}")
    return hashes


def source_paths(root):
    """Enumerate recursively; dependencies are the sole source-tree exclusion."""
    root = Path(root)
    require(root.is_dir() and not root.is_symlink(), "Invalid project directory")
    found = []

    def walk_error(error):
        raise AuditError(f"Cannot enumerate project sources: {error}")

    for current, directories, files in os.walk(root, onerror=walk_error, followlinks=False):
        current = Path(current)
        if current == root:
            directories[:] = [name for name in directories if name not in {".lake", ".git"}]
            files = [name for name in files if name != ".git"]
        for name in directories + files:
            path = current / name
            require(not path.is_symlink(), f"Project symlink is not allowed: {path.relative_to(root)}")
        for name in files:
            if name.endswith(".lean"):
                path = current / name
                require(path.is_file(), f"Lean source is not a regular file: {path.relative_to(root)}")
                found.append(path)
    return sorted(found)


def check_sources(root):
    """Check all Lean sources and return their bytes for a later stability check."""
    source_hashes = check_source_hashes(root)
    snapshot = {}
    for path in source_paths(root):
        name = path.relative_to(root).as_posix()
        require(name == "audit/Axioms.lean" or MODULE_PATH.fullmatch(name) is not None,
                f"Unexpected Lean source: {name}")
        data = path.read_bytes()
        try:
            source = data.decode("utf-8")
        except UnicodeDecodeError as error:
            raise AuditError(f"Lean source is not UTF-8: {name}") from error
        reject_forbidden(source, name)
        snapshot[name] = data
    require(REQUIRED_SOURCES <= snapshot.keys(),
            f"Missing required Lean sources: {sorted(REQUIRED_SOURCES - snapshot.keys())}")
    expected_sources = source_hashes.keys() | {"audit/Axioms.lean"}
    require(snapshot.keys() == expected_sources,
            f"Source inventory differs from its binding: "
            f"missing {sorted(expected_sources - snapshot.keys())}; "
            f"extra {sorted(snapshot.keys() - expected_sources)}")
    for name, expected in source_hashes.items():
        require(hashlib.sha256(snapshot[name]).hexdigest() == expected,
                f"Bound source changed: {name}")
    for name, expected in FIXED_SOURCE_HASHES.items():
        actual = hashlib.sha256(snapshot[name]).hexdigest()
        require(actual == expected, f"Fixed theorem source changed: {name}")
    require(snapshot["audit/Axioms.lean"] == AXIOMS_SOURCE.encode("utf-8"),
            "The axiom-printing source changed")
    return snapshot


def parse_axioms(stdout, stderr=""):
    require(not stderr, "Unexpected standard error from the axiom check")
    match = AXIOMS_OUTPUT.fullmatch(stdout)
    require(match is not None, "Missing, malformed, or additional axiom output")
    names = [name.strip() for name in match.group(1).split(",")]
    require(len(names) == len(EXPECTED_AXIOMS) and set(names) == EXPECTED_AXIOMS,
            f"Unexpected axiom list: {names}")
    return frozenset(names)


def module_order(snapshot):
    """Build local dependencies first, one target at a time."""
    sources = {name[:-5].replace("/", "."): data.decode("utf-8")
               for name, data in snapshot.items() if name != "audit/Axioms.lean"}
    visited, visiting, ordered = set(), set(), []

    def visit(module):
        require(module in sources, f"Missing local import: {module}")
        require(module not in visiting, f"Local import cycle: {module}")
        if module in visited:
            return
        visiting.add(module)
        for line in sources[module].splitlines():
            match = re.match(r"\s*(?:(?:public|private)\s+)?import\s+(.+)", line)
            if match:
                for dependency in match.group(1).split("--", 1)[0].split():
                    if dependency == "TR25" or dependency.startswith("TR25."):
                        visit(dependency)
        visiting.remove(module)
        visited.add(module)
        ordered.append(module)

    for module in sorted(sources):
        visit(module)
    return ordered


PYTHON_CHILDREN = {'audit/check_literal_data.py': ['903f198bdf98511827a04289e3b6113d63a047629bab1e27c551e8df3cf2d272', 'ef08dfad50286713c1baf5e0052e8470e1632fdcde6b2dbba3ddd62bbcaa256d', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855']}


def run_python_checked(command, root, *args, **kwargs):
    """Authenticate the complete helper program and its expected diagnostics."""
    root = Path(root)
    names = [name for name in PYTHON_CHILDREN
             if name in command or str(root / name) in command]
    require(len(names) == 1, 'Unregistered Python audit child')
    name = names[0]
    path = root / name
    source_hash, stdout_hash, stderr_hash = PYTHON_CHILDREN[name]
    def source():
        require(all(not (root / Path(*Path(name).parts[:i])).is_symlink()
                    for i in range(1, len(Path(name).parts) + 1)),
                'Linked Python audit child: ' + name)
        require(path.is_file(), 'Missing Python audit child: ' + name)
        data = path.read_bytes()
        require(hashlib.sha256(data).hexdigest() == source_hash,
                'Python audit child source mismatch: ' + name)
        return data
    before = source()
    result = run_checked(command, root, *args, **kwargs)
    require(result.returncode == 0, 'Python audit child failed: ' + name)
    stdout, stderr = result.stdout, result.stderr
    if name == 'audit/test_verify.py':
        # unittest's duration is diagnostic; all remaining bytes are bound.
        stderr = re.sub(r'Ran (\d+) tests in [0-9.]+s',
                        r'Ran \1 tests in <time>s', stderr)
    require(hashlib.sha256(stdout.encode('utf-8')).hexdigest() == stdout_hash
            and hashlib.sha256(stderr.encode('utf-8')).hexdigest() == stderr_hash,
            'Python audit child output mismatch: ' + name)
    require(source() == before, 'Python audit child changed during execution: ' + name)
    return result


def run_checked(command, root):
    print("+ " + " ".join(command), flush=True)
    try:
        result = subprocess.run(command, cwd=root, text=True, encoding="utf-8",
                                stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=False)
    except (OSError, UnicodeError) as error:
        raise AuditError(f"Could not execute {command[0]}: {error}") from error
    if result.stdout:
        print(result.stdout, end="", flush=True)
    if result.stderr:
        print(result.stderr, end="", file=sys.stderr, flush=True)
    require(result.returncode == 0,
            f"Command failed with status {result.returncode}: {' '.join(command)}")
    return result


def verify(root=ROOT):
    root = Path(root)
    configuration_before = check_configuration(root)
    before = check_sources(root)
    run_python_checked([sys.executable, "-B", "audit/check_literal_data.py"], root)
    modules = module_order(before)
    # Naming the package preserves the downloaded dependency cache.
    run_checked(["lake", "clean", "tr25finite"], root)
    for module in modules:
        run_checked(["lake", "build", module], root)
    result = run_checked(["lake", "env", "lean", "audit/Axioms.lean"], root)
    parse_axioms(result.stdout, result.stderr)
    require(check_sources(root) == before, "Lean sources changed during verification")
    require(check_configuration(root) == configuration_before,
            "Build configuration changed during verification")
    run_python_checked([sys.executable, "-B", "audit/check_literal_data.py"], root)
    print(f"PASS: rebuilt {len(modules)} proof modules; all project Lean sources checked.")
    print("PASS: complete source inventory and SHA256 binding match.")
    print(f"PASS: {THEOREM} uses exactly propext, Classical.choice, Quot.sound.")


def main():
    try:
        verify()
    except (AuditError, OSError) as error:
        print(f"FAIL: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
