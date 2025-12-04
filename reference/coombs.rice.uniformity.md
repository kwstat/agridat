# Uniformity trial of rice in Malaysia

Uniformity trial of rice in Malaysia

## Usage

``` r
data("coombs.rice.uniformity")
```

## Format

A data frame with 54 observations on the following 3 variables.

- `row`:

  row

- `col`:

  column

- `yield`:

  yield in gantangs per plot

## Details

Estimated harvest date is 1915 or earlier.

Field length, 18 plots \* 1/2 chain.

Field width, 3 plots \* 1/2 chain.

## Source

Coombs, G. E. and J. Grantham (1916). Field Experiments and the
Interpretation of their results. The Agriculture Bulletin of the
Federated Malay States, No 7.
https://www.google.com/books/edition/The_Agricultural_Bulletin_of_the_Federat/M2E4AQAAMAAJ

## References

None

## Examples

``` r
if (FALSE) { # \dontrun{
  library(agridat)
  data(coombs.rice.uniformity)
  dat <- coombs.rice.uniformity

  # Data check. Matches Coombs 709.4
  # sum(dat$yield)

  # There are an excess number of 12s and 14s in the yield
  libs(lattice)
  qqmath( ~ yield, dat) # weird
  
  libs(desplot)
  desplot(dat, yield ~ col*row,
          main="coombs.rice.uniformity",
          flip=TRUE, aspect=(18 / 3))
} # }
```
