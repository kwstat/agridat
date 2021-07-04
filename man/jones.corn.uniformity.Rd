\name{jones.corn.uniformity}
\alias{jones.corn.uniformity}
\docType{data}
\title{
  Uniformity trial of corn.
}
\description{
  Uniformity trial of corn in Iowa in 2016.
}
\usage{data("jones.corn.uniformity")}
\format{
  A data frame with 144 observations on the following 3 variables.
  \describe{
    \item{\code{col}}{column ordinate}
    \item{\code{row}}{row ordinate}
    \item{\code{yield}}{yield, bu/ac}
  }
}
\details{
  This data corresponds to field "ISU.SE" in the paper by Jones.

  Field width: 12 columns, 4.6 meters each.

  Field length: 12 rows, 3 meters each.

  Electronic version provided as an online supplement.  The "row" and
  "col" variables in the supplement have been swapped for the
  presentation of the data here in order to be more consistent with the
  figures in the paper.

  Used with permission of Marcus Jones. 
}
\source{
  Jones, M., Harbur, M., & Moore, K. J. (2021).
  Automating Uniformity Trials to Optimize Precision of Agronomic Field
  Trials. 
  Agronomy, 11(6), 1254.
  https://doi.org/10.3390/agronomy11061254
}
\references{
  None
}
\examples{
\dontrun{
library(agridat)
data(jones.corn.uniformity)
dat <- jones.corn.uniformity
library(desplot)
# Compare to figure 5 of Jones et al.
desplot(dat, yield ~ col*row,
        aspect=(12*4.6)/(12*3),
        main="jones.corn.uniformity")
}
}
\keyword{datasets}
