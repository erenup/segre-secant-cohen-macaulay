#!/usr/bin/env python3
"""Negative controls for source inspection, dependency output, and execution."""

from contextlib import redirect_stderr, redirect_stdout
import hashlib
import io
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.dont_write_bytecode = True
import verify


VALID_OUTPUT = (
    "'TR25Family.finiteCertificate' depends on axioms: "
    "[propext, Classical.choice, Quot.sound]\n"
)


class AuditControls(unittest.TestCase):
    def test_audit_inventory_and_implementation_stability(self):
        for name in sorted(verify.AUDIT_SOURCES):
            root = self.fixture()
            before = verify.check_audit_sources(root)
            verify.check_audit_stability(root, before)
            path = root / name
            path.write_bytes(path.read_bytes() + b'\n# changed implementation\n')
            with self.subTest(name=name), self.assertRaises(verify.AuditError):
                verify.check_audit_stability(root, before)
            path.unlink()
            with self.assertRaises(verify.AuditError):
                verify.check_audit_sources(root)
            path.symlink_to(verify.ROOT / name)
            with self.assertRaises(verify.AuditError):
                verify.check_audit_sources(root)
        root = self.fixture()
        (root / 'audit' / 'Unexpected.py').write_text('print("unexpected")\n')
        with self.assertRaises(verify.AuditError):
            verify.check_audit_sources(root)

    def test_valid_sources_and_output(self):
        root = self.fixture()
        snapshot = verify.check_sources(root)
        self.assertIn("TR25Family/Definitions.lean", snapshot)
        self.assertEqual(set(verify.check_configuration(root)), set(verify.CONFIGURATION_HASHES))
        self.assertEqual(verify.parse_axioms(VALID_OUTPUT), verify.EXPECTED_AXIOMS)
        self.assertEqual(verify.parse_axioms(VALID_OUTPUT.replace(
            "propext, Classical.choice, Quot.sound", "Quot.sound, propext, Classical.choice")),
            verify.EXPECTED_AXIOMS)

    def test_forbidden_proof_tokens(self):
        for source in (
            "theorem bad : False := by sorry",
            "theorem bad : False := by\n  admit",
            "axiom bad : False", "axiom/- declaration -/bad : False",
            "theorem bad : False := by\n  «sorry»",
            "theorem bad : False := by\n  exact sorryAx _ false",
            "unsafe def bad := 0", "by native_decide", "set_option debug.skipKernelTC true",
            "@[implemented_by bad] def safe := 0", "Lean.ofReduceBool",
            '/- sorry -/', 'def text := "admit"',
        ):
            with self.subTest(source=source), self.assertRaises(verify.AuditError):
                verify.reject_forbidden(source, "example.lean")

    def test_missing_extra_and_malformed_axiom_output(self):
        for output in (
            "", "Build completed successfully.\n", VALID_OUTPUT + VALID_OUTPUT,
            "unrelated output\n" + VALID_OUTPUT, VALID_OUTPUT + "extra output\n",
            VALID_OUTPUT.replace("finiteCertificate", "otherTheorem"),
            VALID_OUTPUT.replace("]", ", sorryAx]"),
            VALID_OUTPUT.replace(", Quot.sound", ""),
            VALID_OUTPUT.replace("Quot.sound", "propext"),
            VALID_OUTPUT.replace("]", ", propext]"),
            VALID_OUTPUT.replace("[propext, Classical.choice, Quot.sound]", "[]"),
            VALID_OUTPUT.replace("]", ""),
        ):
            with self.subTest(output=output), self.assertRaises(verify.AuditError):
                verify.parse_axioms(output)
        with self.assertRaises(verify.AuditError):
            verify.parse_axioms(VALID_OUTPUT, "warning: unexpected diagnostic\n")

    def fixture(self):
        temporary_root = verify.ROOT / ".lake"
        temporary_root.mkdir(exist_ok=True)
        temporary = tempfile.TemporaryDirectory(prefix="audit-control-", dir=temporary_root)
        self.addCleanup(temporary.cleanup)
        root = Path(temporary.name)
        names = (verify.REQUIRED_SOURCES | verify.CONFIGURATION_HASHES.keys()
                 | verify.check_source_hashes(verify.ROOT).keys() | {verify.SOURCE_HASHES_PATH}
                 | verify.AUDIT_SOURCES)
        for name in names:
            path = root / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes((verify.ROOT / name).read_bytes())
        return root

    def test_configuration_cannot_redirect_the_build(self):
        replacements = {
            "lakefile.toml": 'name = "tr25family"\n[[lean_lib]]\nname = "TR25Family"\nsrcDir = "shadow"\n',
            "lean-toolchain": "leanprover/lean4:nightly\n",
            "lake-manifest.json": '{"packages": []}\n',
            "certificate/witness.json": '{"decompositions": []}\n',
            "certificate/rank_data.json": '{"certificates": []}\n',
        }
        for name, replacement in replacements.items():
            root = self.fixture()
            (root / name).write_text(replacement, encoding="utf-8")
            with self.subTest(name=name), self.assertRaises(verify.AuditError):
                verify.check_configuration(root)

    def test_missing_or_linked_configuration(self):
        for name in verify.CONFIGURATION_HASHES:
            root = self.fixture()
            path = root / name
            path.unlink()
            with self.subTest(name=name, linked=False), self.assertRaises(verify.AuditError):
                verify.check_configuration(root)
            path.symlink_to(verify.ROOT / name)
            with self.subTest(name=name, linked=True), self.assertRaises(verify.AuditError):
                verify.check_configuration(root)

    def test_nested_sources_and_dependency_exclusion(self):
        root = self.fixture()
        nested = root / "TR25Family" / "Nested" / "Bad.lean"
        nested.parent.mkdir()
        nested.write_text("theorem bad : False := by sorry\n", encoding="utf-8")
        with self.assertRaises(verify.AuditError):
            verify.check_sources(root)
        nested.write_text("theorem good : True := by trivial\n", encoding="utf-8")
        dependency = root / ".lake" / "packages" / "Dependency.lean"
        dependency.parent.mkdir(parents=True)
        dependency.write_text("axiom dependency : False\n", encoding="utf-8")
        self.assertIn(nested, verify.source_paths(root))
        with self.assertRaises(verify.AuditError):
            verify.check_sources(root)
        nested.unlink()
        self.assertNotIn(".lake/packages/Dependency.lean", verify.check_sources(root))

    def test_complete_inventory_rejects_changed_and_missing_members(self):
        for name in sorted(verify.check_source_hashes(verify.ROOT)):
            for missing in (False, True):
                root = self.fixture()
                path = root / name
                if missing:
                    path.unlink()
                else:
                    path.write_bytes(path.read_bytes() + b"\n-- changed bytes\n")
                with self.subTest(name=name, missing=missing), self.assertRaises(verify.AuditError):
                    verify.check_sources(root)

    def test_source_manifest_is_pinned_and_not_linked(self):
        root = self.fixture()
        path = root / verify.SOURCE_HASHES_PATH
        path.write_bytes(path.read_bytes() + b"\n")
        with self.assertRaises(verify.AuditError):
            verify.check_source_hashes(root)
        path.unlink()
        with self.assertRaises(verify.AuditError):
            verify.check_source_hashes(root)
        path.symlink_to(verify.ROOT / verify.SOURCE_HASHES_PATH)
        with self.assertRaises(verify.AuditError):
            verify.check_source_hashes(root)

    def test_malformed_source_manifest_fails_closed(self):
        for raw in (
            b"[]", b"{}", b"not JSON", b"\xff",
            b'{"schema":1,"schema":1,"source_hashes":{}}',
            b'{"schema":true,"source_hashes":{"TR25Family.lean":"' + b"a" * 64 + b'"}}',
            b'{"schema":1,"source_hashes":{}}',
            b'{"schema":1,"source_hashes":{"../TR25Family.lean":"' + b"a" * 64 + b'"}}',
            b'{"schema":1,"source_hashes":{"TR25Family.lean":"wrong"}}',
        ):
            root = self.fixture()
            (root / verify.SOURCE_HASHES_PATH).write_bytes(raw)
            with self.subTest(raw=raw), patch.object(
                    verify, "SOURCE_HASHES_SHA256", hashlib.sha256(raw).hexdigest()):
                with self.assertRaises(verify.AuditError):
                    verify.check_source_hashes(root)

    def test_fixed_sources_cannot_be_spoofed_by_comments(self):
        for name in verify.FIXED_SOURCE_HASHES:
            root = self.fixture()
            path = root / name
            path.write_text("/-\n" + path.read_text(encoding="utf-8") + "\n-/\n",
                            encoding="utf-8")
            with self.subTest(name=name), self.assertRaises(verify.AuditError):
                verify.check_sources(root)

    def test_required_file_missing(self):
        for name in verify.REQUIRED_SOURCES:
            root = self.fixture()
            (root / name).unlink()
            with self.subTest(name=name), self.assertRaises(verify.AuditError):
                verify.check_sources(root)

    def test_forged_axiom_probe(self):
        root = self.fixture()
        (root / "audit" / "Axioms.lean").write_text(
            '#eval IO.println "' + VALID_OUTPUT.strip() + '"\n', encoding="utf-8")
        with self.assertRaises(verify.AuditError):
            verify.check_sources(root)

    def test_unexpected_lean_file(self):
        root = self.fixture()
        (root / "Unbuilt.lean").write_text("theorem unused : True := by trivial\n", encoding="utf-8")
        with self.assertRaises(verify.AuditError):
            verify.check_sources(root)

    def test_symlink_file_and_directory(self):
        for directory in (False, True):
            root = self.fixture()
            target = root / "TR25Family" if directory else root / "TR25Family.lean"
            link = root / ("Linked" if directory else "Linked.lean")
            link.symlink_to(target, target_is_directory=directory)
            with self.subTest(directory=directory), self.assertRaises(verify.AuditError):
                verify.check_sources(root)

    def test_execution_failure_cannot_be_hidden_by_valid_output(self):
        with redirect_stdout(io.StringIO()), redirect_stderr(io.StringIO()):
            with self.assertRaises(verify.AuditError):
                verify.run_checked([sys.executable, "-c",
                                    f"print({VALID_OUTPUT!r}); raise SystemExit(7)"], verify.ROOT)
            with self.assertRaises(verify.AuditError):
                verify.run_checked(["./missing-audit-command"], verify.ROOT)
            result = verify.run_checked([sys.executable, "-c", f"print({VALID_OUTPUT!r})"], verify.ROOT)
        self.assertEqual(verify.parse_axioms(result.stdout), verify.EXPECTED_AXIOMS)

    def test_all_modules_built_after_local_dependencies(self):
        sources = {
            "TR25Family.lean": b"import TR25Family.C\n",
            "TR25Family/A.lean": b"import TR25Family.B\n",
            "TR25Family/B.lean": b"import Mathlib\n",
            "TR25Family/C.lean": b"import TR25Family.A TR25Family.B -- prerequisites\n",
            "TR25Family/Unimported.lean": b"import TR25Family.B\n",
            "audit/Axioms.lean": verify.AXIOMS_SOURCE.encode(),
        }
        ordered = verify.module_order(sources)
        self.assertEqual(set(ordered), {"TR25Family", "TR25Family.A", "TR25Family.B", "TR25Family.C", "TR25Family.Unimported"})
        self.assertEqual(len(ordered), 5)
        for earlier, later in [("TR25Family.B", "TR25Family.A"), ("TR25Family.A", "TR25Family.C"),
                               ("TR25Family.C", "TR25Family"), ("TR25Family.B", "TR25Family.Unimported")]:
            self.assertLess(ordered.index(earlier), ordered.index(later))

    def test_missing_imports_and_cycles_rejected(self):
        for sources in (
            {"TR25Family.lean": b"import TR25Family.Missing\n"},
            {"TR25Family.lean": b"import TR25Family.A\n", "TR25Family/A.lean": b"import TR25Family\n"},
        ):
            with self.subTest(sources=sources), self.assertRaises(verify.AuditError):
                verify.module_order(sources)


if __name__ == "__main__":
    unittest.main()
