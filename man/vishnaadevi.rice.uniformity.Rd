\name{vishnaadevi.rice.uniformity}
\alias{vishnaadevi.rice.uniformity}
\docType{data}
\title{
  Uniformity trial of rice
}
\description{
  Uniformity trial of rice in Madurai, India.
}
\usage{data("vishnaadevi.rice.uniformity")}
\format{
  A data frame with 288 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{yield}}{yield per plot, grams}
  }
}
\details{
  A uniformity trial of rice raised during 2017 late samba season near
  Madurai, India.
}
\source{
  Vishnaadevi, S.; K. Prabakaran, E. Subramanian, P. Arunachalam.
  Determination of fertility gradient direction and optimum plot shape of paddy crop in Madurai District.
  Green Farming, 10, 155-159.
  https://www.researchgate.net/publication/333892867
}
\references{
  None
}
\examples{
\dontrun{
  library(agridat)
  data(vishnaadevi.rice.uniformity)
  dat <-vishnaadevi.rice.uniformity
  
  libs(desplot)
  desplot(dat, yield ~ col*row,
          flip=TRUE, aspect=24/12,
          main="vishnaadevi.rice.uniformity")
}
}
\keyword{datasets}
