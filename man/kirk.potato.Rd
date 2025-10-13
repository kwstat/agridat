\name{kirk.potato}
\alias{kirk.potato}
\docType{data}
\title{
  Variety trial of potatoes, highly replicated
}
\description{
  Variety trial of potatoes, highly replicated
}
\usage{data("kirk.potato")}
\format{
  A data frame with 380 observations on the following 5 variables.
  \describe{
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{rep}}{replicate (not block)}
    \item{\code{gen}}{genotype (variety)}
    \item{\code{yield}}{yield, pounds per plot}
  }
}
\details{
  A highly-replicated variety trial of potatoes planted in 1924 with check plots every 5th row.
  Entries were not randomized.
  The rod rows were planted in series across the field, the rows spaced
  five links apart (nearly 3.5 feet) and with 3.5 foot passes between
  the series.

  The replicates are sometimes dis-jointed, so are not really blocks.
}
\source{
  Kirk, L. E. and C. H. Goulden (1925)
  Some statistical observations on a yield test of potato varieties.
  Scientific Agriculture, 6, 89-97.
  https://www.google.com/books/edition/Canadian_Journal_of_Agriculture_Science/TgIkAQAAMAAJ
}
\references{
  None
}
\examples{
\dontrun{
  library(agridat)
  data(kirk.potato)
  dat <- kirk.potato
  libs(desplot)
  desplot(dat, yield ~ col*row,
          flip=TRUE, aspect=1,
          main="kirk.potato")

  # Match means in Table I
  libs(dplyr)
  dat %>% group_by(gen) %>% summarize(mn=mean(yield))
}
}
\keyword{datasets}
