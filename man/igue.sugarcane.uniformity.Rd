\name{igue.sugarcane.uniformity}
\alias{igue.sugarcane.uniformity}
\docType{data}
\title{
  Uniformity trial with sugarcane
}
\description{
  Uniformity trial with sugarcane in Brazil, 1982.
}
\usage{data("igue.sugarcane.uniformity")}
\format{
  A data frame with 1512 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield, kg/plot}
  }
}
\details{
  A uniformity trial with sugarcane in the state of Sao Paulo, Brazil, in 1982.
  The field was 40 rows, each 90 m long, with 1.5 m between rows.
  
  Field width: 36 plots * 1.5 m = 54 m
  
  Field length: 42 plots * 2 m = 84 m

}
\source{
  Toshio Igue, Ademar Espironelo, Heitor Cantarella, Erseni Joao Nelli. (1991).
  Tamanho e forma de parcela experimental para cana-de-acucar (Plot size and shape for sugar cane experiments).
  Bragantia, 50, 163-180. Appendix, page 169-170.
  http://dx.doi.org/10.1590/S0006-87051991000100016
}
\references{
  None
}
\examples{
\dontrun{

library(agridat)
  
data(igue.sugarcane.uniformity)
dat <- igue.sugarcane.uniformity

# match Igue CV top row of page 171
sd(dat$yield)/mean(dat$yield) # 16.4

libs(desplot)
desplot(yield ~ col*row, dat,
        flip=TRUE, tick=TRUE, aspect=(42*2)/(36*1.5),
        main="igue.sugarcane.uniformity")
  
}  
}
\keyword{datasets}
