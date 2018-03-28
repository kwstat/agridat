\name{hutchinson.cotton.uniformity}
\alias{hutchinson.cotton.uniformity}
\docType{data}
\title{
  Uniformity trial of cotton
}
\description{
  Uniformity trial of cotton in India in 1934.
}
\usage{data("hutchinson.cotton.uniformity")}
\format{
  A data frame with 1280 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{total yield per plot, grams}
  }
}
\details{
  A uniformity trial of cotton at the Institute of Plant Industry, Indore, India.
  
  The  trial consisted of 128 rows of cotton with a spacing of 14 in between rows and length 186 feet 8 in.
  
  Each harvested plot was 4 rows wide and  4 ft 8 in long, measuring 1/2000 acre.
  
  Four pickings were made between Nov 1933 and Jan 1934. The data here are the total yields.
  
  The fertility map shows appreciable variation, not following any
  systematic pattern.
  
  Field length: 40 plots * 4 feet 8 inches = 206 feet 8 inches
  
  Field width: 32 plots * 4 rows/plot * 14 inches/row = 150 feet

  Conclusions: Lower error was obtained when the plots were long rows
  instead of across the rows.
}
\source{
  V.G. Panse and P.V. Sukhatme. 
  Statistical Methods for Agricultural Workers.
  First edition page 137. Fourth edition, page 131.
  http://krishikosh.egranth.ac.in/bitstream/1/2049376/1/44688.pdf
}
\references{
  Hutchinson, J. B. and V. G. Panse (1936).
  Studies in the technique of field experiments. 
  Indian J. Agric. Sci., 5, 523-38.
}
\examples{
data(hutchinson.cotton.uniformity)
dat <- hutchinson.cotton.uniformity

# match the CV of Panse
# sd(dat$yield)/mean(dat$yield) * 100
# 32.1

# match the fertility map of Hutchinson, fig 1
if(require(desplot)){
  desplot(yield ~ col*row, dat,
          flip=TRUE, aspect=207/150, # true aspect
          main="hutchinson.cotton.uniformity")
}

}
\keyword{datasets}
