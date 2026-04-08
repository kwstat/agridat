# Uniformity trial of maize in Nicaragua

Uniformity trial of maize in Nicaragua

## Usage

``` r
data("matusgutierrez.maize.uniformity")
```

## Format

A data frame with 576 observations on the following 3 variables.

- `row`:

  row ordinate

- `col`:

  column ordinate

- `yield`:

  yield per plot, kg

## Details

The experiment was located at 12 deg 3 min North, 86 deg 6 min West in
Nicaragua. Conducted 1989. The layout was rows 48 m long with spacing
0.75 m between rows. Each row was divided into basic units 3 m long, 16
per row. Total 576 basic units, each 2.25 m^2.

Field length: 36 plots \* .75 m = 27 m

Field width: 16 plots \* 3 m = 48 m

Data provenance: Data appear on page 28 in dot matrix print. OCR by
ChatGPT. Manually (and tediously) corrected by K.Wright. The sorted data
values increase by multiples of 0.0181. This was very useful in
correcting the OCR errors of the dot matrix printout.

## Source

Matus Gutiérrez, Francisco Otoniel. (1990). Influencia del tamaño-forma
de la parcela experimental y el número de repeticiones sobre la
precisión de los datos experimentales, en el cultivo del maíz (Zea mays
L.) Dissertation, Universidad Nacional Agraria, UNA. Nicaragua.

## References

None

## Examples

``` r
if (FALSE) { # \dontrun{
library(agridat)
data(matusgutierrez.maize.uniformity)
dat <- matusgutierrez.maize.uniformity
require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, tick=TRUE, aspect=(36*0.75)/(16*3),
        main="matusgutierrez.maize.uniformity")
} # }
```
