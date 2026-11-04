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
THEOREM = "TR25Family.finiteCertificate"
EXPECTED_AXIOMS = frozenset({"propext", "Classical.choice", "Quot.sound"})
AXIOMS_SOURCE = (
    "import TR25Family\n\n"
    "example : TR25Family.FiniteCertificate := TR25Family.finiteCertificate\n\n"
    "#print axioms TR25Family.finiteCertificate\n"
)
SOURCE_HASHES_PATH = "audit/source-hashes.json"
SOURCE_HASHES_SHA256 = "a71414dfdd5d7f35f86b2a6dacf1c6f6f972ab94c4c9c6578c79e8100d845cc7"
AUDIT_SOURCE_HASHES = {'audit/check_exact.py': '1a9d7e3af2416e6968970412d5699494bb28f51e9153de38ff1e72c31a1c77bd', 'audit/check_literal_data.py': '3065d13ea044db1d8a5953ac089738f17d53b81266925c79918a1340b83e17be', 'audit/freeze_sources.py': 'fac036bc80aaaed0df5a80d61ccfd155fa3ecb0c934ee2254e1ba70f9fb0e093', 'audit/test_exact.py': '2c7dabf0f982da81d0c346a44113e99a4099cccb66667bc02d83af39561a3878', 'audit/test_verify.py': '45d834df499bc432ee801b128721b9381d9a4226b74c07d82ea311e407d905eb'}
AUDIT_SOURCES = frozenset({
    'audit/verify.py', 'audit/test_verify.py', 'audit/check_literal_data.py',
    'audit/check_exact.py', 'audit/test_exact.py', 'audit/freeze_sources.py',
})
# Keep the literal definitions and the complete finite-certificate proposition fixed.
FIXED_SOURCE_HASHES = {'TR25Family/Definitions.lean': 'cdefbfb9a0f7525cb7203f251e8a4321af38ecce94708558390e66b6b3f7b2d4', 'TR25Family/Statement.lean': 'bdfddcb1cd1f528576d8d65f0e19259b405b7b530c2155cbd096a2b44de43d21'}
CONFIGURATION_HASHES = {'lakefile.toml': '7dee5a851d7e3cd4e19e0bcd48a0eff8be20064073cd177f6f5570f7afda6428', 'lean-toolchain': '8190e75a201741065fe508b28955dd64dd72d090babe5f70ce6848879d68ae88', 'lake-manifest.json': '66072ab03652220cba19fe24560ef3152cfa5a28205087e427b444400c131484', 'certificate/witness.json': 'c0f2ecb8ce43cf50ec88bc3bdb01b8ab0b5b5caf908ce8a0e2eac335dc16cc80', 'certificate/rank_data.json': '9a04efddd7171f89d26406cd9c5283326cc97be4a5e5f779a2f1e0ceaf1f11b8'}
REQUIRED_SOURCES = frozenset({
    "TR25Family.lean", "TR25Family/Definitions.lean", "TR25Family/Statement.lean", "audit/Axioms.lean",
})
MODULE_PATH = re.compile(r"TR25Family(?:/[A-Za-z][A-Za-z0-9_]*)*\.lean\Z")
SHA256 = re.compile(r"[0-9a-f]{64}\Z")
# Deliberately include comments, strings, and quoted identifiers in this check.
FORBIDDEN = re.compile(
    r"\b(?:sorry|sorryAx|admit|axiom|unsafe|native_decide|implemented_by|ofReduceBool|skipKernelTC)\b"
)
AXIOMS_OUTPUT = re.compile(
    r"\s*'TR25Family\.finiteCertificate' depends on axioms: \[([^\[\]\r\n]*)\]\s*\Z"
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


def check_audit_sources(root):
    """Pin the helper implementation and snapshot the verifier itself."""
    actual = {p.relative_to(root).as_posix() for p in (root / 'audit').rglob('*.py')}
    require(actual == AUDIT_SOURCES, 'Audit Python inventory differs')
    require(set(AUDIT_SOURCE_HASHES) == AUDIT_SOURCES - {'audit/verify.py'},
            'Audit helper pins are incomplete or unfrozen')
    snapshot = {}
    for name in sorted(AUDIT_SOURCES):
        path = root / name
        require(path.is_file() and not path.is_symlink(), f'Missing or linked audit source: {name}')
        data = path.read_bytes()
        if name in AUDIT_SOURCE_HASHES:
            require(hashlib.sha256(data).hexdigest() == AUDIT_SOURCE_HASHES[name],
                    f'Audit helper changed: {name}')
        snapshot[name] = data
    return snapshot


def check_audit_stability(root, before):
    require(check_audit_sources(root) == before, 'Audit implementation changed during verification')


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
                    if dependency == "TR25Family" or dependency.startswith("TR25Family."):
                        visit(dependency)
        visiting.remove(module)
        visited.add(module)
        ordered.append(module)

    for module in sorted(sources):
        visit(module)
    return ordered


PYTHON_CHILDREN = {'audit/check_literal_data.py': ['3065d13ea044db1d8a5953ac089738f17d53b81266925c79918a1340b83e17be', '368a5ca28d5626f0ed3f00fac0e31921be7fc413e153151097d799a2dd4f22a7', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'], 'audit/check_exact.py': ['1a9d7e3af2416e6968970412d5699494bb28f51e9153de38ff1e72c31a1c77bd', '63e652ee00a047e854a991ab819385ebf1811fc15680bb2c12a172b3bee8f959', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855']}


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
    audit_before = check_audit_sources(root)
    configuration_before = check_configuration(root)
    before = check_sources(root)
    run_python_checked([sys.executable, "-B", "audit/check_literal_data.py"], root)
    run_python_checked([sys.executable, "-S", "-s", "-B", "audit/check_exact.py"], root)
    modules = module_order(before)
    # Naming the package preserves the downloaded dependency cache.
    run_checked(["lake", "clean", "tr25family"], root)
    for module in modules:
        run_checked(["lake", "build", module], root)
    result = run_checked(["lake", "env", "lean", "audit/Axioms.lean"], root)
    parse_axioms(result.stdout, result.stderr)
    require(check_sources(root) == before, "Lean sources changed during verification")
    require(check_configuration(root) == configuration_before,
            "Build configuration changed during verification")
    run_python_checked([sys.executable, "-B", "audit/check_literal_data.py"], root)
    check_audit_stability(root, audit_before)
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
