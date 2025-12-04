# Group balanced split-plot design in rice

Group balanced split-plot design in rice

## Format

A data frame with 270 observations on the following 7 variables.

- `col`:

  column

- `row`:

  row

- `rep`:

  replicate factor, 3 levels

- `fert`:

  fertilizer factor, 2 levels

- `gen`:

  genotype factor, 45 levels

- `group`:

  grouping (genotype) factor, 3 levels

- `yield`:

  yield of rice

## Details

Genotype group S1 is less than 105 days growth duration, S2 is 105-115
days growth duration, S3 is more than 115 days.

Used with permission of Kwanchai Gomez.

## Source

Gomez, K.A. and Gomez, A.A.. 1984, Statistical Procedures for
Agricultural Research. Wiley-Interscience. Page 120.

## Examples

``` r
library(agridat)
data(gomez.groupsplit)
dat <- gomez.groupsplit

# Gomez figure 3.10.  Obvious fert and group effects
libs(desplot)
desplot(dat, group ~ col*row,
        out1=rep, col=fert, text=gen, # aspect unknown
        main="gomez.groupsplit")


# Gomez table 3.19 (not partitioned by group)
m1 <- aov(yield ~ fert*group + gen:group + fert:gen:group +
            Error(rep/fert/group), data=dat)
summary(m1)
#> 
#> Error: rep
#>           Df Sum Sq Mean Sq F value Pr(>F)
#> Residuals  2  4.917   2.458               
#> 
#> Error: rep:fert
#>           Df Sum Sq Mean Sq F value Pr(>F)  
#> fert       1  96.05   96.05    68.7 0.0142 *
#> Residuals  2   2.80    1.40                 
#> ---
#> Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#> 
#> Error: rep:fert:group
#>            Df Sum Sq Mean Sq F value Pr(>F)  
#> group       2  4.259  2.1294   6.674 0.0197 *
#> fert:group  2  0.628  0.3138   0.984 0.4150  
#> Residuals   8  2.553  0.3191                 
#> ---
#> Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#> 
#> Error: Within
#>                 Df Sum Sq Mean Sq F value   Pr(>F)    
#> group:gen       42 20.494  0.4880   4.461 2.08e-12 ***
#> fert:group:gen  42  4.093  0.0975   0.891    0.662    
#> Residuals      168 18.378  0.1094                     
#> ---
#> Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```
