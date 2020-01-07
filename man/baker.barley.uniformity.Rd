\name{baker.barley.uniformity}
\alias{baker.barley.uniformity}
\docType{data}
\title{
  Uniformity trials of barley, 10 years on same ground
}
\description{
  Uniformity trials of barley at Davis, California, 1925-1935, 10 years on same ground.
}

\format{
  A data frame with 570 observations on the following 4 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{year}}{year}
    \item{\code{yield}}{yield, pounds/acre}
  }
}
\details{
  
  Ten years of uniformity trials were sown on the same ground.  Baker
  (1952) shows a map of the field, which gravel subsoil extended from
  the upper right corner diagonally lower-left. This results in lower
  yields as seen on the 10-year average map.

  Field width: 19 plots = 827 ft

  Field length: 3 plots * 161 ft + 2 alleys * 15 feet = 513 ft

}
\source{
  Baker, GA and Huberty, MR and Veihmeyer, FJ.  (1952)
  A uniformity trial on unirrigated barley of ten years' duration.
  \emph{Agronomy Journal}, 44, 267-270.
  http://doi.org/10.2134/agronj1952.00021962004400050011x
}

\examples{
\dontrun{

library(agridat)

data(baker.barley.uniformity)
dat <- baker.barley.uniformity

# Ten-year average
dat2 <- aggregate(yield ~ row*col, data=dat, FUN=mean, na.rm=TRUE)

libs(desplot)
desplot(yield~col*row|year, data=dat,
        aspect = 513/827, # true aspect
        main="baker.barley.uniformity - heatmaps by year")

desplot(yield~col*row, data=dat2,
        aspect = 513/827, # true aspect
        main="baker.barley.uniformity - heatmap of 10-year average")
# Note low yield in upper right, slanting to left a bit due to sandy soil
# as shown in Baker figure 1.


# Baker fig 2, stdev vs mean
dat3 <- aggregate(yield ~ row*col, data=dat, FUN=sd, na.rm=TRUE)
plot(dat2$yield, dat3$yield, xlab="Mean yield", ylab="Std Dev yield",
     main="baker.barley.uniformity")

# Baker table 4, correlation of plots across years
# libs(reshape2)
# mat <- acast(dat, row+col~year)
# round(cor(mat, use='pair'),2)

}
}
\keyword{datasets}
