# Uniformity trial of sorghum in Nicaragua

Uniformity trial of sorghum in Nicaragua 1988.

## Usage

``` r
data("lechadolopez.sorghum.uniformity")
```

## Format

A data frame with 512 observations on the following 3 variables.

- `row`:

  row ordinate

- `col`:

  column ordinate

- `yield`:

  yield per plot, kg/ha

## Details

Experiment conducted 20 Aug - 23 Dec 1988. Near Managua, Nicaragua. 32
rows of 48 meters length, divided into 3 m plots. Rows separated by 0.75
m. Basic units 2.25 m^2

Field width: 16 columns \* 3 m = 48 m

Field length: 32 rows \* 0.75 m = 12 m

Data provenance: Typed by K.Wright from Lechado López (1989), page 14.
Original data were given with 7 digits. We rounded to 0 decimals. One
high outlier and two low outliers were checked with the original source,
both on page 14 and on page 15 (which gave the sum of two plots in a
row).

## Source

Lechado López, Ines Horacio and Rivera Jirón, Julio Cesar (1989).
Determinación del tamaño óptimo de la parcela experimental en el cultivo
del sorgo (Sorghum bicolor (L.) Moench). Ingeniería thesis, Universidad
Nacional Agraria, UNA. https://repositorio.una.edu.ni/2498/ License
BY-NC-ND.

## References

None

## Examples

``` r
  library(agridat)
  data(lechadolopez.sorghum.uniformity)
  dat <- lechadolopez.sorghum.uniformity

  mean(dat$yield) # 5382 lechado p 14, 4384 here (because we rounded to 0 dec).
#> [1] 5383.684

  libs(desplot)
  desplot(dat, yield ~ col*row,
          flip=TRUE, tick=TRUE, aspect=(32*.75)/(16*3), # true aspect
          main="lechadolopez.sorghum.uniformity")

```
