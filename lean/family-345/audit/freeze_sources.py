#!/usr/bin/env python3
"""Explicitly freeze the complete proof inventory after sources are stable.

This maintenance command is never called by the verifier or its tests.
"""
import argparse
import hashlib
import json
from pathlib import Path
import re
import sys

sys.dont_write_bytecode = True
import verify

def need(ok, message):
    if not ok:
        raise SystemExit('FAIL: ' + message)

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--freeze', action='store_true', required=True)
    parser.parse_args()
    root = verify.ROOT
    verify.check_configuration(root)
    hashes = {}
    for path in verify.source_paths(root):
        name = path.relative_to(root).as_posix()
        raw = path.read_bytes()
        verify.reject_forbidden(raw.decode('utf-8'), name)
        if name == 'audit/Axioms.lean':
            need(raw == verify.AXIOMS_SOURCE.encode(), 'axiom probe changed')
            continue
        need(verify.MODULE_PATH.fullmatch(name) is not None, 'unexpected proof source: ' + name)
        hashes[name] = hashlib.sha256(raw).hexdigest()
    need(verify.REQUIRED_SOURCES - {'audit/Axioms.lean'} <= hashes.keys(), 'required sources missing')
    for name, expected in verify.FIXED_SOURCE_HASHES.items():
        need(hashes.get(name) == expected, 'fixed definitions or statement changed: ' + name)
    raw = (json.dumps({'schema': 1, 'source_hashes': hashes}, indent=2, sort_keys=True) + '\n').encode()
    helpers = {}
    for name in sorted(verify.AUDIT_SOURCES - {'audit/verify.py'}):
        path = root / name
        need(path.is_file() and not path.is_symlink(), 'missing or linked audit helper: ' + name)
        helpers[name] = hashlib.sha256(path.read_bytes()).hexdigest()
    path = root / 'audit/verify.py'
    source = path.read_text()
    source, count = re.subn(r'^SOURCE_HASHES_SHA256 = "[^"\n]+"$',
        'SOURCE_HASHES_SHA256 = "' + hashlib.sha256(raw).hexdigest() + '"', source, flags=re.M)
    need(count == 1, 'source-manifest pin boundary')
    source, count = re.subn(r'^AUDIT_SOURCE_HASHES = \{[^\n]*\}$',
        'AUDIT_SOURCE_HASHES = ' + repr(helpers), source, flags=re.M)
    need(count == 1, 'audit-helper pin boundary')
    (root / verify.SOURCE_HASHES_PATH).write_bytes(raw)
    path.write_text(source)
    print('FROZEN: ' + str(len(hashes)) + ' proof modules; source manifest ' + hashlib.sha256(raw).hexdigest())

if __name__ == '__main__':
    try:
        main()
    except (verify.AuditError, OSError, UnicodeError) as error:
        raise SystemExit('FAIL: ' + str(error))
