\name{hernandezdavila.potato.uniformity}
\alias{hernandezdavila.potato.uniformity}
\docType{data}
\title{
Uniformity trial of potato in Guatemala
}
\description{
Uniformity trial of potato in Guatemala
}
\usage{data("hernandezdavila.potato.uniformity")}
\format{
  A data frame with 1008 observations on the following 4 variables.
  \describe{
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{yield}}{yield, kg per plot}
    \item{\code{expt}}{experiment}
  }
}
\details{
  Lat 14 deg 37 min 58 sec, Long 90 deg 48 min 10 sec.

  Expt 1 is for potato genotype "Loman". Page 45.
  Expt 2 is for potato genotype "Atzimba". Page 46.

  Both experimental fields are the same size.
  
  Field width: 12 plots * 0.9m = 10.8 m
  
  Field length: 42 plots * 0.9m = 37.8 m

  Data was OCR converted to csv. Page 45=46.
}
\source{
  Hernández Dávila, Alvaro Gustavo (1982).
  Determinación de tamaño óptimo de parcela para estudios experimentales en dos variedades de papa (Solanum tuberosum L.) en el altiplano central de Guatemala.
  University of San Carlos, Guatemala
  https://biblos.usac.edu.gt/opac/record/92265
}
\references{
None
}
\examples{
\dontrun{
  library(agridat)
  data(hernandezdavila.potato.uniformity)
  dat <- hernandezdavila.potato.uniformity

  # Match the mean and sd in the source
  libs(dplyr)
  dat |> group_by(expt) |> summarize(mn=mean(yield), sd=sd(yield))

  libs(desplot)
  desplot(dat, yield ~ col*row, subset=expt=="E1",
          tick=TRUE, flip=TRUE, aspect=(42*0.9)/(12*0.9),
          main="hernandezdavila.potato.uniformity - Expt E1")
  desplot(dat, yield ~ col*row, subset=expt=="E2",
          tick=TRUE, flip=TRUE, aspect=(42*0.9)/(12*0.9),
          main="hernandezdavila.potato.uniformity - Expt E2")


}
}
\keyword{datasets}
