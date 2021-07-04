\name{gomez.heterogeneity}
\alias{gomez.heterogeneity}
\docType{data}
\title{
  RCB experiment of rice, heterogeneity of regressions
}
\description{
  RCB experiment of rice, heterogeneity of regressions
}
\usage{data("gomez.heterogeneity")}
\format{
  \describe{
    \item{\code{gen}}{genotype}
    \item{\code{yield}}{yield kg/ha}
    \item{\code{tillers}}{tillers no/hill}
  }
}
\details{
  
  An experiment with 3 genotypes to examine the relationship of yield to
  number of tillers.

  Used with permission of Kwanchai Gomez.
  
}

\source{
  Gomez, K.A. and Gomez, A.A.. 1984,
  Statistical Procedures for Agricultural Research.
  Wiley-Interscience.
  Page 377.
}
\references{
  None.
}

\examples{
\dontrun{

library(agridat)
data(gomez.heterogeneity)
dat <- gomez.heterogeneity

  libs(lattice)
  xyplot(yield ~ tillers, dat, groups=gen,
         type=c("p","r"),
         main="gomez.heterogeneity")
}
}
\keyword{datasets}
