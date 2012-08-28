\name{nass.corn}
\alias{nass.barley}
\alias{nass.corn}
\alias{nass.cotton}
\alias{nass.hay}
\alias{nass.rice}
\alias{nass.sorghum}
\alias{nass.soybean}
\alias{nass.wheat}
\docType{data}
\title{
  U.S. historical crop yields by state
}
\description{
  Yields and acres harvested in each state for the major agricultural
  crops, from approximately 1900 to 2011.  Crops include: barley, corn,
  cotton, hay, rice, sorghum, soybeans, wheat.
}
\usage{data(nass.corn)}
\format{
  \describe{
    \item{\code{year}}{Year, numeric}
    \item{\code{state}}{State factor}
    \item{\code{acres}}{Acres harvested}
    \item{\code{yield}}{Average yield}
  }
}
\details{
  Be cautious with yield values for states with small acres harvested.

  Yields are in bushels/acre, except: cotton pounds/acre, hay tons/acre,
  rice pounds/acre.
}
\source{
  United States Department of Agriculture,
  National Agricultural Statistics Service.
  \url{http://quickstats.nass.usda.gov/}
}
\examples{
dat <- nass.corn

keep <- droplevels(subset(dat, year == 2011 & acres > 100000))$state
dat <- droplevels(subset(dat, is.element(state, keep)))

xyplot(acres ~ year|state, dat, type='l', as.table=TRUE)

# Plain levelplot, using only states
datm <- acast(dat, year~state, value.var='yield')
levelplot(datm, aspect=.5, col.regions=RedGrayBlue,
          scales=list(x=list(rot=90, cex=.7)))

\dontrun{
library("mvtsplot")
mvtsplot(datm, levels=11, margin=FALSE, norm='global')
}
}
\keyword{datasets}
