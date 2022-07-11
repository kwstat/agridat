\name{theobald.barley}
\alias{theobald.barley}
\docType{data}
\title{
  Multi-environment trial of barley, multiple years & fertilizer levels
}
\description{
  Barley yields at multiple locs, years, fertilizer levels
}
\usage{data("theobald.barley")}
\format{
  A data frame with 105 observations on the following 5 variables.
  \describe{
    \item{\code{yield}}{yield, tonnes/ha}
    \item{\code{gen}}{genotype}
    \item{\code{loc}}{location, 5 levels}
    \item{\code{nitro}}{nitrogen kg/ha}
    \item{\code{year}}{year, 2 levels}
  }
}
\details{
  Theobald and Talbot used BUGS to fit a fully Bayesian model
  for yield response curves.

  Locations of the experiment were in north-east Scotland.

  Assumed nitrogen cost 400 pounds per tonne.
  Grain prices used were 100, 110, and 107.50 pounds per tonne for
  Georgie, Midas and Sundance.

}
\source{
  Chris M. Theobald and Mike Talbot, (2002).
  The Bayesian choice of crop variety and fertilizer dose.
  \emph{Appl Statistics}, 51, 23-36.
  https://doi.org/10.1111/1467-9876.04863

  Data provided by Chris Theobald and Mike Talbot.
}

\examples{
\dontrun{

library(agridat)

data(theobald.barley)
dat <- theobald.barley
dat <- transform(dat,  env=paste(loc,year,sep="-"))
dat <- transform(dat, income=100*yield - 400*nitro/1000)

libs(lattice)
xyplot(income~nitro|env, dat, groups=gen, type='b',
       auto.key=list(columns=3), main="theobald.barley")

}
}
\keyword{datasets}
