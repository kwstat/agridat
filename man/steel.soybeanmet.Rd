\name{steel.soybeanmet}
\alias{steel.soybeanmet}
\docType{data}
\title{
  Soybean yields in North Carolina
}
\description{
  Soybean yields in a multi-environment trial in North Carolina.
}
\usage{data(steel.soybeanmet)}
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
  McGraw-Hill New York.  Page 400.
}
\references{
  Mick O'Neill, 2010.  Anova and REML: A Guide to Linear Mixed Models In
  An Experimental Design Context.
}
\examples{
data(steel.soybeanmet)
## maybe str(steel.soybeanmet) ; plot(steel.soybeanmet) ...
}
\keyword{datasets}
