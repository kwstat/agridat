# Uniformity trial of beans in El Salvador

Uniformity trial of beans in El Salvador.

## Usage

``` r
data("aguileracarreras.bean.uniformity")
```

## Format

A data frame with 240 observations on the following 3 variables.

- `row`:

  row ordinate

- `col`:

  column ordinate

- `yield`:

  yield per plot, in grams

## Details

The experiment was grown near Santa Ana, El Salvador, in 1964.

The experimental plot was divided into 256 plots of 5 x 5 m each. In
each of the 256 plots, soil samples were taken — consisting of six
borings from 0 to 30 cm in depth — for the determination of phosphorus
and potassium levels. In June 1964 the plots were planted to coffee,
then in August 1964 a crop of beans was planted in double rows between
the coffee trees.

Although the primary objective of the experiment related to coffee, a
uniformity study was conducted with bean Phaseolus vulgaris of the
variety Porrillo No 1. The reason for using bean was the need to use a
crop that could be harvested in a relatively short period of time.

Field width: 16 columns x 5 m = 80 m

Field length: 16 rows x 5 m = 80 m

Data provenance: OCR performed by Claude. Hand-corrected by K.Wright.

## Source

Aguilera Carreras, José Rutilio (1969). Heterogeneidad de un suelo
latosol pardo forestal en un lote experimental de fertilización en café.
Thesis, University of El Salvador.
https://hdl.handle.net/20.500.14492/29100

## References

None

## Examples

``` r
if (FALSE) { # \dontrun{
library(agridat)
data(aguileracarreras.bean.uniformity)
dat <- aguileracarreras.bean.uniformity

mean(dat$yield)

libs(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, tick=TRUE, aspect=(16*5)/(16*5),
        main="aguileracarreras.bean.uniformity")

} # }
```
