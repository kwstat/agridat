# Uniformity trial of rice

Uniformity trial of rice in Burma, 1948.

## Usage

``` r
data("khin.rice.uniformity")
```

## Format

A data frame with 1080 observations on the following 3 variables.

- `row`:

  row

- `col`:

  column

- `yield`:

  yield, oz/plot

## Details

A uniformity trial of rice. Conducted at the Mudon Agricultural Station,
Burma, in 1947-48. Basic plots were 3 feet square.

Field width: 30 plots \* 3 feet.

Field length: 36 plots \* 3 feet.

Transcription details: Data typed by K.Wright.

## Source

Khin, San. 1950. Investigation into the relative costs of rice
experiments based on the efficiency of designs. Dissertation: Imperial
College of Tropical Agriculture (ICTA). Appendix XV.
https://hdl.handle.net/2139/42422

## References

None.

## Examples

``` r
if (FALSE) { # \dontrun{

library(agridat)
  
  data(khin.rice.uniformity)
  dat <- khin.rice.uniformity

  libs(desplot)
  desplot(dat, yield ~ col*row,
          flip=TRUE,
          main="khin.rice.uniformity",
          aspect=(36*3)/(30*3)) # true aspect
  
} # }
```
