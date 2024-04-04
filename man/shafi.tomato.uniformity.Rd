\name{shafi.tomato.uniformity}
\alias{shafi.tomato.uniformity}
\docType{data}
\title{
  Uniformity trial of tomato
}
\description{
  Uniformity trial of tomato in India
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
  The experiment was conducted at the Regional Research Station Faculty
  of Agriculture, SKUAST-K Wadura Campus during 2006.
  
  The original data was collected on 1m x 1m plots. The data here are
  aggregated 2m x 2m plots.

  Field length: 20 row * 2 m = 40 m

  Field width: 10 col * 2 m = 20 m
 
}
\source{
  Shafi, Sameera (2007).
  On Some Aspects of Plot Techniques in Field Experiments on Tomato (Lycopersicon esculentum mill.) in Soils of Kashmir.
  Thesis. Univ. of Ag. Sciences & Technology of Kashmir. Table 2.2.1.  https://krishikosh.egranth.ac.in/assets/pdfjs/web/viewer.html?file=https%3A%2F%2Fkrishikosh.egranth.ac.in%2Fserver%2Fapi%2Fcore%2Fbitstreams%2Ff1473a80-5420-4aba-ae5a-a075539332cd%2Fcontent
}
\references{
  Shafi, Sameera; S.A.Mir, Nageena Nazir, and Anjum Rashid. (2010).
  Optimum plot size for tomato by using S-PLUS and R-software's in the soils of Kashmir.
  Asian J. Soil Sci., 4, 311-314.
  http://researchjournal.co.in/upload/assignments/4_311-314.pdf
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
