\name{hessling.argentina}
\alias{hessling.argentina}
\docType{data}
\title{
  Relation between wheat yield and weather in Argentina
}
\description{
  Relation between wheat yield and weather in Argentina
}

\format{
  A data frame with 30 observations on the following 15 variables.
  \describe{
    \item{\code{yield}}{average yield, kg/ha}
    \item{\code{year}}{year}
    \item{\code{p05}}{precipitation (mm) in May}
    \item{\code{p06}}{precip in June}
    \item{\code{p07}}{precip in July}
    \item{\code{p08}}{precip in August}
    \item{\code{p09}}{precip in Septempber}
    \item{\code{p10}}{precip in October}
    \item{\code{p11}}{precip in November}
    \item{\code{p12}}{precip in December}
    \item{\code{t06}}{june temperature deviation from normal, deg Celsius}
    \item{\code{t07}}{july temp deviation}
    \item{\code{t08}}{august temp deviation}
    \item{\code{t09}}{september temp deviation}
    \item{\code{t10}}{october temp deviation}
    \item{\code{t11}}{november temp deviation}
  }
}
\details{
  In Argentina wheat is typically sown May to August.  Harvest begins in
  November or December.
}
\source{
  N. A. Hessling, 1922.
  Relations between the weather and the yield of wheat in the
  Argentine republic, \emph{Monthly Weather Review}, 50, 302-308.
  http://doi.org/10.1175/1520-0493(1922)50<302:RBTWAT>2.0.CO;2
}
\examples{

data(hessling.argentina)
dat <- hessling.argentina

# Fig 1 of Hessling.  Use avg Aug-Nov temp to predict yield
dat <- transform(dat, avetmp=(t08+t09+t10+t11)/4) # Avg temp
m0 <- lm(yield ~ avetmp, dat)
plot(yield~year, dat, ylim=c(100,1500), type='l',
main="hessling.argentina: observed (black) and predicted yield (blue)")
lines(fitted(m0)~year, dat, col="blue")

# A modern, PLS approach
if(require(pls)){
  yld <- dat[,"yield",drop=FALSE]
  yld <- as.matrix(sweep(yld, 2, colMeans(yld)))
  cov <- dat[,c("p06","p07","p08","p09","p10","p11", "t08","t09","t10","t11")]
  cov <- as.matrix(scale(cov))
  m2 <- plsr(yld~cov)

  # biplot(m2, which="x", var.axes=TRUE, main="hessling.argentina")
}

if(require(corrgram)){
  corrgram(dat, main="hessling.argentina - correlations of yield and covariates")
}

}
\keyword{datasets}
