# Uniformity trial of melon in Guatemala

A uniformity trial of melon in Guatemala

## Usage

``` r
data("buesocampos.melon.uniformity")
```

## Format

A data frame with 480 observations on the following 3 variables.

- `row`:

  row ordinate

- `col`:

  column ordinate

- `yield`:

  yield in kg per plot

## Details

Melon experiment conducted at Ciudad de Esquipulsa, Chiquimula,
Guatemala, circa 1984. Latitude 14 deg 47 min 55 sec. Longitude 89 deg
32 min 48 sec. Layout was 20 rows of 24 m.

Field length: 24 plots \* 1m = 24 m

Field width: 20 plots \* 1.8m = 36 m

Data provenance: OCR by Claude Sonnet. Checked by K.Wright.

## Source

﻿Bueso Campos, Marlon Leonel (1985). Determinación del tamaño óptimo de
parcela experimental en melón (Cucumis melo) para el departamento de
Chiquimula, y en tomate (Lycopersicon esculentum) para el Valle de la
Fragua, Zacapa. Thesis (Ingeniero Agrónomo). University of San Carlos,
Guatemala. https://biblos.usac.edu.gt/opac/record/125516

## References

None

## Examples

``` r
if (FALSE) { # \dontrun{
mean(dat$yield) 
var(dat$yield)

require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, tick=TRUE, aspect=(24*1)/(20*1.8),
        main="buesocampos.melon.uniformity")
} # }
```
