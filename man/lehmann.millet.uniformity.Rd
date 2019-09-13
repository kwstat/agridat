\name{lehmann.millet.uniformity}
\alias{lehmann.millet.uniformity}
\docType{data}
\title{
  Uniformity trial of millet in India
}
\description{
  Uniformity trial of millet in India, 3 years on same land.
}
\usage{data("lehmann.millet.uniformity")}
\format{
  A data frame with 396 observations on the following 5 variables.
  \describe{
    \item{\code{year}}{year}
    \item{\code{plot}}{plot (row)}
    \item{\code{range}}{range (column)}
    \item{\code{yield}}{grain yield (pounds)}
    \item{\code{total}}{total crop yield (pounds)}
  }
}
\details{

The 6th report has a map (only partially scanned in the pdf).
The ninth report, pages 1-10 has comments. Pages 36-39 have data: Table 1 has grain yield, table 2 total yield.

Experiment farm near Bangalore. The plots are 1/10 acre, each 50 links wide and 200 links long. [6th report, p. 2]

The season of 1906 was abnormally wet compared with 1905 and 1907. [9th report]

}
\source{
  Department of Agriculture, Mysore State.
  [2nd-9th] Annual Report of the Agricultural Chemist. 
  https://books.google.com/books?id=u_dHAAAAYAAJ
}
\references{
  None
}
\examples{

library(agridat)
data(lehmann.millet.uniformity)
dat <- lehmann.millet.uniformity

\dontrun{
  libs(desplot)
  dat$year = factor(dat$year)
  desplot(yield ~ range*plot|year, dat, aspect=(22*50)/(6*200),
          main="lehmann.millet.uniformity",
          flip=TRUE, tick=TRUE)
  desplot(total ~ range*plot|year, dat, aspect=(22*50)/(6*200),
          main="lehmann.millet.uniformity",
          flip=TRUE, tick=TRUE)
  
  libs(dplyr)
  group_by(dat, year) %>% summarize(yield=mean(yield, na.rm=TRUE))
}
}
\keyword{datasets}
