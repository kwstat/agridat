\name{lyon.potato.uniformity}
\alias{lyon.potato.uniformity}
\docType{data}
\title{
  Uniformity trial of potatoes
}
\description{
  Uniformity trial of potatoes at Nebraska Experiment Station, 1909.
}

\format{
  A data frame with 204 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column, section}
    \item{\code{yield}}{yield, pounds}
  }
}
\details{
  In 1909, potatoes were harvested from uniform land at Nebraska
  Experiment Station.
  
  There were 34 rows, 34 inches apart.
  Lyon, page 97 says "He harvested each row in six sections,
  each of which was seventy-two feet and seven inches long."
  It is not clear if each section is 72 feet long, or if the
  entire row is 72 feet long.  Yield of potato is roughly 0.5 to 0.8
  pounds per square foot, so it seems more plausible the entire row is
  72 feet long (see calculations below).

  Field width: 6 plots = 72 feet

  Field length: 34 rows * 34 in / 12in/ft = 96 ft
  
}

\source{
  Lyon, T.L. (1911).
  Some experiments to estimate errors in field plat tests.
  Proc. Amer. Soc. Agron, 3, 89-114. Table III.
  http://doi.org/10.2134/agronj1911.00021962000300010016x
}
\references{
  None.
}

\examples{
\dontrun{

library(agridat)
  
  data(lyon.potato.uniformity)
  dat <- lyon.potato.uniformity

  # Yield per square foot, assuming 72 foot rows
  sum(dat$yield)/(72*96) # 0.67 # seems about right
  # Yield per square foot, assuming 72 foot plots
  sum(dat$yield)/(6*72*96) # 0.11
  
  libs(desplot)
  desplot(yield ~ col*row, dat,
          tick=TRUE, flip=TRUE, aspect=96/72, # true aspect
          main="lyon.potato.uniformity")
  
}
}
\keyword{datasets}
