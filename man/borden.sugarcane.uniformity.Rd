\name{borden.sugarcane.uniformity}
\alias{borden.sugarcane.uniformity}
\docType{data}
\title{
  Uniformity trial of sugarcane in Hawaii
}
\description{
  Uniformity trial of sugarcane in Hawaii
}
\usage{data("borden.sugarcane.uniformity")}
\format{
  A data frame with 48 observations on the following 4 variables.
  \describe{
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{year}}{year, 1929 or 1931}
    \item{\code{yield}}{yield, tons per acre}
  }
}
\details{

  Harvested at Hakalau Plantation, Hawaii.

  1929 data reported in Borden (1930). Plots are 30 ft x 75 ft.
  Plots 75 feet wide by 30 feet long.

  We observe extreme soil variation in our cane fields.
  
  Field width: 4 plots * 75 ft = 300 ft

  Field length: 12 plots * 30 ft = 360 ft

  1931 data are reported in Borden (1931). Map given.
  Plots are 35 ft x 62 ft.
  Col 1, row 10 was missing. Estimated as the average of neighboring plots.
  Col 4, row 3 was 102. Replaced with average of neighboring plots.

  Field width: 4 plots * 62 feet = 248 feet (plus alleys on map)

  Field length: 12 plots * 35 ft = 420 feet
  
  Data provenance: From tables in original papers, transcribed by K.Wright.
}
\source{
  Borden, R. J. (1930)
  Replications of plot treatments in field experiments.
  Hawaiian Planters' Record, 34, 151-155.
  https://archive.org/details/hawaiian-planters-record_1930-04_34_2/page/150/

  Borden, R.J. (1931).
  Studies in experimental technique--shape, size, and replication.
  Hawaiian Planters' Record, 35, 295-304.
  https://archive.org/details/hawaiian-planters-record_1931-07_35_3/page/n93
}
\references{
  None
}
\examples{
\dontrun{
  library(agridat)
  data(borden.sugarcane.uniformity)
  dat <- borden.sugarcane.uniformity

  libs(desplot)
  desplot(dat, yield ~ col*row|year,
          aspect=(400)/(300), # rough average size of 2 years
          tick=TRUE, flip=TRUE,
          main="borden.sugarcane.uniformity")
}
}
\keyword{datasets}
