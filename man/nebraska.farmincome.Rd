\name{nebraska.farmincome}
\alias{nebraska.farmincome}
\docType{data}
\title{
  Nebraska farm income in 2007 by county
}
\description{
  Nebraska farm income in 2007 by county
}
\usage{data(nebraska.farmincome)}
\format{
  A data frame with 93 observations on the following 4 variables.
  \describe{
    \item{\code{county}}{County factor}
    \item{\code{crop}}{Crop income, thousand dollars}
    \item{\code{animal}}{Livestock and poultry income, thousand dollars}
    \item{\code{area}}{Area, square miles}
  }
}
\details{
  The variables for each county are:
  
  Value of farm products sold - crops (NAICS) 2007 (adjusted)

  Value of farm products sold - livestock, 2007, adjusted.

  Area in square miles.

  Note: Cuming county is a very important beef-producing county.
  Some counties are not reported to protect privacy.
  Western Nebraska is dryer and has lower income.
  South-central Nebraska is irrigated and has higher crop income per
  square mile.
}
\source{
  U.S. Department of Agriculture-National Agriculture Statistics
  Service. \url{http://censtats.census.gov/usa/usa.shtml}
}
\examples{
dat <- nebraska.farmincome

require("maps")
require("mapproj")
require("latticeExtra")

# Raw, county-wide incomes.  Note the outlier Cuming county
mapplot(county ~ crop + animal,
        data = dat, colramp=RedGrayBlue,
        map = map('county', 'nebraska', plot = FALSE, fill = TRUE,
                  projection = "mercator"))

# Now scale to income/mile^2
dat <- within(dat, {
  crop.rate <- crop/area
  animal.rate <- animal/area
})
# And use manual breakpoints.
mapplot(county ~ crop.rate + animal.rate,
        data = dat,
        map = map('county', 'nebraska', plot = FALSE, fill = TRUE,
                  projection = "mercator"),
        colramp=RedGrayBlue,
        #breaks=c(0,50,100,150,200,300,400,1400)
        breaks=quantile(c(dat$crop.rate, dat$animal.rate), c(0,.1,.2,.4,.6,.8,.9,1), na.rm=TRUE)
        )

}
\keyword{datasets}
