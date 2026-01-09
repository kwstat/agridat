\name{barrantesaguilar.sugarcane.uniformity}
\alias{barrantesaguilar.sugarcane.uniformity}
\docType{data}
\title{
  Uniformity trial of sugarcane in Costa Rica
}
\description{
  Uniformity trial of sugarcane in Costa Rica
}
\usage{data("barrantesaguilar.sugarcane.uniformity")}
\format{
  A data frame with 1600 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{yield}}{yield, kg per plot}
  }
}
\details{

  Experiment conducted in the Brunca region of Costa Rica.
  The can field was planted May 2018, three lines per furrow.
  Forty rows, each 84 meters long, were planted with a spacing of 1.5 meter
  between them. Two meters were removed from each end of the rows.
  Final area consisted of 40 rows, each 80 meters long, with 1.5 meters of
  spacing between them.
  
  Field width: 40 columns * 1.5 m = 40 m
  
  Field length: 40 rows * 2 m = 80 m

  Used with permission of Luz Barrantas-Aguilar.

  Data provenance: Barrantes-Aguilar supplied the data in Excel spreadsheet.
}
\source{
  Barrantes-Aguilar, Luz Elena (2019).
  Tamaño óptimo de la unidad experimental con caña de azúcar en la region Brunca, Costa Rica.
  Masters Thesis, Universidad Autónoma Chapingo.
  https://repositorio.chapingo.edu.mx/server/api/core/bitstreams/72177309-155c-4ae0-b643-8ca29f2fb646/content
  Data on pages 72-74.
}
\references{
  Barrantes-Aguilar, Luz Elena, Adrián González-Estrada, y Julio César Barrantes-Mora (2024).
  Comparación De Cinco métodos Para Calcular El tamaño óptimo De La Parcela Experimental Con caña De Azúcar.
  Revista Mexicana De Ciencias Agrícolas 15 (4). México, ME:e3101.
  https://doi.org/10.29312/remexca.v15i4.3101.

  Barrantes Aguilar, Luz Elena, Adrián González Estrada, Miguel Ángel Martínez Damián, y Ramón Valdivia Alcalá (2020).
  Modelos De regresión Segmentada Para Estimar El tamaño óptimo De La Parcela Experimental Con caña De Azúcar.
  Revista Mexicana De Ciencias Agrícolas 11 (8). México, ME:1763-73.
  https://doi.org/10.29312/remexca.v11i8.1934.
}
\examples{
\dontrun{

  library(agridat)
  data(barrantesaguilar.sugarcane.uniformity)
  dat <- barrantesaguilar.sugarcane.uniformity

  mean(dat$yield) # 19.96 match 19.9 from Barrantes-Aguilar
  
  libs(desplot)
  # Match figure 13
  desplot(dat, yield ~ col*row,
          flip=TRUE, tick=TRUE, aspect=(40*2)/(40*1.5),
          main="barrantesaguilar.sugarcane.uniformity")

}
}
\keyword{datasets}
