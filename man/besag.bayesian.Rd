\name{besag.bayesian}
\alias{besag.bayesian}
\docType{data}
\title{
  Spring barley in United Kingdom
}
\description{
  An experiment with 75 varieties of barley, planted in 3 reps.
}

\format{
  A data frame with 225 observations on the following 4 variables.
  \describe{
    \item{\code{col}}{column (also blocking factor)}
    \item{\code{row}}{row}
    \item{\code{yield}}{yield}
    \item{\code{gen}}{variety/genotype}
  }
}
\details{
  RCB design, each column is one rep.
}

\source{
  Besag, J. E., Green, P. J., Higdon, D. and Mengersen, K. (1995).
  Bayesian computation and stochastic systems.
  \emph{Statistical Science}, 10, 3-66.
  http://www.jstor.org/stable/2246224

  Used with permission of David Higdon.
}

\references{
  Davison, A. C. (2003). \emph{Statistical Models}.
  Cambridge University Press. Pages 534-535.
}

\examples{

data(besag.bayesian)
dat <- besag.bayesian

# Yield values were scaled to unit variance
var(dat$yield, na.rm=TRUE)

# Besag Fig 2. Reverse row numbers to match Besag, Davison
dat$rrow <- 76 - dat$row
require("lattice")
xyplot(yield ~ rrow|col, dat, layout=c(1,3), type='s',
       main="besag.bayesian")

\dontrun{
  ## require(asreml)
  
  ## # Use asreml to fit a model with AR1 gradient in rows
  
  ## dat <- transform(dat, cf=factor(col), rf=factor(rrow))
  ## m1 <- asreml(yield ~ -1 + gen, data=dat, random=~ar1v(rf))
  ## m1 <- update(m1)
  
  ## # Visualize trends, similar to Besag figure 2.
  ## dat$res <- m1$residuals
  ## dat$geneff <- coef(m1)$fixed[as.numeric(dat$gen)]
  ## dat <- transform(dat, fert=yield-geneff-res)
  ## xyplot(geneff ~ rrow|col, dat, layout=c(1,3), type='s',
  ##        main="Variety effects", ylim=c(5,15 ))
  ## xyplot(fert ~ rrow|col, dat, layout=c(1,3), type='s',
  ##        main="Fertility", ylim=c(-2,2))
  ## xyplot(res ~ rrow|col, dat, layout=c(1,3), type='s',
  ##        main="Residuals", ylim=c(-4,4))
  
}

# ----------------------------------------------------------------------------

\dontrun{  
  require(asreml4)
  
  # Use asreml to fit a model with AR1 gradient in rows
  
  dat <- transform(dat, cf=factor(col), rf=factor(rrow))
  m1 <- asreml(yield ~ -1 + gen, data=dat, random=~ar1v(rf))
  m1 <- update(m1)
  m1 <- update(m1)
  m1 <- update(m1)
  m1 <- update(m1)
  m1 <- update(m1)
  m1 <- update(m1)
  
  # Visualize trends, similar to Besag figure 2.
  dat$res <- resid(m1)
  dat$geneff <- coef(m1)$fixed[as.numeric(dat$gen)]
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
