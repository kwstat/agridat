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

  Note: There is a clear outlier value '685'.
  When this outlier is included, the calculated value of CV matches the
  value in Vishnaadevi et al.
  If we remove this outlier, the CV is smaller than the value in the
  paper.
  This means that the outlier value is not a simple typo in the
  publication, but was the actual value in the original data.
  
  Field width: 12 columns x 1m = 12 m

  Field length: 24 rows x 1m = 24m
}
\source{
  Vishnaadevi, S.; K. Prabakaran, E. Subramanian, P. Arunachalam. (2019).
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

  # CV in Table 2 for 1x1 is reported as 2.8
  # sd(dat$yield)/mean(dat$yield) = .0277
  # If we remove the outlier yield 685, then we calculate .0256
  libs(desplot)
  desplot(dat, yield ~ col*row,
          flip=TRUE, aspect=24/12,
          main="vishnaadevi.rice.uniformity")
}
}
\keyword{datasets}
