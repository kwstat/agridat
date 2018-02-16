\name{beaven.barley}
\alias{beaven.barley}
\docType{data}
\title{
  Yields of 8 barley varieties in 1913 as used by Student.
}
\description{
  Yields of 8 barley varieties in 1913.
}
\usage{data("beaven.barley")}
\format{
  A data frame with 160 observations on the following 4 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{gen}}{genotype}
    \item{\code{yield}}{yield (grams)}
  }
}
\details{

  Eight races of barley were grown on a regular pattern of plots.

  These data were prepared from Richey (1926) because the text was
  cleaner.

  Each plot was planted 40 inches on a side, but only the middle square
  36 inches on a side was harvested.

  Field width: 32 plots * 3 feet = 96 feet

  Field length: 5 plots * 3 feet = 15 feet
}
\source{

  Student. (1923).
  On testing varieties of cereals.
  \emph{Biometrika}, 271-293.
  
  http://doi.org/10.1093/biomet/15.3-4.271

}
\references{

  Frederick D. Richey (1926).
  The moving average as a basis for measuring correlated
  variation in agronomic experiments.
  \emph{Jour. Agr. Research}, 32, 1161-1175.

}
\examples{

data(beaven.barley)
dat <- beaven.barley

# Match the means shown in Richey table IV
tapply(dat$yield, dat$gen, mean)
##       a       b       c       d       e       f       g       h
## 298.080 300.710 318.685 295.260 306.410 276.475 304.605 271.820

# Compare to Student 1923, diagram I,II
if(require(desplot)){
  desplot(yield ~ col*row, data=dat,
          aspect=15/96, # true aspect
          main="beaven.barley - variety trial", text=gen)
}

}
\keyword{datasets}
