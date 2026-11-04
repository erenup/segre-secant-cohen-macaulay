#!/usr/bin/env python3
"""Independent integer checker for the two-decomposition TR-25 witness.

This checks the finite existence input, not the commutative-algebra proof.
No assertion statements, third-party libraries, floating point, or CAS.
"""
import argparse
import copy
import json
from fractions import Fraction
from pathlib import Path


def require(ok, message):
    if not ok:
        raise SystemExit("FAIL: " + message)


def tensor(a, b, c):
    return [x * y * z for x in a for y in b for z in c]


def total(terms):
    columns = [tensor(t["a"], t["b"], t["c"]) for t in terms]
    return [sum(row) for row in zip(*columns)]


def normalized_point(t):
    # Projective rank-one direction; coefficients do not affect this key.
    out = []
    for key in ("a", "b", "c"):
        v = t[key]
        x = next((x for x in v if x), None)
        require(x is not None, "zero factor")
        out.append(tuple(Fraction(y, x) for y in v))
    return tuple(out)


def rank_mod_columns(columns, prime):
    """Column elimination over the prime field; gives an exact Q-rank bound."""
    pivots = {}
    for source in columns:
        col = [x % prime for x in source]
        for row, pivot in sorted(pivots.items()):
            if col[row]:
                c = col[row]
                col = [(x - c * y) % prime for x, y in zip(col, pivot)]
        row = next((i for i, x in enumerate(col) if x), None)
        if row is not None:
            inv = pow(col[row], -1, prime)
            pivots[row] = [(x * inv) % prime for x in col]
    return len(pivots)


def tangent_columns(terms):
    columns = []
    for t in terms:
        for key in ("a", "b", "c"):
            for index in range(len(t[key])):
                u = dict(t)
                u[key] = [int(i == index) for i in range(len(t[key]))]
                columns.append(tensor(u["a"], u["b"], u["c"]))
    return columns


def embed(terms, dims):
    return [{key: t[key] + [0] * (dims[i] - len(t[key]))
             for i, key in enumerate(("a", "b", "c"))} for t in terms]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("witness", nargs="?", default=str(Path(__file__).with_name("witness.json")))
    parser.add_argument("--negative-control", choices=("equality", "rank", "distinct"))
    args = parser.parse_args()
    data = json.loads(Path(args.witness).read_text())
    require(data.get("format") == [3, 3, 5], "small format")
    require(data.get("embedding_format") == [6, 6, 6], "embedding format")
    require(data.get("r") == 5, "rank threshold")
    decs = data.get("decompositions")
    require(isinstance(decs, list) and len(decs) == 2, "two decompositions required")
    for terms in decs:
        require(isinstance(terms, list) and len(terms) == 5, "five terms required")
        for t in terms:
            require(isinstance(t, dict) and set(t) == {"a", "b", "c"}, "factor keys")
            for key, size in zip(("a", "b", "c"), (3, 3, 5)):
                require(isinstance(t[key], list) and len(t[key]) == size, "factor length")
                require(all(type(x) is int for x in t[key]), "integer entries required")
    if args.negative_control == "equality":
        decs[1][0]["a"][0] += 1
    elif args.negative_control == "rank":
        # A common linear map preserves equality but destroys immersion.
        for terms in decs:
            for t in terms:
                t["a"] = [sum(t["a"]), 0, 0]
    elif args.negative_control == "distinct":
        decs[1] = copy.deepcopy(decs[0])
    for terms in decs:
        points = [normalized_point(t) for t in terms]
        require(len(set(points)) == 5, "repeated summand direction")
    require(total(decs[0]) == total(decs[1]), "tensor equality")
    require(set(map(normalized_point, decs[0])) != set(map(normalized_point, decs[1])),
            "decompositions must be distinct even after scaling and permutation")
    # The third-mode flattening has rank five; this also proves border rank>=5.
    prime = 1000003
    require(all(prime % q for q in range(2, 1001)), "modulus must be prime")
    small_ranks = []
    large_ranks = []
    pair_ranks = []
    for terms in decs:
        pairs = []
        for k1, k2 in (("a", "b"), ("a", "c"), ("b", "c")):
            columns = [[x * y for x in t[k1] for y in t[k2]] for t in terms]
            pairs.append(rank_mod_columns(columns, prime))
        require(pairs == [5, 5, 5], "pair-product independence")
        pair_ranks.append(pairs)
        rank = rank_mod_columns(tangent_columns(terms), prime)
        require(rank == 45, "small tangent rank must be 45")
        small_ranks.append(rank)
        rank = rank_mod_columns(tangent_columns(embed(terms, [6, 6, 6])), prime)
        require(rank == 80, "embedded tangent rank must be 80")
        large_ranks.append(rank)
    val = total(decs[0])
    flattening = [[val[(i * 3 + j) * 5 + k] for i in range(3) for j in range(3)]
                  for k in range(5)]
    require(rank_mod_columns(flattening, prime) == 5, "flattening rank five")
    # Upper tangent ranks are 5*(sum(dims)-2), because each nonzero
    # summand has two independent scaling-kernel directions. Thus the
    # modular lower bounds certify the exact rational ranks stated.
    print(json.dumps({"status": "PASS", "tensor_equality": "integer exact",
                      "distinct_decompositions": True, "border_rank": 5,
                      "pair_product_ranks": pair_ranks,
                      "small_tangent_ranks": small_ranks,
                      "embedded_tangent_ranks": large_ranks,
                      "prime": prime}, sort_keys=True))


if __name__ == "__main__":
    main()
