\name{vold.longterm}
\alias{vold.longterm}
\docType{data}
\title{
  Long-term barley yields at different fertilizer levels
}
\description{
  Long-term barley yields at different fertilizer levels
}
\usage{data("vold.longterm")}
\format{
  A data frame with 76 observations on the following 3 variables.
  \describe{
    \item{\code{year}}{year}
    \item{\code{nitro}}{nitrogen fertilizer, grams/m^2}
    \item{\code{yield}}{yield, grams/m^2}
  }
}
\details{
  Trials conducted at Osaker, Norway.
  Nitrogen fertilizer amounts were increased by twenty percent in 1978.

  Vold (1998) fit a Michaelis-Menten type equation with a different
  maximum in each year and a decreasing covariate for non-fertilizer
  nitrogen.

  Miguez used a non-linear mixed effects model with asymptotic curve.
}

\source{
  Arild Vold (1998).
  A generalization of ordinary yield response functions.
  \emph{Ecological modelling}, 108, 227-236.
}

\references{
  Fernando E. Miguez (2008).
  Using Non-Linear Mixed Models for Agricultural Data.
}

\examples{
 # None
}
\keyword{datasets}
