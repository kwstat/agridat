\name{wallace.iowaland}
\alias{wallace.iowaland}
\docType{data}
\title{
  1925 Iowa farmland values by county
}
\description{
  1925 Iowa farmland values by county
}
\usage{data(wallace.iowaland)}
\format{
  A data frame with 99 observations on the following 10 variables.
  \describe{
    \item{\code{county}}{county factor, 99 levels}
    \item{\code{fips}}{FIPS code (state+county)}
    \item{\code{lat}}{latitude}
    \item{\code{long}}{longitude}
    \item{\code{yield}}{average corn yield per acre (bu)}
    \item{\code{corn}}{percent of land in corn}
    \item{\code{grain}}{percent of land in small grains}
    \item{\code{untillable}}{percent of land untillable}
    \item{\code{fedval}}{land value (excluding buildings) per acre, 1925 federal census}
    \item{\code{stval}}{land value (excluding buildings) per acre, 1925 state census}
  }
}
\details{
  None.
}
\source{
  H.A. Wallace (1926). Comparative Farm-Land Values in Iowa.
  \emph{The Journal of Land & Public Utility Economics}, 2, 385-392.
  Page 387-388.
  \url{http://doi.org/10.2307/3138610}
}
\references{
  Larry Winner. Spatial Data Analysis.
  \url{http://www.stat.ufl.edu/~winner/data/iowaland.txt}
}

\examples{

data(wallace.iowaland)
dat <- wallace.iowaland

# Interesting trends involving latitude
require(lattice)
splom(~dat[,-c(1:2)], type=c('p','smooth'), lwd=2, main="wallace.iowaland")

# Means. Similar to Wallace table 1
apply(dat[, c('yield','corn','grain','untillable','fedval')], 2, mean)

# Correlations.  Similar to Wallace table 2
round(cor(dat[, c('yield','corn','grain','untillable','fedval')]),2)

m1 <- lm(fedval ~ yield + corn + grain + untillable, dat)
summary(m1) # estimates similar to Wallace, top of p. 389

# Choropleth map
require(maps)
data(county.fips)
dat <- transform(dat, polnm = paste0('iowa,',county))

if(require("latticeExtra")){ # for mapplot
  redblue <- colorRampPalette(c("firebrick", "lightgray", "#375997"))
  mapplot(polnm~fedval , data=dat, colramp=redblue,
          main="wallace.iowaland - Federal land values",
          xlab="Land value, dollars per acre",
          scales=list(draw=FALSE),
          map=map('county', 'iowa', plot=FALSE,
            fill=TRUE, projection="mercator"))
}

}
\keyword{datasets}
