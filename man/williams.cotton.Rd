\name{williams.cotton}
\alias{williams.cotton}
\docType{data}
\title{
Lint yield from a cotton uniformity trial
}
\description{
  Lint yield from a cotton uniformity trial
}
\usage{data(williams.cotton)}
\format{
  A data frame with 288 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{Row position}
    \item{\code{column}}{Column position}
    \item{\code{yield}}{Cotton lint yield, kg/ha divided by 10}
  }
}
\details{
  Cotton uniformity trial grown at Narrabri, New South Wales, 1984-1985.
  Plots were 12m long, 1m apart, 12 rows by 24 columns, with an
  irrigation furrow between columns.
}
\source{
  Williams, ER and Luckett, DJ. 1988. The use of uniformity data in the
  design and analysis of cotton and barley variety trials. 
  \emph{Australian Journal of Agricultural Research}, 39, 339-350.
}
\examples{
dat <- williams.cotton

require("lattice")
asp = (12*12)/(24*1) # true aspect
desplot(yield ~ column*row, dat, aspect=asp)

# Smoothed contour/persp plot like Williams 1988 Fig 1a, 2a
dat$fit <- fitted(loess(yield~column*row, dat, span=.5))
contourplot(fit~column*row, data=dat, cuts=6)
wireframe(fit~column*row, data=dat, zlim=c(100, 250))

# Williams table 1
anova(aov(yield ~ factor(row) + factor(column), dat))
}
\keyword{datasets}
