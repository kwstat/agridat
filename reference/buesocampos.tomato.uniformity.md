# A uniformity trial of tomato in Guatemala

A uniformity trial of tomato in Guatemala

## Usage

``` r
data("buesocampos.tomato.uniformity")
```

## Format

A data frame with 260 observations on the following 3 variables.

- `row`:

  row ordinate

- `col`:

  column ordinate

- `yield`:

  yield in kg per plot

## Details

Tomato experiment conducted at La Fragua, Zacapa, Guatemala, circa 1984.
Latitude 14 deg 57 min 51 sec. Longitude 89 deg 35 min 04 sec.) Basic
units 3.6 m^2, 0.9m x 4m. (26 rows of 40 m length).

Field length: 26 rows \* 0.9m = 23.4m

Field width: 10 plots \* 4m = 40m

Data provenance: OCR by Claude Sonnet. Checked by K.Wright.

## Source

Bueso Campos, Marlon Leonel (1985). Determinación del tamaño óptimo de
parcela experimental en melón (Cucumis melo) para el departamento de
Chiquimula, y en tomate (Lycopersicon esculentum) para el Valle de la
Fragua, Zacapa. Thesis (Ingeniero Agrónomo). University of San Carlos,
Guatemala. https://biblos.usac.edu.gt/opac/record/125516

## References

None

## Examples

``` r
if (FALSE) { # \dontrun{
library(agridat)
data(buesocampos.tomato.uniformity)
dat <- buesocampos.tomato.uniformity

mean(dat$yield) # 5.1185 match page 43
var(dat$yield) # 2.7347 matches

require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, tick=TRUE, aspect=(26*0.9)/(10*4),
        main="buesocampos.tomato.uniformity")
} # }
```
