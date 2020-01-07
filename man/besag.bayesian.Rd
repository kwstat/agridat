\name{besag.bayesian}
\alias{besag.bayesian}
\docType{data}
\title{
  RCB experiment of spring barley in United Kingdom
}
\description{
  RCB experiment of spring barley in United Kingdom
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

  Used with permission of David Higdon.
}
\source{
  Besag, J. E., Green, P. J., Higdon, D. and Mengersen, K. (1995).
  Bayesian computation and stochastic systems.
  Statistical Science, 10, 3-66.
  http://www.jstor.org/stable/2246224
}
\references{
  Davison, A. C. 2003.
  Statistical Models.
  Cambridge University Press. Pages 534-535.
}
\examples{
\dontrun{
  
  library(agridat)
  data(besag.bayesian)
  dat <- besag.bayesian

  # Yield values were scaled to unit variance
  # var(dat$yield, na.rm=TRUE)
  # .999

  # Besag Fig 2. Reverse row numbers to match Besag, Davison
  dat$rrow <- 76 - dat$row
  libs(lattice)
  xyplot(yield ~ rrow|col, dat, layout=c(1,3), type='s',
         xlab="row", ylab="yield", main="besag.bayesian")

  libs(asreml)
  # same code for asreml3 and asreml4

  # Use asreml to fit a model with AR1 gradient in rows  
  dat <- transform(dat, cf=factor(col), rf=factor(rrow))
  m1 <- asreml(yield ~ -1 + gen, data=dat, random= ~ ar1v(rf))
  m1 <- update(m1)
  m1 <- update(m1)
  m1 <- update(m1)
    
  # Visualize trends, similar to Besag figure 2.
  # Need 'as.vector' because asreml4 uses a named vector
  dat$res <- unname(m1$resid)
  dat$geneff <- coef(m1)$fixed[as.numeric(dat$gen)]
  dat <- transform(dat, fert=yield-geneff-res)
  libs(lattice)
  xyplot(geneff ~ rrow|col, dat, layout=c(1,3), type='s',
         main="besag.bayesian - Variety effects", ylim=c(5,15 ))
  xyplot(fert ~ rrow|col, dat, layout=c(1,3), type='s',
         main="besag.bayesian - Fertility", ylim=c(-2,2))
  xyplot(res ~ rrow|col, dat, layout=c(1,3), type='s',
         main="besag.bayesian - Residuals", ylim=c(-4,4))

} 
}

\keyword{datasets}
