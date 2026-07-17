# Uniformity trial of tomato

Uniformity trial of tomato in Australia

## Usage

``` r
data("strickland.tomato.uniformity")
```

## Format

A data frame with 180 observations on the following 3 variables.

- `row`:

  row

- `col`:

  column

- `yield`:

  yield per plot, pounds

## Details

Strikland (1934) says the trial was located at Bendigo, Victoria, during
the years 1932-1933.

Tomato plants were placed 2 feet apart in rows 4 feet apart. Each plot
contained 6 plants.

Field dimensions are not given, but the most likely design is:

Field length: 6 plots \* 6 plants \* 2 feet = 72 feet

Field width: 30 plots \* 4 feet = 120 feet

## Source

A. G. Strickland (1935). Error in horticultural experiments. Journal of
Agriculture, Victoria, 33, 408-416.
https://handle.slv.vic.gov.au/10381/386642

## References

A.G. Strickland (1934). Tomato Investigations: Results of Bendigo Tests.
Journal of Agriculture, Victoria, 32, 335-346.
https://archive.org/details/journaldepartmev32pvicte/page/334/

## Examples

``` r
if (FALSE) { # \dontrun{

library(agridat)
  data(strickland.tomato.uniformity)
  dat <- strickland.tomato.uniformity

  mean(dat$yield)
  sd(dat$yield)

  libs(desplot)
  desplot(dat, yield ~ col*row,
          main="strickland.tomato.uniformity",
          flip=TRUE, aspect=(6*12)/(30*4))
} # }
```
