# Uniformity trial of beans in Columbia

Uniformity trial of beans in Columbia.

## Usage

``` r
data("baena.bean.uniformity")
```

## Format

A data frame with 1296 observations on the following 3 variables.

- `row`:

  row ordinate

- `col`:

  column ordinate

- `yield`:

  yield per plot, in grams

## Details

The experiment was carried out during the period between Sep 21 and Dec
16, 1976. The sowing was carried out in plot Q₂ of the experimental
field at the International Center for Tropical Agriculture,
CIAT-Palmira, Columbia. Latitude of 3 deg 31 min N and a longitude of 76
deg 19 min W.

The document says (translated): "For the drawing of the fertility
contour map, a standard deviation of unit plot yields (S.D. = 40 g) was
taken as the grouping criterion for plots with homogeneous yields. The
seven classes of homogeneous plots range between 80 and 320 g; plots
with yields above or below the limits were considered in the first or
last class. Figure 1 shows the contour map."

Note: The source document has a heatmap on page 22. I cannot match the
heatmap to the data values given on page 20.

Field width: 36 columns x 1m = 36 m

Field length: 36 rows x 1m = 36 m

Data provenance: OCR performed by Claude. Hand-corrected by K.Wright.

## Source

Baena, D.; Amézquita M. C.; Rodríguez, P. M.; Voysest, O.; y Takegami,
F. (1977). Estudio de la heterogeneidad del suelo, del tamaño y forma de
parcela y el número de repeticiones óptimos en ensayos de uniformidad en
frijol. XXIII Reunión Anual del Programa Cooperativo Centroamericano
para el Mejoramiento de Cultivos y Animales
http://ciat-library.ciat.cgiar.org/articulos_ciat/1977_Estudio_de_la_heterogeneidad_del_suelo.pdf

## References

None

## Examples

``` r
if (FALSE) { # \dontrun{
library(agridat)
data(baena.bean.uniformity)
dat <- baena.bean.uniformity

# Source has mean 183.80, variance 1573.34. We get close by omitting the
# one outlier. (Checked the source data which shows the yield is 450 g.)
filter(dat, yield < 400) |> pull(yield) |> mean() # 183.8672
filter(dat, yield < 400) |> pull(yield) |> var() # 1576.738

libs(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, tick=TRUE, aspect=1,
        at=c(0,seq(80,320,40), 500),
        main="baena.bean.uniformity")

} # }
```
