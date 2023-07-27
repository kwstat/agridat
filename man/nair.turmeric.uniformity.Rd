\name{nair.turmeric.uniformity}
\alias{nair.turmeric.uniformity}
\docType{data}
\title{
  Uniformity trial of turmeric.
}
\description{
  Uniformity trial of turmeric in India, 1984.
}
\usage{data("nair.turmeric.uniformity")}
\format{
  A data frame with 864 observations on the following 3 variables.
  \describe{
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{yield}}{yield per plot, kg}
  }
}
\details{

  An experiment conducted at the College of Horticulture, Vellanikkara,
  India, in 1984. The crop was grown in raised beds.

  The gross experimental area was 74.2 m long x 15.2 m wide. Small
  elevated beds 0.6 m x 1.5 m were raised providing channels of 0.4 m
  around each bed. One row of beds all around the experiment was
  discarded to eliminate border effects. After discarding the borders,
  there were 432 beds in the experiment. At the time of harvest, each
  bed was divided into equal plots of size .6 m x .75 m, and the yield
  from each plot was recorded.
  
  Field map on page 64 of Nair.   Nair focused mostly on the statistical
  methods and did not discuss the actual experimental results in very
  much detail. 

  There are an excess number of plots with 0 yield.

  Field length: 14 plots * .6 m + 13 alleys * .4 m = 13.6 m

  Field width: 72 plots * .75 m + 35 alleys * .4 m = 68 m

  Data found in the appendix.
  
}
\source{
  Nair, B. Gopakumaran  (1984).
  Optimum plot size for field experiments on turmeric.
  Thesis, Kerala Agriculture University.
  https://krishikosh.egranth.ac.in/handle/1/5810147397
}
\references{
  None.
}
\examples{
\dontrun{
  
  library(agridat)
  data(nair.turmeric.uniformity)
  dat <- nair.turmeric.uniformity

  libs(lattice)
  qqmath( ~ yield, dat)
  libs(desplot)
  desplot(dat, yield ~ col*row,
          flip=TRUE, aspect=13.6/68,
          main="nair.turmeric.uniformity")

}
}
\keyword{datasets}
