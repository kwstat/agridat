\name{wiebe.wheat}
\alias{wiebe.wheat}
\docType{data}
\title{
Uniformity trial of wheat
}
\description{
A uniformity trial of 1500 plots of wheat conducted in Idaho in 1927.
}
\usage{wiebe.wheat}
\format{
  A data frame with 1500 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{a numeric vector}
    \item{\code{column}}{a numeric vector}
    \item{\code{yield}}{Yield}
  }
}

\details{
  Yield trial conducted in 1927 near Aberdeen, Idaho.  Some authors
  recommend analyzing the square root of the yields.

  Produced by the U.S. Dept of Agriculture.
}

\source{
  Wiebe, G.A. 1935. Variation and Correlation in Grain Yield among 1,500 Wheat
  Nursery Plots, \emph{Journal of Agricultural Research}, 50, 331-357.
}

\references{
  D.A. Preece, 1981, Distributions of final digits in data,
  \emph{The Statistician}, 30, 31--60.
}

\examples{
dat <- wiebe.wheat

require("lattice")
desplot(yield~column+row, dat, aspect=3) # aspect is just a guess

# Preece (1981) found the last digits have an interesting distribution.
dig <- substring(dat$yield, nchar(dat$yield))
dig <- as.numeric(dig)
hist(dig, breaks=0:10-.5, main="Histogram of last digit")
table(dat$col, dig) # Table 3 of Preece

# Median yields of rows/columns show obvious trends
plot(tapply(dat$yield, dat$row, median), xlab="Row", ylab="Yield")
plot(tapply(dat$yield, dat$column, median), xlab="Column", ylab="Yield")
# Spatial trends are obvious
xyplot(yield~column, dat, type=c('p','smooth'))

# Median polish
require("reshape2")
mat <- melt(dat, measure.var='yield')
mat <- acast(mat, row~column)
image(mat)
m1 <- medpolish(mat)
plot(mat-m1$res, m1$res, xlab="Residual", ylab="Fitted value",
     ylim=c(-300,300))

# Loess
m3 <- loess(yield~row+column, dat)
plot(fitted(m3), resid(m3), ylim=c(-300,300))
}
\keyword{datasets}
