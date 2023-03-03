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

  Experiment farm near Bangalore. The plots are 1/10 acre, each 50 links
  wide and 200 links long. [6th report, p. 2]. The middle part of the
  field is occupied by buildings.

  The 6th report:
  Map (only partially scanned in the pdf).
  "A part of the dry lands nearest the tank, which is not quite as uniform as the remainder, is already excluded from the experimental ground proper".

  The 7th report:
  P. 12 has grain/straw yield for 1905.
   
  The 9th report:
  P. 1-10 has comments.
  P. 36-39 have data: Table 1 has grain yield, table 2 total yield of
  grain and straw. Columns are, left-right, A-F. Rows are, top-bottom,
  1-22. 
  
  The season of 1906 was abnormally wet compared with 1905 and 1907. [9th report]

  Field width: 6 plots * 200 links

  Field length: 22 plots * 50 links
  
}
\source{
  Lehmann, A.
  Ninth Annual Report of the Agricultural Chemist For the Year 1907-08.
  Department of Agriculture, Mysore State.
  [2nd-9th] Annual Report of the Agricultural Chemist. 
  https://books.google.com/books?id=u_dHAAAAYAAJ
}
\references{
  None
}
\examples{
\dontrun{
  
  library(agridat)
  data(lehmann.millet.uniformity)
  dat <- lehmann.millet.uniformity

  libs(desplot)
  dat$year = factor(dat$year)
  desplot(dat, yield ~ range*plot|year,
          aspect=(22*50)/(6*200),
          main="lehmann.millet.uniformity",
          flip=TRUE, tick=TRUE)
  desplot(dat, total ~ range*plot|year,
          aspect=(22*50)/(6*200),
          main="lehmann.millet.uniformity",
          flip=TRUE, tick=TRUE)
  
  # libs(dplyr)
  # group_by(dat, year) %>% summarize(yield=mean(yield, na.rm=TRUE))
}
}
\keyword{datasets}
