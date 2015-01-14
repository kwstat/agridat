\name{steel.soybean}
\alias{steel.soybean}
\docType{data}
\title{
  Soybean yields in North Carolina
}
\description{
  Soybean yields in a multi-environment trial in North Carolina.
}

\format{
  A data frame with 108 observations on the following 4 variables.
  \describe{
    \item{\code{gen}}{Genotype factor, 12 levels}
    \item{\code{loc}}{Location factor, 3 levels}
    \item{\code{block}}{Block factor, 3 levels}
    \item{\code{yield}}{Yield, grams per plot}
  }
}
\details{
  The experiment was planted as an RCB with 3 blocks at each location.
}
\source{
  Steel, R.G.D. and Torrie, J.H., 1980.
  \emph{Principles and procedures of statistics: a biometrical approach},
  McGraw-Hill.  Page 400.
}
\references{
  Mick O'Neill, 2010.  Anova and REML: A Guide to Linear Mixed Models In
  An Experimental Design Context.
}

\examples{

data(steel.soybean)
dat <- steel.soybean
require(lattice)
dotplot(gen~yield|loc, dat, main="steele.soybean - yield by location")

if(require(lme4)){
# REML analysis as in O'Neill, p. 130.
m1 <- lmer(yield ~ loc + (1|gen) + (1|gen:loc) + (1|loc:block), data=dat)
# Are gen:loc effects significant?  No.
m2 <- lmer(yield ~ loc + (1|gen) + (1|loc:block), data=dat)
anova(m1,m2)
# h^2 deviations
ranef(m2)$gen
}

}
\keyword{datasets}
