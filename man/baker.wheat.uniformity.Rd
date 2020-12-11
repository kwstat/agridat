\name{baker.wheat.uniformity}
\alias{baker.wheat.uniformity}
\docType{data}
\title{
  Uniformity trial of wheat
}
\description{
  Uniformity trial of wheat
}
\usage{data("baker.wheat.uniformity")}
\format{
  A data frame with 225 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{col}
    \item{\code{yield}}{yield}
  }
}
\details{
  
Data was collected in 1939-1940.  The trial consists of sixteen 40 ft. x
40 ft. blocks subdivided into nine plots each. The data were secured in
1939-1940 from White Federation wheat. The design of the experiment was
square with alleys 20 feet wide between blocks. The plots were 10 feet
long with two guard rows on each side.

Morning glories infested the middle two columns of blocks, uniformly
over the blocks affected.

The data here include missing values for the alleys so that the field
map is approximately correct.

Field width: 4 blocks of 40 feet + 3 alleys of 20 feet = 220 feet.

Field length: 4 blocks of 40 feet + 3 alleys of 20 feet = 220 feet.

}
\source{
  G. A. Baker, E. B. Roessler (1957).
  Implications of a uniformity trial with small plots of wheat.
  Hilgardia, 27, 183-188.
  http://hilgardia.ucanr.edu/Abstract/?a=hilg.v27n05p183
}
\references{
  None
}
\examples{
\dontrun{
  
  library(agridat)
  data(baker.wheat.uniformity)
  dat <- baker.wheat.uniformity

  libs(desplot)
  desplot(dat, yield ~ col*row,
          flip=TRUE, aspect=1,
          main="baker.wheat.uniformity")

}
}
\keyword{datasets}
