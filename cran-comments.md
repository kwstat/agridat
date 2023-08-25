# agridat 1.22

* Switched the package to MIT license.
* Fix docType{package} for CRAN.

## Test environments and results

1. R 4.1.3 on Windows 10, devtools::check(cran=TRUE)
2. WinBuilder Devel.
3. Rhub

OK (Except usual random notes from Rhub)

## revdepcheck results

We checked 7 reverse dependencies (6 from CRAN + 1 from Bioconductor), comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 1 packages

Issues with CRAN packages are summarised below.

### Failed to check

* spaMM (NA) # Note, this is a "Suggests" package.


# ----------

# agridat 1.21

This release fixes a minor problem identified by CRAN.

## Test environments and results

1. R 4.1.3 on Windows 10, devtools::check(cran=TRUE)
2. devtools::check_win_devel()
3. devtools::check_win_release()
4. devtools::check_win_oldrelease()

Results:

1. R-oldrelease was OK.

2. There may be a NOTE about possibly invalid URLs.  I have checked the URLs by hand and they all work (but sometimes are slow).

3. WinRelease gave many notes like this: 
```
aastveit.barley.Rd:17:1: Warning: <table> attribute "width" not allowed for HTML5.  
```
Other platforms did not give this warning, so I assume this is spurious. CRAN check page does not show this problem: https://cran.r-project.org/web/checks/check_results_kw.stat_at_gmail.com.html


# agridat 1.19

## CRAN package status check

https://cran.r-project.org/web/checks/check_results_kw.stat_at_gmail.com.html
Current CRAN status: OK: 12

## Test environments and results

1. R 4.1.1 on Windows 10
2. WinBuilder: R devel
3. Rhub: Windows Server 2022, R-devel, 64 bit

Status.  OK on some platforms. WinBuilder has 2 notes.

1. Found the following (possibly) invalid URLs:
  URL: https://www.jstor.org/stable/3001959
    From: inst/doc/agridat_data.html
   
Hand-checked that this is a valid URL.

2. Examples with CPU (user + system) or elapsed time > 10s
            user system elapsed

This was caused by an example with a simple graphic that (on my computer) takes less than 1 second to draw.  I wrapped that example with dontrun{} and then this NOTE appeared for a DIFFERENT example.  I wonder if the NOTE really means that loading the graphics library for the first time  is slow???


## Downstream dependencies

revdep() # desplot, gge

Checked OK.


# agridat 1.18

This release fixes the vignettes to conditionally load "Suggests" packages.

## CRAN package status check

https://cran.r-project.org/web/checks/check_results_kw.stat_at_gmail.com.html
Current CRAN status: OK: 12

## Test environments and results

1. local: R 4.0.3 on Windows 10
2. Win-Builder: R devel
3. Win-Builder: R old release

Status: OK

## Downstream dependencies

revdep() # desplot, gge

Checked OK.


# agridat 1.17

## CRAN package status check

https://cran.r-project.org/web/checks/check_results_kw.stat_at_gmail.com.html
Current CRAN status: ERROR: 1, OK: 11 
The 1 ERROR is on the r-oldrel-macos-x86_64 platform, caused by a missing "stringi" package.

## Test environments and results

1. local: R 4.0.2 on Windows 10

Status: OK

2. Win-Builder: devtools::check_win_devel()

0 errors, 0 warnings, 1 note
Note: Found the following (possibly) invalid URLs:
I hand-checked these URLs are valid.

3. rhub::check_for_cran()

OK: Windows Server 2008

## Downstream dependencies

revdep() # desplot, gge

Checked OK.


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

