\name{cochran.factorial}
\alias{cochran.factorial}
\docType{data}
\title{
   Factorial experiment of beans, 2x2x2x2
}
\description{
   Factorial experiment of beans, 2x2x2x2.
}
\usage{data("cochran.factorial")}
\format{
  A data frame with 32 observations on the following 4 variables.
  \describe{
    \item{\code{rep}}{rep factor}
    \item{\code{block}}{block factor}
    \item{\code{trt}}{treatment factor, 16 levels}
    \item{\code{yield}}{yield (pounds)}
    \item{\code{d}}{dung treatment, 2 levels}
    \item{\code{n}}{nitrogen treatment, 2 levels}
    \item{\code{p}}{phosphorous treatment, 2 levels}
    \item{\code{k}}{potassium treatment, 2 levels}
  }
}
\details{
  Conducted by Rothamsted Experiment Station in 1936.

  There were 4 treatment factors:
  
  2 d dung levels: None, 10 tons/acre.

  2 n nitrochalk levels: None, 0.4 hundredweight nitrogen per acre.

  2 p superphosphate levels: None, 0.6 hundredweight per acre

  2 k muriate of potash levels: None, 1 hundredweight K20 per acres.

  The response variable is the yield of beans.
}
\source{
  Cochran, W.G. and Cox, G.M. (1957),
  Experimental Designs, 2nd ed., Wiley and Sons, New York, p. 160.
}

\examples{
\dontrun{

library(agridat)
data(cochran.factorial)
dat <- cochran.factorial

# Ensure factors
dat <- transform(dat, d=factor(d), n=factor(n), p=factor(p), k=factor(k))

# Cochran table 6.5.
m1 <- lm(yield ~ rep * block + (d+n+p+k)^3, data=dat)
anova(m1)


libs(FrF2)
aliases(m1)
MEPlot(m1, select=3:6,
       main="cochran.factorial - main effects plot")

}
}
\keyword{datasets}
