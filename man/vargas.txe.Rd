\name{vargas.txe}
\alias{vargas.txe}
\docType{data}
\title{
  Treatment x environment interaction in agronomy trials
}
\description{
  Treatment x environment interaction in agronomy trials
}

\format{
  A list of two matrices, \code{yields} and \code{covs}.
  See details below.
}
\details{

  The \code{yield} matrix contains grain yields (kg/ha) of 24 treatments
  over 10 years. Treatment names indicate:
  \tabular{ll}{
    T \tab deep knife \cr
    t \tab no deep knife \cr
    S \tab sesbania \cr
    s \tab soybean \cr
    M \tab chicken manure \cr
    m \tab no chicken manure \cr
    0 \tab no nitrogen \cr
    n \tab 100 kg/ha nitrogen \cr
    N \tab 200 kg/ha nitrogen \cr
  }

  The \code{covs} matrix contains environmental covariates for each
  year.  The names of the covariates indicate:
  \tabular{ll}{
    MT \tab mean maximum temperature sheltered \cr
    mT \tab mean minimum temperature sheltered \cr
    mTU \tab mean minimum temperature unsheltered \cr
    PR \tab total monthly precipitation \cr
    SH \tab sun hours per day \cr
    EV \tab total monthly evaporation \cr
    D \tab December \cr
    J \tab January \cr
    F \tab February \cr
    M \tab March \cr
    A \tab April \cr
  }

}
\source{
  Vargas, Mateo and Crossa, Jose and van Eeuwijk, Fred and Sayre,
  Kenneth D. and Reynolds, Matthew P. (2001).
  Interpreting Treatment x Environment Interaction in Agronomy Trials.
  \emph{Agron. J.}, 93, 949-960.  Table A1, A3.
  https://doi.org/10.2134/agronj2001.934949x

  Used with permission of Jose Crossa.
}

\examples{

data(vargas.txe)

require(lattice)
redblue <- colorRampPalette(c("firebrick", "lightgray", "#375997"))
levelplot(vargas.txe$yields, col.regions=redblue,
          main="vargas.txe", xlab="year", ylab="treatment",
          scales=list(x=list(rot=90)))

Z <- vargas.txe$yields
Z <- sweep(Z, 1, rowMeans(Z))
Z <- sweep(Z, 2, colMeans(Z)) # Double-centered like AMMI
# Vargas figure 1
biplot(prcomp(Z, scale.=FALSE), main="vargas.txe")

\dontrun{

  # Now, PLS relating the two matrices
  U <- vargas.txe$covs
  U <- scale(U) # Standardized covariates
  require(pls)
  m1 <- plsr(Z~U)
  # Vargas Fig 2, flipped vertical/horizontal
  biplot(m1, which="x", var.axes=TRUE)

}

}
\keyword{datasets}
