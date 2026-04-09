# Uniformity trial of rice in India

Uniformity trial of rice in India

## Usage

``` r
data("athulya.rice.uniformity")
```

## Format

A data frame with 400 observations on the following 3 variables.

- `row`:

  row ordinate

- `col`:

  column ordinate

- `yield`:

  yield per plot, grams

## Details

A uniformity trial of paddy rice (*Oryza sativa*) grown at the
Integrated Farming System Research Station, Karamana, Kerala, India, in
2018. The data values were reported as percent of mean in the source
document, so we converted the values to absolute grams using the mean
yield of 391.13 g per plot as reported in the source.

Field width: 20 columns x 1.2 m = 24 m

Field length: 20 rows x 1.2 m = 24 m

Data are from page 56 of the thesis (normalized yield on basic units).

Data provenance: OCR performed by Claude on page 56 of the source. hese
Hand-corrected by K.Wright.

## Source

Athulya, C.K. (2017). Comparison of methods for optimum plot size and
shape for field experiments on paddy (*Oryza sativa*). M.S. Thesis,
Kerala Agricultural University.

## References

None

## Examples

``` r
if (FALSE) { # \dontrun{
  library(agridat)
  data(athulya.rice.uniformity)
  dat <- athulya.rice.uniformity

  mean(dat$yield) # source says 391.13

  libs(desplot)
  desplot(dat, yield ~ col*row,
          flip=TRUE, tick=TRUE, aspect=1.2/1.2,
          main="athulya.rice.uniformity")

} # }
```
