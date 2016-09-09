\name{vargas.txe}
\alias{vargas.txe}
\alias{vargas.txe.covs}
\alias{vargas.txe.yield}

\docType{data}
\title{
  Treatment x environment interaction in agronomy trials
}

\description{
  Treatment x environment interaction in agronomy trials
}

\usage{
data("vargas.txe.covs")
data("vargas.txe.yield")
}

\format{

  The 'vargas.txe.covs' data has 10 years of measurements on 28
  environmental covariates:
  \describe{
    \item{\code{year}}{Year}
    \item{\code{MTD}}{mean maximum temperature in December}
    \item{\code{MTJ}}{mean maximum temperature in January}
    \item{\code{MTF}}{mean maximum temperature in February}
    \item{\code{MTM}}{mean maximum temperature in March}
    \item{\code{MTA}}{mean maximum temperature in April}    
    \item{\code{mTD}}{mean minimum temperature in December}
    \item{\code{mTJ}}{mean minimum temperature in January}
    \item{\code{mTF}}{mean minimum temperature in February}
    \item{\code{mTM}}{mean minimum temperature in March}
    \item{\code{mTA}}{mean minimum temperature in April}
    \item{\code{mTUD}}{mean minimum temperature in December}
    \item{\code{mTUJ}}{mean minimum temperature in January}
    \item{\code{mTUF}}{mean minimum temperature in February}
    \item{\code{mTUM}}{mean minimum temperature in March}
    \item{\code{mTUA}}{mean minimum temperature in April}
    \item{\code{PRD}}{total monthly precipitation in December}
    \item{\code{PRJ}}{total monthly precipitation in Jan}
    \item{\code{PRF}}{total monthly precipitation in Feb}
    \item{\code{PRM}}{total monthly precipitation in Mar}
    \item{\code{SHD}}{sun hours per day in Dec}
    \item{\code{SHJ}}{sun hours per day in Jan}
    \item{\code{SHF}}{sun hours per day in Feb}
    \item{\code{EVD}}{total monthly evaporation in Dec}
    \item{\code{EVJ}}{total monthly evaporation in Jan}
    \item{\code{EVF}}{total monthly evaporation in Feb}
    \item{\code{EVM}}{total monthly evaporation in Mar}
    \item{\code{EVA}}{total monthly evaporation in Apr}
  }

  The 'vargas.txe.yield' dataframe contains 240 observations on
  three variables
  \describe{
    \item{\code{year}}{Year}
    \item{\code{trt}}{Treatment. See details section}
    \item{\code{yield}}{Grain yield, kg/ha}
  }

}

\details{
  
  The treatment names indicate:
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

data(vargas.txe.covs)
data(vargas.txe.yield)

if(require(reshape2)){
  
  require(lattice)
  redblue <- colorRampPalette(c("firebrick", "lightgray", "#375997"))
  Z <- vargas.txe.yield
  Z <- acast(Z, year ~ trt, value.var='yield')
  levelplot(Z, col.regions=redblue,
            main="vargas.txe.yield", xlab="year", ylab="treatment",
            scales=list(x=list(rot=90)))
  
  # Double-centered like AMMI
  Z <- sweep(Z, 1, rowMeans(Z))
  Z <- sweep(Z, 2, colMeans(Z))
  # Vargas figure 1
  biplot(prcomp(Z, scale.=FALSE), main="vargas.txe.yield")

  # Now, PLS relating the two matrices
  U <- vargas.txe.covs
  U <- scale(U) # Standardized covariates
  require(pls)
  m1 <- plsr(Z~U)
  # Vargas Fig 2, flipped vertical/horizontal
  biplot(m1, which="x", var.axes=TRUE)

}

}
\keyword{datasets}
