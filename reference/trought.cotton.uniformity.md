# Uniformity trial of cotton in Sudan

Uniformity trial of cotton in Sudan, 1936

## Usage

``` r
data("trought.cotton.uniformity")
```

## Format

A data frame with 192 observations on the following 3 variables.

- `row`:

  row ordinate

- `col`:

  column ordinate

- `yield`:

  yield in grams per plot

## Details

An experiment conducted in Wad Medani, Sudan, in 1936.

Field width: 8 plots \* 12.5 m = 100 m

Field length: 24 ridges \* 0.9 m = 21.6 m

Data provenance: Scanned with iPhone, cleaned and formatted by K.Wright.

## Source

Rothamsted Research Library, Box STATS17 WG Cochran, Folder 6.

## References

None

## Examples

``` r
if (FALSE) { # \dontrun{
  library(agridat)
  data(trought.cotton.uniformity)
  dat <- trought.cotton.uniformity
  
  libs(desplot)
  desplot(dat, yield ~ col*row,
          flip=TRUE, tick=TRUE, aspect=(24*.9)/(8*12.5),
          main="trought.cotton.uniformity")
} # }
```
