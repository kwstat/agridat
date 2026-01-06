\name{mamani.bean.uniformity}
\alias{mamani.bean.uniformity}
\docType{data}
\title{
  Uniformity trial of bean
}
\description{
  Uniformity trial of bean in Costa Rica
}
\usage{data("mamani.bean.uniformity")}
\format{
  A data frame with 1680 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{yield}}{yield, grams per plot}
  }
}
\details{
  Experiment conducted at the Tropical Center for Teaching and Research in Turrialba, Costa Rica.
  Planted Dec 1969, harvested Apr 1970.
  There were 20 rows, harvested in 1 m units.
  Rows were 0.60 m separated.
  The data for sub-experment 3 appears in Mamani Arias (1971).

  Field length: 20 rows * .6 m = 12 m

  Field width: 84 columns * 1 m = 84 m

  Data provenance: The original pdf document contained embedded text
  from OCR. The text was copied into Excel, then re-shaped in R. Large
  outliers were detected and corrected. The variance was calculated and
  compared to the source. Slightly different. Manually-compared all data
  values to source document.

  Basic unit 902 had reported yield of "11 " (not " 11"). Clearly
  incorrect because all yield values were given as 3 digits like 093,
  117. Replaced 11 with 115 (midway between the possible extremes 110
  and 119).
}
\source{
  Mamani Arias, Leoncio (1971).
  Determinación del tamaño, forma y repetición de la parcela para ensayos de rendimiento en frijol (Phaseolus vulgaris L.).
  Tesis (Mag. Sc.) -- IICA, San José (Costa Rica).
  https://repositorio.catie.ac.cr/handle/11554/1162
  https://www.google.com/books/edition/Tesis_de_Grado_de_Magister_Scientiae/eRgPAQAAIAAJ
}
\references{
  Mamani Arias, L. (1972).
  Tamaño de la parcela para ensayos de rendimiento en frijol (Phaseolus vulgaris L.).
  Turrialba, 22(4), 469-470.
  Instituto Interamericano de Cooperación para la Agricultura (IICA), Costa Rica.
  https://repositorio.catie.ac.cr/bitstream/handle/11554/13122/BCO25060544e.pdf
}
\examples{
\dontrun{
  library(agridat)
  data(mamani.bean.uniformity)
  dat <- mamani.bean.uniformity

  libs(desplot)
  desplot(dat, yield~col*row,
          flip=TRUE, aspect=(20*.6)/(84*1), tick=TRUE,
          main="mamani.bean.uniformity")

}
}
\keyword{datasets}
