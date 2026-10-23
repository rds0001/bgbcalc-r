## Local check

R 4.6.1, Linux: R CMD check --as-cran --timings
0 errors, 0 warnings, 1 NOTE (new submission / maintainer).
Elapsed time: 150.72 seconds; tests: 33 seconds; examples: 14 seconds.
All 552 documented functions and all 15,718 reference cases were checked.
Python/R result parity passed for all reference cases.

## Submission status

Prepared for CRAN checks; not submitted to CRAN. Cross-platform checks are
configured in .github/workflows/r-package.yml. Conditional arithmetic models
and coverage limitations are documented in inst/MODELLE.md and the README.
