\name{laycock.tea.uniformity}
\alias{laycock.tea.uniformity}
\docType{data}
\title{
  Uniformity trials of tea
}
\description{
  Uniformity trials of tea
}
\usage{data("laycock.tea.uniformity")}
\format{
  A data frame with 54 observations on the following 4 variables.
  \describe{
    \item{\code{loc}}{location, L1 or L2}
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield}
  }
}
\details{
  Actual physical dimensions for the tea shrubs are not given, so we use
  an estimate of four feet square for each shrub (which is similar to
  the \code{eden.tea.uniformity} experiment).
  
  Location 1 (Laycock, page 108) is at the Research Station,
  Nyasaland. Plots were 10 by 15 bushes, harvested 23 times in 1942.
  
  Field length: 8 plots * 10 bushes * 4 feet = 320 feet.

  Field width: 4 plots * 15 bushes * 4 feet = 240 feet.

  Location 2 (Laycock page 110) is at Mianga Estate, Nyasaland. Plots
  were 9 by 11 bushes, harvested 18 times in 1951/52.

  Field length: 9 plots * 9 bushes * 4 feet = 324 feet.

  Field width: 6 plots * 11 bushes * 4 feet = 264 feet.
}
\source{
  Laycock, D. H. (1955).
  The effect of plot shape in reducing the errors of tea experiments.
  Tropical Agriculture, 32, 107-114.
}
\references{
  Zimmerman, Dale L., and David A. Harville. (1991).
  A random field approach to the analysis of field-plot experiments
  and other spatial experiments.
  Biometrics, 47, 223-239.
}
\examples{
\dontrun{

library(agridat)

data(laycock.tea.uniformity)
dat <- laycock.tea.uniformity

libs(desplot)
desplot(yield ~ col*row|loc, dat,
        flip=TRUE, aspect=322/252, # average of 2 locs
        main="laycock.tea.uniformity")

}

}
\keyword{datasets}
