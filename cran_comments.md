# agridat 1.17

Ordinary periodic release (about one year since previous release).

## Test environments

* local: R 3.6.1 on Windows 7
* win-builder: R-release
* win-builder: R-devel

## Results from local devtools build(), check_built()

R CMD check results
0 errors | 0 warnings | 0 notes

## Results from Rcmd check

Status: OK

## CRAN Package check

https://cran.r-project.org/web/checks/check_results_kw.stat_at_gmail.com.html
The error on this page appears to be a spurious error on one specific flavor.

## Downstream dependencies

devtools::revdep_check() had no failures.


# agridat 1.16

This is a tiny update making a small change requested by the maintainers of the 'broom' package to support the next version of 'broom'.

## Test environments

* local: R 3.5.0 on Windows 7
* win-builder: R-release
* win-builder: R-devel

## Results from Rcmd check

Status: OK
R version 3.5.0 (2018-04-23)

## Results from devtools build(), check_built()

R CMD check results
0 errors | 0 warnings | 0 notes

## Downstream dependencies

devtools::revdep_check() had no failures.

## Thanks to CRAN

Thank you to the following people for help with the following issues.

Ver 1.9: Brian Ripley suggesting `if(require(lme4))` in examples.

Ver 1.8: Brian Ripley fixing a bug caused by another package.

Ver 1.1: Kurt Hornik version numbering.



# agridat 1.15

## Test environments

* local: R 3.5.0 on Windows 7
* win-builder: R-release
* win-builder: R-devel

## Results from Rcmd check

Status: OK
R version 3.5.0 (2018-04-23)

## Results from devtools check(), build(), check_built()

R CMD check results
0 errors | 0 warnings | 0 notes

## Downstream dependencies

devtools::revdep_check() had no failures.

## Thanks to CRAN

Thank you to the following people for help with the following issues.

Ver 1.9: Brian Ripley suggesting `if(require(lme4))` in examples.

Ver 1.8: Brian Ripley fixing a bug caused by another package.

Ver 1.1: Kurt Hornik version numbering.



# agridat 1.13

## Test environments

* local: R 3.4.2 on Windows 7
* win-builder: R-release 3.4.2
* win-builder: R-devel
* R-hub: R-devel

## Rcmd check results

Possibly mis-spelled words in DESCRIPTION:
  Datasets (2:21, 7:14)
  multi (9:5)

## License change

Changed license to: CC BY-SA 4.0 + file LICENSE.note (similar to igraphdata package).

