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
}
\source{
  Williams, ER and Luckett, DJ. 1988. The use of uniformity data in the
  design and analysis of cotton and barley variety trials.
  \emph{Australian Journal of Agricultural Research}, 39, 339-350.
}

\examples{

data(williams.barley.uniformity)
dat <- williams.barley.uniformity

if(require(desplot)){
asp = (15*5)/(48*.75) # true aspect
desplot(yield ~ col*row, dat, aspect=asp,
        main="williams.barley.uniformity")
}


# Smoothed contour/persp plot like Williams Fig 1b, 2b
require("lattice")
dat$fit <- fitted(loess(yield~col*row, dat, span=.1))
contourplot(fit~col*row, data=dat,
            region=TRUE,
            main="williams.barley.uniformity")
wireframe(fit~col*row, data=dat, zlim=c(100, 350),
          main="williams.barley.uniformity")

# Williams table 1
anova(aov(yield ~ factor(row) + factor(col), dat))

}
\keyword{datasets}
