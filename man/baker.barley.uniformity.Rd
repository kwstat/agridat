\name{baker.barley.uniformity}
\alias{baker.barley.uniformity}
\docType{data}
\title{
  Ten years of barley uniformity trials on same ground
}
\description{
  Ten years of barley uniformity trials on same ground
}

\format{
  A data frame with 570 observations on the following 4 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{year}}{year, numeric}
    \item{\code{yield}}{yield, (pound/acre)}
  }
}
\details{
  Ten years of uniformity trials were sown on the same ground.
}
\source{
  Baker, GA and Huberty, MR and Veihmeyer, FJ.  (1952)
  A uniformity trial on unirrigated barley of ten years' duration.
  \emph{Agronomy Journal}, 44, 267-270.
}

\examples{

data(baker.barley.uniformity)
dat <- baker.barley.uniformity

asp <- (161*3+30)/827 # True aspect ratio
require("agrifun")
desplot(yield~col*row|year, data=dat,
        main="baker.barley.uniformity heatmaps by year", aspect=asp)
dat2 <- aggregate(yield ~ row*col, data=dat, FUN=mean, na.rm=TRUE)
desplot(yield~col*row, data=dat2, main="baker.barley.uniformity 10-year average", aspect=asp)
# Note low yield in upper right, slanting to left a bit due to sandy soil.

# Baker fig 2, stdev vs mean
dat3 <- aggregate(yield ~ row*col, data=dat, FUN=sd, na.rm=TRUE)
plot(dat2$yield, dat3$yield, xlab="Mean yield", ylab="Std Dev yield",
     main="baker.barley.uniformity")

# Baker table 4, correlation of plots across years
require(reshape2)
mat <- acast(dat, row+col~year)
round(cor(mat, use='pair'),2)

}
\keyword{datasets}
