# Latin square experiment for testing fungicide

Latin square experiment for testing fungicide

## Usage

``` r
data("goulden.latin")
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

Five treatments were tested to control stem rust in wheat. Treatment
codes and descriptions: A = Dusted before rains. B = Dusted after rains.
C = Dusted once each week. D = Drifting, once each week. E = Not dusted.

## Source

Cyrus H. Goulden (1952). *Methods of Statistical Analysis*, 2nd ed. Page
216.

## Examples

``` r
if (FALSE) { # \dontrun{

library(agridat)
library(agridat)
data(goulden.latin)
dat <- goulden.latin


libs(desplot)
desplot(dat, yield ~ col*row,
        text=trt, cex=1, # aspect unknown
        main="goulden.latin")


# Matches Goulden.
m1 <- lm(yield~ trt + factor(row) + factor(col), data=dat)
anova(m1)

} # }
```
