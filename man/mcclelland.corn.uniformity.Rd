\name{mcclelland.corn.uniformity}
\alias{mcclelland.corn.uniformity}
\docType{data}
\title{
  Uniformity trial of corn
}
\description{
  Uniformity trial of corn at Arkansas Experiment Station, 1925.
}
\usage{data("mcclelland.corn.uniformity")}
\format{
  A data frame with 438 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield}
  }
}
\details{
  
  A uniformity trial of corn in 1925 at the Arkansas Experimental Station.

  Field width = 66ft * 2 = 132 feet.

  Field length = 219 rows * 44 inches / 12 inches/ft = 803 ft.

  Note: In the source document, table 2, first 'west' column and
  second-to-last row (page 822), the value 1.40 is assumed to be a
  typographical error and was changed to 14.0 for this data.
  
}

\source{
  McClelland, Chalmer Kirk (1926).
  Some determinations of plat variability.
  Agronomy Journal, 18, 819-823.
  http://doi.org/10.2134/agronj1926.00021962001800090009x
}
\references{
  None
}
\examples{
\dontrun{

  data(mcclelland.corn.uniformity)
  dat <- mcclelland.corn.uniformity
  
  # McClelland table 3, first row, gives 11.2% error for 432 vales.
  # Probable error = 0.67449 * sd(). Relative to mean.
  0.67449 * sd(dat$yield)/mean(dat$yield) # 11.2%
  
  require(desplot)
  desplot(yield ~ col*row, dat,
          flip=TRUE,
          aspect=(219*44/12)/132, # true aspect, 219 rows * 44 inches x 132 feet
          main="mcclelland.corn.uniformity")
  
}
}
\keyword{datasets}
