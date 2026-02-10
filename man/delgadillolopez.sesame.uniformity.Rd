\name{delgadillolopez.sesame.uniformity}
\alias{delgadillolopez.sesame.uniformity}
\docType{data}
\title{
  A uniformity trial of sesame
}
\description{
  A uniformity trial of sesame in Nicaragua
}
\usage{data("delgadillolopez.sesame.uniformity")}
\format{
  A data frame with 384 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{yield}}{yield, grams per plot}
  }
}
\details{
  A uniformity trial of sesame conducted in Managua, Nicaragua, in 1969.

  Field width: 16 plots * 5 m = 80 m

  Field length: 24 rows * 0.915 m = 21.96 m

  Data provenance: Data appears in Delgadillo Lobez (1973) table 5.
  Typed by K.Wright. Table 6 shows 3-row subtotals that were used to
  correct some data values that were difficult to transcribe.
  
}
\source{
  Delgadillo Lopez, Juan Francisco (1973).
  Determinación del tamaño óptimo de la unidad experimental en Ajonjolí (Sesamun spp).
  Thesis, National School of Agriculture, Nicaragua.
  https://repositorio.una.edu.ni/3076/
}
\references{
  None
}
\examples{
\dontrun{
  library(agridat)
  data(delgadillolopez.sesame.uniformity)
  dat <- delgadillolopez.sesame.uniformity

  require(desplot)
  desplot(dat, yield ~ col*row,
          flip=TRUE, tick=TRUE, aspect=(24*0.915)/(16*5),
          main="delgadillolopez.sesame.uniformity")

}
}
\keyword{datasets}
