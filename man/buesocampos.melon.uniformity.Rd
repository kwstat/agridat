\name{buesocampos.melon.uniformity}
\alias{buesocampos.melon.uniformity}
\docType{data}
\title{
Uniformity trial of melon in Guatemala
}
\description{
  A uniformity trial of melon in Guatemala
}
\usage{data("buesocampos.melon.uniformity")}
\format{
  A data frame with 480 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{yield}}{yield in kg per plot}
  }
}
\details{
Melon experiment conducted at Ciudad de Esquipulsa, Chiquimula, Guatemala, circa 1984.
Latitude 14 deg 47 min 55 sec. Longitude 89 deg 32 min 48 sec.
Layout was 20 rows of 24 m.

Field length: 24 plots * 1m = 24 m

Field width: 20 plots * 1.8m = 36 m

Data provenance: OCR by Claude Sonnet. Checked by K.Wright.
}
\source{
﻿Bueso Campos, Marlon Leonel (1985).
Determinación del tamaño óptimo de parcela experimental en melón (Cucumis melo) para el departamento de Chiquimula, y en tomate (Lycopersicon esculentum) para el Valle de la Fragua, Zacapa.
Thesis (Ingeniero Agrónomo). University of San Carlos, Guatemala.
https://biblos.usac.edu.gt/opac/record/125516
}
\references{
None
}
\examples{
\dontrun{
mean(dat$yield) 
var(dat$yield)

require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, tick=TRUE, aspect=(24*1)/(20*1.8),
        main="buesocampos.melon.uniformity")
}
}
\keyword{datasets}
