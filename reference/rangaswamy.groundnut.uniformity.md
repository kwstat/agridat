# Uniformity trial of groundnut

Uniformity trial of groundnut

## Usage

``` r
data("rangaswamy.groundnut.uniformity")
```

## Format

A data frame with 96 observations on the following 3 variables.

- `row`:

  row ordinate

- `col`:

  column ordinate

- `yield`:

  yield, kg/plot

## Details

The year of the experiment is unknown, but before 1995.

Field width: 8 plots x 4 m = 32 m

Field length: 12 plots x .75 m = 8 m

## Source

R. Rangaswamy. (1995). A Text Book of Agricultural Statistics. New Age
International Publishers. Table 19.1. Page 237.
https://www.google.com/books/edition/A_Text_Book_of_Agricultural_Statistics/QDLWE4oakSgC

## References

None

## Examples

``` r
if (FALSE) { # \dontrun{
library(agridat)
data(rangaswamy.groundnut.uniformity)
dat <- rangaswamy.groundnut.uniformity

require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, aspect=(12*.75)/(8*4),
        main="rangaswamy.groundnut.uniformity")

} # }
```
