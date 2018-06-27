# agridat 1.14

## Test environments

* local: R 3.5.0 on Windows 7
* win-builder: R-release
* win-builder: R-devel

## Results from Rcmd check

```
Found the following (possibly) invalid URLs:
  URL: http://
    From: inst/doc/agridat_data.html
    Status: Error
    Message: libcurl error code 3:
      	Bad URL
  URL: https://www.ideals.illinois.edu/handle/2142/3528
    From: inst/doc/agridat_data.html
    Status: 503
    Message: Service Unavailable
```

This URL claims to be temporarily down for maintenance.

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

