\name{goulden.latin}
\alias{goulden.latin}
\docType{data}
\title{
  Latin square experiment for testing fungicide
}
\description{
  Latin square experiment for testing fungicide
}
\usage{data(goulden.latin)}
\format{
  A data frame with 25 observations on the following 4 variables.
  \describe{
    \item{\code{trt}}{treatment factor, 5 levels}
    \item{\code{yield}}{yield}
    \item{\code{row}}{row}
    \item{\code{col}}{column}
  }
}
\details{

  Five treatments were tested to control stem rust in wheat.  Treatment
  codes and descriptions:
  A  =  Dusted before rains.
  B  =  Dusted after rains.
  C  =  Dusted once each week.
  D  =  Drifting, once each  week.
  E  =  Not dusted.

}
\source{
  G. Goulden (1952). \emph{Methods of Statistical Analysis}. 2nd ed. Page 216.
}

\examples{

dat <- goulden.latin

# Matches Goulden.
m1 <- lm(yield~ trt + factor(row) + factor(col), data=dat)
anova(m1)

}
\keyword{datasets}
