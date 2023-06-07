\name{heath.cabbage.uniformity}
\alias{heath.cabbage.uniformity}
\docType{data}
\title{
  Uniformity trial of cabbage.
}
\description{
  Uniformity trial of cabbage.
}
\usage{data("heath.cabbage.uniformity")}
\format{
  A data frame with 48 observations on the following 3 variables.
  \describe{
    \item{\code{yield}}{pounds per plot}
    \item{\code{col}}{column}
    \item{\code{row}}{row}
  }
}
\details{
  Heath says each plot is .011 acres. An acre is 43560 sq ft, so each
  plot is 479.16 sq feet, which rounds to 480 sq feet. If Heath Figure
  3-1 is correctly shaped, each plot is approximately 12 feet x 40 feet
  = 480 sq ft.
  Each plot had "some 350" plants.
  Harvested 1958.
}
\source{
  O.V.S. Heath (1970).
  Investigation by Experiment. Fig. 3-1, p. 50.
  https://archive.org/details/investigationbye0000heat
}
\references{
  None.
}
\examples{
\dontrun{
  library(agridat)
  data(heath.cabbage.uniformity)
  dat <- heath.cabbage.uniformity
  
  # Heath Fig 3-1, p. 50
  libs(desplot)
  desplot(dat, yield ~ col*row,
          aspect=(8*12)/(6*40),
          main="heath.cabbage.uniformity")

}
}
\keyword{datasets}
