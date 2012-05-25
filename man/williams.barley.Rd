\name{williams.barley}
\alias{williams.barley}
\docType{data}
\title{
Yield from a barley uniformity trial
}
\description{
  Yield from a barley uniformity trial
}
\usage{data(williams.barley)}
\format{
  A data frame with 720 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{Row position}
    \item{\code{col}}{Column position}
    \item{\code{yield}}{Yield kg/ha divided by 10}
  }
}
\details{
  Grown at Roseworthy Agricultural College.  Plots were 5 m long (4 m
  sown, 3.3 m harvested) by 0.75 m wide.

  A three-plot seeder was used, planting in a serpentine fashion.
  Williams noted that it appears that the middle plot of each pass
  has a lower yield, possibly due to soil compaction from the tractor.
}
\source{
  Williams, ER and Luckett, DJ. 1988. The use of uniformity data in the
  design and analysis of cotton and barley variety trials.
  \emph{Australian Journal of Agricultural Research}, 39, 339-350.
}
\examples{
dat <- williams.barley

require("lattice")
asp = (15*5)/(48*.75) # true aspect
desplot(yield ~ col*row, dat, aspect=asp)

# Smoothed contour/persp plot like Williams Fig 1b, 2b
dat$fit <- fitted(loess(yield~col*row, dat, span=.1))
contourplot(fit~col*row, data=dat)
wireframe(fit~col*row, data=dat, zlim=c(100, 350))

# Williams table 1
anova(aov(yield ~ factor(row) + factor(col), dat))

}
\keyword{datasets}
