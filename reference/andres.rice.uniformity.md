# A uniformity trial of rice

A uniformity trial of rice in Ecuador

## Usage

``` r
data("andres.rice.uniformity")
```

## Format

A data frame with 990 observations on the following 3 variables.

- `row`:

  row ordinate

- `col`:

  column ordinate

- `yield`:

  yield per plot, grams

## Details

Uniformity trial conducted in Alfredo Baquerizo Moreno canton of the
Guayas province in Ecuador.

Field width: 33 columns x 0.9 m = 29.7 m

Field length: 30 rows x 1 m = 30 m

## Source

Andrés, Monserrate Gómez Julio (2021). Determinación del tamaño de
unidad experimental para ensayos de arroz (oryza sativa) mediante el
método de máxima curvatura. Doctoral dissertation, Universidad Agraria
del Ecuador). https://cia.uagraria.edu.ec/Archivos/MONSERRATE Table 3,
page 61-63.

## References

None

## Examples

``` r
if (FALSE) { # \dontrun{
  library(agridat)
  data(andres.rice.uniformity)
  dat <- andres.rice.uniformity

  var(dat$yield) # 5611.803 match andres

  libs(desplot)
  desplot(dat, yield ~ col*row,
          flip=TRUE, aspect=(30*1)/(33*0.9),
          main="andres.rice.uniformity")

} # }
```
