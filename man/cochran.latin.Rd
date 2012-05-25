\name{cochran.latin}
\alias{cochran.latin}
\docType{data}
\title{
  Latin square design
}
\description{
Six wheat plots were sampled by six operators and shoot heights
measured. The operators sampled plots in six ordered sequences.
The dependent variate was the difference between measured
height and true height of the plot.
}
\usage{data(cochran.latin)}
\format{
  A data frame with 36 observations on the following 4 variables.
  \describe{
    \item{\code{row}}{Row}
    \item{\code{column}}{Column}
    \item{\code{operator}}{Operator factor}
    \item{\code{diff}}{Difference between measured height and true height}
  }
}
\source{
  Cochran, W.G. and Cox, G.M. (1957),
  \emph{Experimental Designs}, 2nd ed., Wiley and Sons, New York.
}
\examples{
dat <- cochran.latin

desplot(diff~column*row, dat, text=operator, cex=1)
dat <- transform(dat, rf=factor(row), cf=factor(column))
aov.dat <- aov(diff ~ operator + Error(rf*cf), dat)
summary(aov.dat)
model.tables(aov.dat, type="means")
}
\keyword{datasets}
