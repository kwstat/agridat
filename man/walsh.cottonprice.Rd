\name{walsh.cottonprice}
\alias{walsh.cottonprice}
\docType{data}
\title{
  Acres and price of cotton 1910-1943
}
\description{
  Acres and price of cotton 1910-1943
}

\format{
  A data frame with 34 observations on the following 9 variables.
  \describe{
    \item{\code{year}}{year, numeric 1910-1943}
    \item{\code{acres}}{acres of cototn (1000s)}
    \item{\code{cotton}}{price per pound (cents) in previous year}
    \item{\code{cottonseed}}{price per ton (dollars) in previous year}
    \item{\code{combined}}{cotton price/pound + 1.857 x cottonseed price/pound (cents)}
    \item{\code{index}}{price index, 1911-1914=100}
    \item{\code{adjcotton}}{adjusted cotton price per pound (cents) in previous year}
    \item{\code{adjcottonseed}}{adjusted cottonseed price per ton (dollars) in previous year}
    \item{\code{adjcombined}}{adjusted combined price/pound (cents)}
  }
}
\details{
  The 'index' is a price index for all farm commodities.

}
\source{
  R.M. Walsh (1944).
  Response to Price in Production of Cotton and Cottonseed,
  \emph{Journal of Farm Economics}, 26, 359-372.
  http://doi.org/10.2307/1232237
}

\examples{

data(walsh.cottonprice)
dat <- walsh.cottonprice

dat <- transform(dat, acres=acres/1000) # convert to million acres

percentchg <- function(x){ # percent change from previous to current
  ix <- 2:(nrow(dat))
  c(NA, (x[ix]-x[ix-1])/x[ix-1])
}

# Compare percent change in acres with percent change in previous price
# using constant dollars
dat <- transform(dat, chga = percentchg(acres), chgp = percentchg(adjcombined))

with(dat, cor(chga, chgp, use='pair')) # .501 correlation
require(lattice)
xyplot(chga~chgp, dat, type=c('p','r'),
       main="walsh.cottonprice",
       xlab="Percent change in previous price", ylab="Percent change in acres")
}
\keyword{datasets}
