\name{borden.sugarcane.uniformity}
\alias{borden.sugarcane.uniformity}
\docType{data}
\title{
  Uniformity trial of sugarcane in Hawaii
}
\description{
  Uniformity trial of sugarcane in Hawaii
}
\usage{data("borden.sugarcane.uniformity")}
\format{
  A data frame with 48 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{yield}}{yield, tons per acre}
  }
}
\details{

  Harvested at Hakalau Plantation, Hawaii, 1929.
  We observe extreme soil variation in our cane fields.
  Plots 30 feet wide by 75 feet long.

  Field width: 4 plots * 30 ft = 120 ft

  Field length: 12 plots * 75 ft = 900 ft

}
\source{
  Borden, R. J. (1930)
  Replications of plot treatments in field experiments.
  Hawaiian Planters' Record, 34, 151-155.
  https://archive.org/details/hawaiian-planters-record_1930-04_34_2/page/150/
}
\references{
  None
}
\examples{
\dontrun{
  library(agridat)
  data(borden.sugarcane.uniformity)
  dat <- borden.sugarcane.uniformity

  mean(dat$yield) # 83.127 # Borden has 83.1

  libs(desplot)
  desplot(dat, yield ~ col*row,
          aspect=(12*75)/(4*30), tick=TRUE, flip=TRUE,
          main="borden.sugarcane.uniformity")
}
}
\keyword{datasets}
