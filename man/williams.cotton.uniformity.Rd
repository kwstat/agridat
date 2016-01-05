\name{williams.cotton.uniformity}
\alias{williams.cotton.uniformity}
\docType{data}
\title{
  Uniformity trial of cotton
}
\description{
  Uniformity trial of cotton at Narrabri, New South Wales, 1984.
}

\format{
  A data frame with 288 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{lint yield, kg/ha divided by 10}
  }
}
\details{
  Cotton uniformity trial grown at Narrabri, New South Wales, 1984-1985.
  Plots were 12m long, 1m apart, 12 rows by 24 columns, with an
  irrigation furrow between columns.

  Field width: 24 plots * 1 m = 24 m

  Field length: 12 plots * 12 m = 144 m
  
}
\source{
  Williams, ER and Luckett, DJ. 1988. The use of uniformity data in the
  design and analysis of cotton and barley variety trials.
  \emph{Australian Journal of Agricultural Research}, 39, 339-350.
}

\examples{

data(williams.cotton.uniformity)
dat <- williams.cotton.uniformity

if(require(desplot)){
desplot(yield ~ col*row, dat,
        aspect=144/24,
        main="williams.cotton.uniformity")
}


# Smoothed contour/persp plot like Williams 1988 Fig 1a, 2a
dat$fit <- fitted(loess(yield~col*row, dat, span=.5))
require("lattice")
contourplot(fit~col*row, data=dat,
            region=TRUE, cuts=6,
            main="williams.cotton.uniformity")
wireframe(fit~col*row, data=dat, zlim=c(100, 250),
          main="williams.cotton.uniformity")

# Williams table 1
anova(aov(yield ~ factor(row) + factor(col), dat))
}
\keyword{datasets}
