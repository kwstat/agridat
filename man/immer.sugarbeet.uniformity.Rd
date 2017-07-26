\name{immer.sugarbeet.uniformity}
\alias{immer.sugarbeet.uniformity}
\docType{data}
\title{
  Uniformity trial of sugarbeets, measurements of yield, sugar, purity
}
\description{
  Uniformity trial of sugarbeets, at Minnesota, 1930, with measurements
  of yield, sugar, purity.
}

\format{
  A data frame with 600 observations on the following 5 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield, pounds}
    \item{\code{sugar}}{sugar percentage}
    \item{\code{purity}}{apparent purity}
  }
}
\details{

  Beets were planted in rows 22 inches apart, thinned to 1 plant per
  row. At harvest, the rows were marked into segments 33 feet long with
  2 foot alleys between ends of plots.  The harvested area was 60 rows
  350 feet long.
  
  Field width: 10 plots * 33 feet + 9 alleys * 2 feet = 348 feet

  Field length: 60 plots/rows * 22 in/row / 12 in/feet = 110 feet
  
  Planted in 1930.  Field conditions were uniform.  Beets were planted
  in rows 22 inches apart.  After thinning, one beet was left in each
  12-inch unit.  At harvest, the field was marked out in plot 33 feet
  long, with a 2-foot alley between plots to minimize carrover from the
  harvester.  A sample of 10 beets was taken uniformly (approximately
  every third beet) and measured for sugar percentage and apparent
  purity.  The beets were counted at weighing time and the yields were
  calculated on the basis of 33 beets per plot.

  Immer found that aggregating the data from one row to two
  resulted in a dramatic reduction in the standard error (for yield).
}

\source{
  F. R. Immer. 1932.
  Size and shape of plot in relation to field experiments with sugar beets.
  \emph{Jour. Agr. Research}, 44, 649--668.
  naldc.nal.usda.gov/download/IND43968078/PDF
}

\examples{

data(immer.sugarbeet.uniformity)
dat <- immer.sugarbeet.uniformity

# Immer numbers rows from the top
if(require(desplot)){
  desplot(yield~col*row, data=dat,
          aspect=110/348, tick=TRUE, flip=TRUE, # true aspect
          main="immer.sugarbeet.uniformity - yield")
  desplot(sugar~col*row, data=dat,
          aspect=110/348, tick=TRUE, flip=TRUE,
          main="immer.sugarbeet.uniformity - sugar")
  desplot(purity~col*row, data=dat,
          aspect=110/348, tick=TRUE, flip=TRUE,
          main="immer.sugarbeet.uniformity - purity")
}

pairs(dat[,c('yield','sugar','purity')], main="immer.sugarbeet.uniformity")

}
\keyword{datasets}
