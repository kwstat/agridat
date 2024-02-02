\name{shafi.tomato.uniformity}
\alias{shafi.tomato.uniformity}
\docType{data}
\title{
  Uniformity trial of tomato
}
\description{
  Uniformity trial of tomato in India.
}
\usage{data("shafi.tomato.uniformity")}
\format{
  A data frame with 200 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{yield}}{yield, kg/plot}
  }
}
\details{
  The original data was collected on 1m x 1m plots. The data here are
  aggregated 2m x 2m plots.

  Field length: 20 row * 2 m = 40 m

  Field width: 10 col * 2 m = 20 m
}
\source{
  Shafi, Sameera (2007).
  On Some Aspects of Plot Techniques in Field Experiments on Tomato (Lycopersicon esculentum mill.) in Soils of Kashmir.
  Thesis. Univ. of Ag. Sciences & Technology of Kashmir. Table 2.2.1.
  https://krishikosh.egranth.ac.in/handle/1/5810083035
}
\references{
  Shafi, Sameera; S.A.Mir, Nageena Nazir, and Anjum Rashid. (2010).
  Optimum plot size for tomato by using S-PLUS and R-software's in the soils of Kashmir.
  Asian J. Soil Sci., 4, 311-314.
  https://www.researchjournal.co.in/upload/assignments/4_311-314.pdf
}
\examples{
\dontrun{
  library(agridat)
  data(shafi.tomato.uniformity)
  dat <- shafi.tomato.uniformity

  libs(desplot)
  desplot(dat, yield ~ col*row,
          aspect=40/20, # true aspect
          main="shafi.tomato.uniformity")
}
}
\keyword{datasets}
