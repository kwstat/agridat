\name{nebraska.farmincome}
\alias{nebraska.farmincome}
\docType{data}
\title{
  Nebraska farm income in 2007 by county
}
\description{
  Nebraska farm income in 2007 by county
}

\format{
  A data frame with 93 observations on the following 4 variables.
  \describe{
    \item{\code{county}}{County factor}
    \item{\code{crop}}{Crop income, thousand dollars}
    \item{\code{animal}}{Livestock and poultry income, thousand dollars}
    \item{\code{area}}{Area of each county, square miles}
  }
}
\details{
  The variables for each county are:

  Value of farm products sold - crops (NAICS) 2007 (adjusted)

  Value of farm products sold - livestock, 2007 (adjusted).

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

data(nebraska.farmincome)
dat <- nebraska.farmincome

if(require("maps") & require("mapproj") & require("latticeExtra")) {
  # latticeExtra for mapplot

  dat$stco <- paste0('nebraska,', dat$county)

  # Raw, county-wide incomes.  Note the outlier Cuming county
  mapplot(stco ~ crop + animal, data = dat,
          scales = list(draw = FALSE), colramp=RedGrayBlue,
          main="nebraska.farmincome: income per county",
          map = map('county', 'nebraska', plot = FALSE, fill = TRUE,
            projection = "mercator") )

  # Now scale to income/mile^2
  dat <- within(dat, {
    crop.rate <- crop/area
    animal.rate <- animal/area
  })
  # And use manual breakpoints.
  mapplot(stco ~ crop.rate + animal.rate, data = dat,
          scales = list(draw = FALSE), colramp=RedGrayBlue,
          main="nebraska.farmincome: income per square mile (percentile breaks)",
          map = map('county', 'nebraska', plot = FALSE, fill = TRUE,
            projection = "mercator"),
          # Percentile break points
          # breaks=quantile(c(dat$crop.rate, dat$animal.rate),
          #                 c(0,.1,.2,.4,.6,.8,.9,1), na.rm=TRUE)
          # Fisher-Jenks breakpoints via classInt package
          # breaks=classIntervals(na.omit(c(dat$crop.rate, dat$animal.rate)),
          #                       n=7, style='fisher')$brks
          breaks=c(0,.049, .108, .178, .230, .519, .958, 1.31))
}

}
\keyword{datasets}
