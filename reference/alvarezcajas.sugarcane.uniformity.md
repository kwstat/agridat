# Uniformity trial of sugarcane in Guatemala

Uniformity trial of sugarcane in Guatemala.

## Usage

``` r
data("alvarezcajas.sugarcane.uniformity")
```

## Format

A data frame with 600 observations on the following 3 variables.

- `row`:

  row ordinate

- `col`:

  column ordinate

- `yield`:

  yield per plot, kg

## Details

A uniformity trial of sugarcane conducted at a commercial sugarcane
plantation located at Finca Bulbuxya, Jurisdiction of the Municipality
of San Miguel Panam, Department of Suchitepéquez, Bulbuxyá, Guatemala.
Harvested 1981. Latitude 14 deg 39 min 39 sec, Longitude 91 deg 22 min.

Field width: 15 columns x 1.6 m = 24 m

Field length: 40 rows x 2 m = 80 m

The mean and standard deviation calculated from this data is slightly
different from the source. The table of basic unit yield values in the
source document contains some values that are very similar, for example
33.1122, 33.1126, 33.1132. It seems likely that these values must have
been identical when the data were collected, but perhaps typed
incorrectly in the source document or similar error at some point.

Data provenance: OCR performed by Claude. Hand-corrected by K.Wright.

## Source

Alvarez Cajas, Victor Manuel (1982). Determinación del tamaño óptimo de
parcela experimental en caña de azúcar (*Saccharum officinarum* L.) bajo
condiciones de la finca Bulbuxyá. Thesis, University of San Carlos,
Guatemala. https://catalogosiidca.csuca.org/Record/USAC.92002

## References

None

## Examples

``` r
if (FALSE) { # \dontrun{
library(agridat)
data(alvarezcajas.sugarcane.uniformity)
dat <- alvarezcajas.sugarcane.uniformity

mean(dat$yield) # 27.21
sd(dat$yield)   # 9.81

libs(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, tick=TRUE, aspect=(40*2)/(15*1.6),
        main="alvarezcajas.sugarcane.uniformity")

} # }
```
