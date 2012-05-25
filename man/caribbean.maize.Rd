\name{caribbean.maize}
\alias{caribbean.maize}
\docType{data}
\title{
  Maize fertilization trial on Antigua and St. Vincent
}
\description{
  Maize fertilization trial on Antigua and St. Vincent.
}
\usage{data(caribbean.maize)}
\format{
  A data frame with 612 observations on the following 7 variables.
  \describe{
    \item{\code{isle}}{Island factor}
    \item{\code{site}}{Site factor}
    \item{\code{block}}{Block, factor}
    \item{\code{plot}}{Plot, numeric}
    \item{\code{trt}}{Treatment factor}
    \item{\code{ears}}{Number of ears harvested}
    \item{\code{yield}}{Yield in kilograms}
  }
}
\details{
  Antigua is a coral island in the Caribbean with sufficient level land
  for experiments and a semi-arid climate. In contrast, St. Vincent is
  volcanic and level areas are uncommon, but the rainfall can be seasonally heavy.

  Plots were 16 feet by 18 feet. A central area 12 feet by 12 feet was
  harvested and recorded.
  
  The number of ears harvested was only recorded on the isle of Antigua.

  The digits of the treatment represent the levels of nitrogen,
  phosphorus, and potassium fertilizer, respectively.

  The TEAN site suffered damage from goats on plot 27, 35 and 36.
  The LFAN site suffered damage from cattle on one boundary--plots 9, 18, 27, 36.
}
\source{
  D.F. Andrews and A.M. Herzberg. 1985.
	\emph{Data: A Collection of Problems from Many Fields for the Student
	  and Research Worker}.  Springer.

  Retrieved from \url{http://lib.stat.cmu.edu/datasets/Andrews/}.
}
\references{
  Also in the DAAG package as antigua, stVincent.
}
\examples{
dat <- caribbean.maize

# Yield and ears are highly correlated
xyplot(yield~ears|site, dat, ylim=c(0,10), subset=isle=="Antigua")

# Some locs show large response to nitrogen (as expected), e.g. UISV, OOSV
dotplot(trt~yield|site, data=dat)

}
\keyword{datasets}
