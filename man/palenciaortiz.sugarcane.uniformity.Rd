\name{palenciaortiz.sugarcane.uniformity}
\alias{palenciaortiz.sugarcane.uniformity}
\docType{data}
\title{
Uniformity trial of sugarcane in Guatemala
}
\description{
Uniformity trial of sugarcane in Guatemala.
}
\usage{data("palenciaortiz.sugarcane.uniformity")}
\format{
  A data frame with 468 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{yield}}{yield per plot, kg}
  }
}
\details{
A uniformity trial of sugarcane (\emph{Saccharum officinarum} L.) conducted at
Estación Experimental Agrícola Sabana Grande, Municipio de Escuintla, Guatemala.
Latitude 14 deg 23 min N, Longitude 90 deg 49 min W.

The land was divided into 468 parcels of 2 m x 2 m (18 rows x 26 columns).

Field width: 26 columns x 2 m = 52 m

Field length: 18 rows x 2 m = 36 m

Data provenance: OCR from thesis page 14. Checked by K.Wright.

}
\source{
Palencia Ortiz, Julia Anibal (1965).
Determinación del tamaño óptimo de parcela para estudios experimentales en
caña de azúcar (\emph{Saccharum officinarum} L.) bajo las condiciones de la
estación experimental agrícola Sabana Grande.
University of San Carlos, Guatemala.
https://biblos.usac.edu.gt/opac/record/87128
}
\references{
None
}
\examples{
\dontrun{
library(agridat)
data(palenciaortiz.sugarcane.uniformity)
dat <- palenciaortiz.sugarcane.uniformity

sum(dat$yield) # matches source document 8878.03
var(dat$yield) # matches source document 39.85

# Gradient shows higher yield in lower right
libs(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, tick=TRUE, aspect=(18*2)/(26*2),
        main="palenciaortiz.sugarcane.uniformity")

}
}
\keyword{datasets}
