\name{huehn.wheat}
\alias{huehn.wheat}
\docType{data}
\title{
  Multi-environment trial to illustrate stability statistics
}

\description{
  Multi-environment trial to illustrate stability statistics
}

\usage{data("huehn.wheat")}
\format{
  A data frame with 200 observations on the following 3 variables.
  \describe{
    \item{\code{gen}}{genotype}
    \item{\code{env}}{environment}
    \item{\code{yield}}{yield dt/ha}
  }
}

\details{
  Yields for a winter-wheat trial of 20 genotypes at 10 environments.

  Note: Huehn 1979 does not use genotype-centered data when calculating
  stability statistics.  
}

\source{

  Manfred Huehn (1979).
  Beitrage zur Erfassung der phanotypischen Stabilitat I.
  Vorschlag einiger auf Ranginformationen beruhenden Stabilitatsparameter. 
  \emph{EDV in Medizin und Biologie}, 10 (4), 112-117.  Table 1.
  http://nbn-resolving.de/urn:nbn:de:bsz:15-qucosa-145979

}
\references{

  Nassar, R and Huehn, M. (1987).
  Studies on estimation of phenotypic stability: Tests of significance
  for nonparametric measures of phenotypic stability.
  \emph{Biometrics}, 43, 45-53.
  
}

\examples{

data(huehn.wheat)
dat <- huehn.wheat

\dontrun{
  
require(reshape2)
datm <- acast(dat, gen~env, value.var='yield')

apply(datm,1,mean) # Gen means match Huehn 1979 table 1
apply(datm,2,mean) # Env means
apply(datm, 2, rank) # Ranks match Huehn table 1

# Huehn 1979 did not use genotype-centered data, and his definition
# of S2 is different from later papers.
  if(require(stable)){
apply(huehn(datm, corrected=FALSE), 2, round,2) # S1 matches Huehn
##          MeanRank   S1
## Jubilar      6.70 3.62
## Diplomat     8.35 5.61
## Caribo      11.20 6.07
## Cbc710      13.65 6.70

# Very close match to Nassar & Huehn 1987 table 4.
apply(huehn(datm, corrected=TRUE), 2, round,2)
##          MeanRank   S1   Z1    S2   Z2
## Jubilar      10.2 4.00 5.51 11.29 4.29
## Diplomat     11.0 6.31 0.09 27.78 0.27
## Caribo       10.6 6.98 0.08 34.49 0.01
## Cbc710       10.9 8.16 1.78 47.21 1.73

  }
}

}
\keyword{datasets}
