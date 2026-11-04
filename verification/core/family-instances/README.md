# Finite-instance checks for the family witnesses

[check_reach_instances.py](check_reach_instances.py) constructs, for each
instance, the two integer decompositions of the family witness from the
displayed formulas. It checks tensor equality and distinctness of the two
decompositions exactly over the integers, independence of the matrix
factors and of the third factors modulo the prime 101, and that both
addition differentials have rank `r(a+b+c-2)` modulo 101. The modular ranks
give lower bounds over the rationals; the two scaling-kernel directions per
pure tensor give the matching upper bound. No floating-point operation is
used.

The positive suite covers all 15 pairs `(r,p)` with `5<=r<=9` and
`3<=p<=r-2`, putting `q=r+1-p`: each seed in format `p×q×r` and each padded
witness in `p×(q+1)×r`, together with the extension from `4×5×8` to
`5×5×8`, which is 31 pairs of decompositions.
[run_checks.py](run_checks.py) runs the suite under `python3 -I` and
`python3 -I -O`, requires identical positive output, and requires each of
four negative controls (tensor equality, distinctness, factor independence,
an avoidance vector) to be rejected in both modes.
It rewrites the recorded outputs [check_normal.log](check_normal.log),
[check_optimized.log](check_optimized.log) and [check_harness.log](check_harness.log)
with identical content.

These checks corroborate the paper's all-rank proof; they do not replace
any quantifier in it.
