\name{petersen.sorghum.cowpea}
\alias{petersen.sorghum.cowpea}
\docType{data}
\title{
  Intercropping experiment of sorghum/cowpea
}
\description{
  Intercropping experiment of sorghum/cowpea.
}
\usage{data("petersen.sorghum.cowpea")}
\format{
  A data frame with 18 observations on the following 5 variables.
  \describe{
    \item{\code{block}}{block}
    \item{\code{srows}}{sorghum rows}
    \item{\code{crows}}{cowpea rows}
    \item{\code{syield}}{sorghum yield, kg/ha}
    \item{\code{cyield}}{cowpea yield, kg/ha}
  }
}
\details{
  An intercropping experiment in Tanzania.  The treatments consisted of
  four ratios of sorghum rows to cowpea rows as 1:4, 2:3, 3:2, 4:1.

  The sole-crop yields with 5 rows per crop are also given (not part of
  the blocks).
}
\source{
  Roger G Petersen (1994).
  Agricultural Field Experiments.
  Marcel Dekker Inc, New York.
  Page 372.
}
\references{
  None
}
\examples{
libs(agridat)
data(petersen.sorghum.cowpea)
dat <- petersen.sorghum.cowpea

# Petersen figure 10.4a
tmp <- dat %>% group_by(srows,crows) %>% summarize(syield=mean(syield), cyield=mean(cyield))

with(tmp, plot(srows, syield + cyield,
               col="blue", type='l', xlim=c(0,5), ylim=c(0,4000)) )
with(tmp, lines(srows, syield) )
with(tmp, lines(srows, cyield, col="red") )
title("Cow Pea (red), Sorghum (black), Total (blue)")
title("petersen.sorghum.cowpea", line=0.5)

}
\keyword{datasets}
