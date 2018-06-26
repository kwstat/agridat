\name{dasilva.maize}
\alias{dasilva.maize}
\docType{data}
\title{
  Multi-environment trial of maize
}
\description{
  Multi-environment trial of maize with 3 reps.
}
\usage{data("dasilva.maize")}
\format{
  A data frame with 1485 observations on the following 4 variables.
  \describe{
    \item{\code{env}}{environment}
    \item{\code{rep}}{replicate block}
    \item{\code{gen}}{genotype}
    \item{\code{yield}}{yield (tons/hectare)}
  }
}
\details{
  Each location had 3 blocks. Block numbers are unique across
  environments.

  NOTE! The environment codes in the supplemental data file of da Silva
  2015 do not match the environment codes of the paper.
  There appears to have been a shift in the environment number and one
  environment has a complete mismatch in mean yield.
  See the example below.
}
\source{
  A Bayesian Shrinkage Approach for AMMI Models.
  Carlos Pereira da Silva, Luciano Antonio de Oliveira, Joel Jorge
  Nuvunga, Andrezza Kellen Alves Pamplona, Marcio Balestre.
  Plos One. Supplemental material.
  http://doi.org/10.1371/journal.pone.0131414

  Used via Creative Commons Attribution License.
}
\references{
  J.J. Nuvunga, L.A. Oliveira, A.K.A. Pamplona, C.P. Silva, R.R. Lima
  and M. Balestre. 
  Factor analysis using mixed models of multi-environment trials with
  different levels of unbalancing.
  Genet. Mol. Res. 14.
}
\examples{
data(dasilva.maize)
dat = dasilva.maize

# Try to match Table 1 of da Silva 2015.
# aggregate(yield ~ env, data=dat, FUN=mean)
##   env     yield
## 1  E1  6.211817  # match E2 in Table 1
## 2  E2  4.549104  # E3
## 3  E3  5.152254  # E4
## 4  E4  6.245904  # E5
## 5  E5  8.084609  # E6
## 6  E6 13.191890  # E7
## 7  E7  8.895721  # E8
## 8  E8  8.685448  
## 9  E9  8.737089  # E9

# Unable to match CVs in Table 2, but who knows what they used
# for residual variance.
# aggregate(yield ~ env, data=dat, FUN=function(x) 100*sd(x)/mean(x))

}
\keyword{datasets}
