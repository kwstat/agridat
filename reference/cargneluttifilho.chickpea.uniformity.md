# Uniformity trial of chickpea in Brazil

Uniformity trial of chickpea in Brazil, three trials.

## Usage

``` r
data("cargneluttifilho.chickpea.uniformity")
```

## Format

A data frame with 108 observations on the following 4 variables.

- `trial`:

  trial name, T1/T2/T3

- `row`:

  row ordinate

- `col`:

  column ordinate

- `yield`:

  aerial mass per plot, in grams

## Details

Three uniformity trials of chickpea, each with a 6 x 6 grid of basic
units, 1m x 1m each, used to determine optimum plot size for evaluating
shoot (above-ground) mass.

Experiment conducted at Federal University of Santa Maria, Brazil. The
plots were harvested in Dec 2022, 142 days after sowing (90 percent of
the pods mature).

Field width: 6 columns x 1m = 6 m

Field length: 6 rows x 1m = 6 m

Data provenance: Data were extracted from the source publication.

## Source

Cargnelutti Filho, A., Loro, M. V., Ortiz, V. M., & Andretta, J. A.
(2025). Determinacao do tamanho de parcela para avaliar a massa de parte
aerea de grao-de-bico. Vivencias, 21(43), 499-513.
https://doi.org/10.31512/vivencias.v21i43.1246

## References

None

## Examples

``` r
if (FALSE) { # \dontrun{
  library(agridat)
  data(cargneluttifilho.chickpea.uniformity)
  dat <- cargneluttifilho.chickpea.uniformity

  library(dplyr) # Match source paper, table 1
  dat |> group_by(trial) |> summarize(mn=mean(yield), cv=sd(yield)/mean(yield))

  library(desplot)
  desplot(dat, yield ~ col*row|trial,
          flip=TRUE, tick=TRUE, aspect=1,
          main="cargneluttifilho.chickpea.uniformity")
} # }
```
