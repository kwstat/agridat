\name{williams.barley.uniformity}
\alias{williams.barley.uniformity}
\docType{data}
\title{
  Uniformity trial of barley
}
\description{
  Uniformity trial of barley at Narrabri, New South Wales, 1984.
}

\format{
  A data frame with 720 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{grain yield kg/ha divided by 10}
  }
}
\details{
  Grown at Roseworthy Agricultural College.  Plots were 5 m long (4 m
  sown, 3.3 m harvested) by 0.75 m wide.

  A three-plot seeder was used, planting in a serpentine fashion.
  Williams noted that it appears that the middle plot of each pass
  has a lower yield, possibly due to soil compaction from the tractor.

  Field width: 48 plots * .75 m = 36 m

  Field length: 15 plots * 5 m = 75 m
  
}

\source{
  Williams, ER and Luckett, DJ. 1988.
  The use of uniformity data in the design and analysis of cotton and barley variety trials.
  \emph{Australian Journal of Agricultural Research}, 39, 339-350.
  http://doi.org/10.1071/AR9880339
}
\references{
  María Xosé Rodríguez-Álvarez, Martin P.Boer, Fred A. van Eeuwijk, Paul
  H.C.Eilersd (2018).
  Correcting for spatial heterogeneity in plant breeding experiments
  with P-splines.
  \emph{Spatial Statistics}, 23, 52-71.
  https://doi.org/10.1016/j.spasta.2017.10.003  
}
\examples{

library(agridat)
data(williams.barley.uniformity)
dat <- williams.barley.uniformity

if(require(desplot)){
  desplot(yield ~ col*row, dat,
          aspect= 75/36, # true aspect
          main="williams.barley.uniformity")
}


# Smoothed contour/persp plot like Williams Fig 1b, 2b
require("lattice")
dat$fit <- fitted(loess(yield~col*row, dat, span=.1))
contourplot(fit~col*row, data=dat,
            aspect=75/36, region=TRUE, col.regions=RedGrayBlue,
            main="williams.barley.uniformity")
wireframe(fit~col*row, data=dat, zlim=c(100, 350),
          main="williams.barley.uniformity")

# Williams table 1
anova(aov(yield ~ factor(row) + factor(col), dat))

}
\keyword{datasets}
