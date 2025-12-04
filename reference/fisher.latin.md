# Latin square experiment on mangolds

Latin square experiment on mangolds. Used by R. A. Fisher.

## Usage

``` r
data("fisher.latin")
```

## Format

A data frame with 25 observations on the following 4 variables.

- `trt`:

  treatment factor, 5 levels

- `yield`:

  yield

- `row`:

  row

- `col`:

  column

## Details

Yields are root weights. Data originally collected by Mercer and Hall as
part of a uniformity trial.

This data is the same as the data from columns 1-5, rows 16-20, of the
mercer.mangold.uniformity data in this package.

Unsurprisingly, there are no significant treatment differences.

## Source

Mercer, WB and Hall, AD, 1911. The experimental error of field trials
The Journal of Agricultural Science, 4, 107-132. Table 1.
http::/doi.org/10.1017/S002185960000160X

R. A. Fisher. *Statistical Methods for Research Workers*.

## Examples

``` r
library(agridat)

data(fisher.latin)
dat <- fisher.latin

# Standard latin-square analysis
m1 <- lm(yield ~ trt + factor(row) + factor(col), data=dat)
anova(m1)
#> Analysis of Variance Table
#> 
#> Response: yield
#>             Df Sum Sq Mean Sq F value   Pr(>F)   
#> trt          4  330.2   82.56  0.5647 0.692978   
#> factor(row)  4 4240.2 1060.06  7.2511 0.003294 **
#> factor(col)  4  701.8  175.46  1.2002 0.360412   
#> Residuals   12 1754.3  146.19                    
#> ---
#> Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```
