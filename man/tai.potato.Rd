\name{tai.potato}
\alias{tai.potato}
\docType{data}
\title{
  Multi-environment trial of potato
}
\description{
  Multi-environment trial of potato tuber yields
}
\usage{data("tai.potato")}
\format{
  A data frame with 48 observations on the following 6 variables.
  \describe{
    \item{\code{yield}}{yield, kg/plot}
    \item{\code{gen}}{genotype code}
    \item{\code{variety}}{variety name}
    \item{\code{env}}{environment code}
    \item{\code{loc}}{location}
    \item{\code{year}}{year}
  }
}
\details{
  Mean tuber yield of 8 genotypes in 3 locations over two years.
  Katahdin and Sebago are check varieties.  Each location was planted as
  a 4-rep RCB design.

  In Tai's plot of the stability parameters, F5751 and Sebago were in
  the average stability area.  The highest yielding genotype F6032 had
  an unstable performance.
}

\source{
  G.C.C. Tai, 1971.
  Genotypic stability analysis and its application to potato regional trials.
  Crop Sci 11, 184-190.  Table 2, p. 187.
  http://doi.org/10.2135/cropsci1971.0011183X001100020006x
}

\references{
  George Fernandez (1991).
  Analysis of Genotype x Environment Interaction by Stability Estimates.
  \emph{Hort Science}, 26, 947-950.
}

\examples{
data(tai.potato)
dat = tai.potato

require(lattice)
dotplot(variety ~ yield|env, dat, main="tai.potato")

# fixme - need to add tai() example

# note, st4gi::tai assumes there are replications in the data
# https://github.com/reyzaguirre/st4gi/blob/master/R/tai.R

}
\keyword{datasets}
