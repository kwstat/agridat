\name{besag.bayesian}
\alias{besag.bayesian}
\docType{data}
\title{
  Spring barley in United Kingdom
}
\description{
  An experiment with 75 varieties of barley, planted in 3 reps.
}
\usage{data(besag.bayesian)}
\format{
  A data frame with 225 observations on the following 4 variables.
  \describe{
    \item{\code{col}}{Column (also blocking factor)}
    \item{\code{row}}{Row}
    \item{\code{yield}}{Yield}
    \item{\code{gen}}{Variety factor}
  }
}
\details{
  RCB design, each column is one rep.
}
\source{
  Besag, J. E., Green, P. J., Higdon, D. and Mengersen, K. (1995).
  Bayesian computation and stochastic systems.
  \emph{Statistical Science}, 10, 3-66. 
}
\references{
  Davison, A. C. (2003). \emph{Statistical Models}.
  Cambridge University Press. Pages 534-535.
}
\examples{
dat <- besag.bayesian

# Yield values were scaled to unit variance
var(dat$yield, na.rm=TRUE)

# Besag Fig 2. Reverse row numbers to match Besag, Davison
dat$rrow <- 76 - dat$row
library("lattice")
xyplot(yield ~ rrow|col, dat, layout=c(1,3), type='s')

\dontrun{
# Use asreml to fit a model with AR1 gradient in rows
dat <- transform(dat, cf=factor(col), rf=factor(rrow))
m1 <- asreml(yield ~ -1 + gen, data=dat, random=~ar1v(rf))

# Visualize trends, similar to Besag figure 2.
dat$res <- resid(m1)
dat$geneff <- fixef(m1)[as.numeric(dat$gen)]
dat <- transform(dat, fert=yield-geneff-res)
xyplot(geneff ~ rrow|col, dat, layout=c(1,3), type='s',
       main="Variety effects", ylim=c(5,15 ))
xyplot(fert ~ rrow|col, dat, layout=c(1,3), type='s',
       main="Fertility", ylim=c(-2,2))
xyplot(res ~ rrow|col, dat, layout=c(1,3), type='s',
       main="Residuals", ylim=c(-4,4))
}
}
\keyword{datasets}
