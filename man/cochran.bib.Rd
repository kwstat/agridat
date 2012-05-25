\name{cochran.bib}
\alias{cochran.bib}
\docType{data}
\title{
  Balanced incomplete block design in corn
}
\description{
  Balanced incomplete block design in corn
}
\usage{cochran.bib}
\format{
  A data frame with 52 observations on the following 3 variables.
  \describe{
    \item{\code{loc}}{Location/block factor, 13 levels}
    \item{\code{gen}}{Genotype/line factor, 13 levels}
    \item{\code{yield}}{Yield, pounds/plot}
  }
}
\details{
  Incomplete block design.  Each loc/block has 4 genotypes/lines.
  The blocks are planted at different locations.
  
  Conducted in 1943 in North Carolina.
}
\source{
  North Carolina Agricultural Experiment Station,
  United States Department of Agriculture.
}
\references{
  Cochran, W.G. and Cox, G.M. (1957),
  \emph{Experimental Designs}, 2nd ed., Wiley and Sons, New York, p. 448.
}
\examples{
dat <- cochran.bib

m1 = aov(yield ~ gen + Error(loc), data=dat)
summary(m1)

require(nlme)
m2 = lme(yield ~ -1 + gen, data=dat, random=~1|loc)

\dontrun{
require(agricolae)
BIB.test(dat$loc, dat$gen, y=dat$yield)
}
}

