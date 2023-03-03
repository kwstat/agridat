\name{odland.soybean.uniformity}
\alias{odland.soybean.uniformity}
\alias{odland.soyhay.uniformity}
\docType{data}
\title{
  Uniformity trials of soy hay and soybeans
}
\description{
  Uniformity trials of soy hay and soybeans at Virginia Experiment
  Station, 1925-1926.
}

\format{
  Data frames with 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield: hay in tons, beans in bushels}
  }
}
\details{

  Grown at West Virginia Experiment Station in 1925 & 1926.

  \bold{Soy beans}
  
  Soybeans were planted in rows 30 inches apart.
  In 1926 the crop was harvested for seed, 55 rows, each 232 feet long.
  Yields of 8-foot plats were recorded.
  In 1926, data for the last row on page 96 seems to be missing.
    
  Field width: 55 plots * 30 in / 12in/ft = 137.5 feet
  
  Field length: 28 plots * 8 feet = 224 feet + border = total 232 feet.
  
  Odland and Garber provide no agronomic context for the yield variation.

  \bold{Soy hay}

  In 1925 the crop was harvested for forage, 42 rows, each 200 feet long.
  Yields of 8-foot plats recorded.
  
  Field width: 42 plots * 30 in / 12in/ft = 105 ft
  
  Field length: 24 plots * 8 feet = 192 feet + border = total 200 feet.

}

\source{
  Odland, TE and Garber, RJ. 1928.
  Size of Plat and Number of Replications in Field Experiments with
  Soybeans.
  Agronomy Journal, 20, 93--108.
  https://doi.org/10.2134/agronj1928.00021962002000020002x
}

\examples{
\dontrun{

library(agridat)
  
  libs(desplot)

  data(odland.soyhay.uniformity)
  dat1 <- odland.soyhay.uniformity
  desplot(dat1, yield ~ col*row,
          flip=TRUE, aspect=200/105, # true aspect
          main="odland.soyhay.uniformity")

  data(odland.soybean.uniformity)
  dat2 <- odland.soybean.uniformity
  desplot(dat2, yield ~ col*row,
          flip=TRUE, aspect = 232/137, 
          main="odland.soybean.uniformity")
  
}
}
\keyword{datasets}
