# Uniformity trial of soybean

Uniformity trial of soybean in Brazil, 1970.

## Usage

``` r
data("dasilva.soybean.uniformity")
```

## Format

A data frame with 1152 observations on the following 3 variables.

- `row`:

  row

- `col`:

  column

- `yield`:

  yield, grams/plot

## Details

Field length: 48 rows \* .6 m = 28.8 m

Field width: 24 columns \* .6 m = 14.4 m

A soybean uniformity trial ("ensaio em branco") was sown in November
1970 at the Instituto de Pesquisas e Experimentacao Agropecuarias do Sul
(IPEAS), Pelotas, Rio Grande do Sul, Brazil.

The experimental area was a rectangle 14.40 m x 28.80 m (524.16 sq m),
consisting of 24 lines, each 28.80 m long, spaced 0.60 m apart. After
thinning, the stand was made as uniform as possible at about 24 plants
per meter.

At harvest, each line was cut into segments of 0.60 m, giving 48 basic
units per line and 24 x 48 = 1152 basic units in total. Each basic unit
is therefore 0.60 m (along the line) by 0.60 m (line spacing) = 0.36 sq
m. The recorded value is the weight (grams) of each basic unit.

Border rows (two lines on each side) and 1.20 m at each head of the
lines were excluded from the analysis area.

The data appear in Appendix 5 of the thesis, printed as a matrix of 24
columns (lines, labeled A-Z) by 48 rows (0.60 m segments).

## Source

da Silva, Enedino Correa (1971). Estudo do tamanho e forma de parcelas
para experimentos de soja. M.S. thesis, Escola Superior de Agricultura
"Luiz de Queiroz", Universidade de Sao Paulo, Piracicaba, Brazil.
Appendix 5. https://doi.org/10.11606/D.11.1972.tde-20240301-150533

## References

Enedino Correa da Silva. (1974). Estudo do tamanho e forma de parcelas
para experimentos de soja (Plot size and shape for soybean yield
trials). Pesquisa Agropecuaria Brasileira, Serie Agronomia, 9, 49-59.
Table 3, page 52-53.
https://seer.sct.embrapa.br/index.php/pab/article/view/17250

Humada-Gonzalez, G.G. (2013). Estimação do tamanho otimo de parcela
experimental em experimento com soja. Dissertation, Universidade Federal
de Lavras. http://repositorio.ufla.br/jspui/handle/1/744

## Examples

``` r
if (FALSE) { # \dontrun{

library(agridat)
data(dasilva.soybean.uniformity)
dat <- dasilva.soybean.uniformity

libs(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, aspect=28.8/14.4, 
        main="dasilva.soybean.uniformity")
  
} # }
```
