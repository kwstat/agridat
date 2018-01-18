\name{robinson.peanut.uniformity}
\alias{robinson.peanut.uniformity}
\docType{data}
\title{
  Uniformity trial of peanuts
}
\description{
  Uniformity trial of peanuts in North Carolina in 1939, 1940.
}
\usage{data("robinson.peanut.uniformity")}
\format{
  A data frame with 1152 observations on the following 4 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield in grams/plot}
    \item{\code{year}}{year}
  }
}
\details{
  Two crops of peanuts were grown in North Carolina in 1939 and 1940. A different field was used each year.
  
  A block of 36 rows 3 feet wide and 200 feet long were harvested in 12.5 foot lengths.

  Field length: 200 feet
  
  Field width: 16 plots * 3 feet = 48 feet
  
  Widening the plot was not as effective as increasing the plot length in order to reduce error. This agrees with the results of other uniformity studies.
  
  Assuming 30 percent of the total cost of an experiment is proportional to the size of the plots used, the optimum plot size is approximately 3.2 units.

}
\source{
  H.F. Robinson and J.A.Rigney and P.H.Harvey (1948).
  Investigations In Peanut Plot Technique With Peanuts.
  Univ California Tech. Bul. No 86.
}
\references{
  None
}
\examples{
data(robinson.peanut.uniformity)
dat <- robinson.peanut.uniformity

# Mean yield per year. Robinson has 703.9, 787.3
# tapply(dat$yield, dat$year, mean)
#     1939     1940 
# 703.7847 787.8125 

if(require(desplot)){
  desplot(yield ~ col*row|year, dat,
          flip=TRUE, tick=TRUE, aspect=200/48,
          main="robinson.peanut.uniformity")
}

}
\keyword{datasets}
