# Exact verification

Run from the repository root with Python 3.11 or later:

```sh
python3 -S -s -B verification/run.py
python3 -S -s -B -O verification/run.py
```

[run.py](run.py) authenticates every file in this directory against
[SHA256SUMS](SHA256SUMS), binds the two child runners and their manifests by
digest, runs each child in normal, optimized and alternate hash-seed modes,
requires the recorded output in each mode, and rejects altered inventories.

- [core/proofs/](core/proofs/): the plain-text statement and proof of the original 6×6×6 case.
- [core/verification/](core/verification/): exact checks for the fixed witness; its runner
  also executes the normalization suites. See its [guide](core/verification/README.md).
- [core/normalization/](core/normalization/): plain-text proofs and exact checks for the
  normalization fibres, local rings, boundary models and higher-rank results.
- [core/families/](core/families/): plain-text statements and proofs for the families.
- [core/family-instances/](core/family-instances/): finite-instance checks of the family
  witnesses; see its [guide](core/family-instances/README.md).

These finite checks support the written proofs; they do not replace any
all-parameter statement.
