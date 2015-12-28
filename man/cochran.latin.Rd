\name{cochran.latin}
\alias{cochran.latin}
\docType{data}
\title{
  Latin square design in wheat
}
\description{
Six wheat plots were sampled by six operators and shoot heights
measured. The operators sampled plots in six ordered sequences.
The dependent variate was the difference between measured
height and true height of the plot.
}

\format{
  A data frame with 36 observations on the following 4 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{operator}}{operator factor}
    \item{\code{diff}}{difference between measured height and true height}
  }
}
\source{
  Cochran, W.G. and Cox, G.M. (1957),
  \emph{Experimental Designs}, 2nd ed., Wiley and Sons, New York.
}

\examples{

data(cochran.latin)
dat <- cochran.latin

if(require(desplot)){
desplot(diff~col*row, dat, text=operator, cex=1,
        main="cochran.latin")
}


dat <- transform(dat, rf=factor(row), cf=factor(col))
aov.dat <- aov(diff ~ operator + Error(rf*cf), dat)
summary(aov.dat)
model.tables(aov.dat, type="means")
}
\keyword{datasets}
