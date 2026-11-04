#!/usr/bin/env python3
"""Check that the formal statement's literal data match the fixed witness."""
import hashlib
import json
from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parent.parent
EXPECTED = '4f856a7ff466a5f4116ea11b64bcdbafae31e70b9049cd2492e4f78f765d54e6'
DEFINITIONS_SHA256 = '32506bbaac127706ce4eca7a62ce7dd51a5f79b677122840e99950a1ddcb8f9d'

def require(ok, message):
    if not ok:
        raise SystemExit('FAIL: '+message)

def literal(vectors):
    return '![' + ', '.join('![' + ', '.join(map(str, v)) + ']' for v in vectors) + ']'

def check(data, source):
    require(data.get('format') == [3, 3, 5] and data.get('embedding_format') == [6, 6, 6], 'format')
    require(data.get('r') == 5, 'term count')
    require(len(data.get('decompositions', [])) == 2, 'two decompositions')
    expected=[]
    for terms in data['decompositions']:
        require(len(terms)==5, 'five terms')
        for t in terms:
            require(set(t)=={'a','b','c'}, 'factor keys')
            for key, size in [('a',3),('b',3),('c',5)]:
                require(len(t[key])==size and all(type(x) is int for x in t[key]), 'literal factor shape')
        expected.append('{ a := '+literal([t['a'] for t in terms])+', b := '+literal([t['b'] for t in terms])+', c := '+literal([t['c'] for t in terms])+' }')
    match=re.search(r'def small : Fin 2 → Factors 3 3 5 :=\s*(.*?)\n\ndef pad',source,re.S)
    require(match is not None, 'literal definition boundary')
    require(re.sub(r'\s+','',match.group(1))==re.sub(r'\s+','','!['+', '.join(expected)+']'),'literal factors differ')

def main():
    raw=(ROOT/'certificate/witness.json').read_bytes()
    require(hashlib.sha256(raw).hexdigest()==EXPECTED,'witness hash')
    source_raw=(ROOT/'TR25/Definitions.lean').read_bytes()
    require(hashlib.sha256(source_raw).hexdigest()==DEFINITIONS_SHA256,'definitions hash')
    source=source_raw.decode('utf-8')
    data=json.loads(raw)
    check(data,source)
    changed=json.loads(raw)
    changed['decompositions'][1][0]['c'][4]=0
    try:check(changed,source)
    except SystemExit:pass
    else:raise SystemExit('FAIL: corrupted-factor control accepted')
    try:check(data,source.replace('Fin 2 → Factors 3 3 5','Fin 2 → Factors 3 3 6'))
    except SystemExit:pass
    else:raise SystemExit('FAIL: changed-type control accepted')
    print('PASS: literal factors bind to the fixed witness; two negative controls rejected.')

if __name__=='__main__':
    main()
