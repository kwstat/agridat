\name{dasilva.soybean.uniformity}
\alias{dasilva.soybean.uniformity}
\docType{data}
\title{
  Uniformity trial of soybean
}
\description{
  Uniformity trial of soybean in Brazil, 1970.
}
\usage{data("dasilva.soybean.uniformity")}
\format{
  A data frame with 1152 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield, grams/plot}
  }
}
\details{
  
  Field length: 48 rows * .6 m = 28.8 m

  Field width: 24 columns * .6 m = 14.4 m
        
}
\source{
  Enedino Correa da Silva. (1974).
  Estudo do tamanho e forma de parcelas para experimentos de soja (Plot size and shape for soybean yield trials).
  Pesquisa Agropecuaria Brasileira, Serie Agronomia, 9,  49-59. Table 3,
  page 52-53.
  https://seer.sct.embrapa.br/index.php/pab/article/view/17250
}
\references{
  None
}
\examples{
\dontrun{

library(agridat)
data(dasilva.soybean.uniformity)
dat <- dasilva.soybean.uniformity

libs(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, aspect=28.8/14.4, 
        main="dasilva.soybean.uniformity")
  
}
}
\keyword{datasets}
