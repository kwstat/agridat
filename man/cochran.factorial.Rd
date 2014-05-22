\name{cochran.factorial}
\alias{cochran.factorial}
\docType{data}
\title{
   Factorial experiment in beans
}
\description{
   Factorial experiment in beans
}
\usage{data(cochran.factorial)}
\format{
  A data frame with 32 observations on the following 4 variables.
  \describe{
    \item{\code{rep}}{rep factor}
    \item{\code{block}}{block factor}
    \item{\code{trt}}{treatment factor, 16 levels}
    \item{\code{yield}}{yield (pounds)}
  }
}
\details{
  Conducted by Rothamsted Experiment Station in 1936.  The treatments
  are listed below.

  d = dung: None, 10 tons/acre.

  n = nitrochalk: None, 0.4 hundredweight nitrogen per acre.

  p = Superphosphate: None, 0.6 hundredweight per acre

  k = muriate of potash: None, 1 hundredweight K20 per acres.

  The response variable is the yield of beans.
}
\source{
  Cochran, W.G. and Cox, G.M. (1957),
  \emph{Experimental Designs}, 2nd ed., Wiley and Sons, New York, p. 160.
}

\examples{

dat <- cochran.factorial

# Split treatment into individual factors
dat <- transform(dat,
                 d = -1 + 2 * grepl('d',trt),
                 n = -1 + 2 * grepl('n',trt),
                 p = -1 + 2 * grepl('p',trt),
                 k = -1 + 2 * grepl('k',trt))
dat <- transform(dat, d=factor(d), n=factor(n), p=factor(p), k=factor(k))

# Cochran table 6.5.
m0 <- aov(yield~rep/block+(d+n+p+k)^3, data=dat)
anova(m0)

}
\keyword{datasets}
