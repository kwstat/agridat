\name{linder.wheat}
\alias{linder.wheat}
\docType{data}
\title{
  Multi-environment trial of wheat in Switzerland
}
\description{
  Multi-environment trial of wheat in Switzerland
}
\usage{data("linder.wheat")}
\format{
  A data frame with 252 observations on the following 4 variables.
  \describe{
    \item{\code{env}}{environment}
    \item{\code{block}}{block}
    \item{\code{gen}}{genotype}
    \item{\code{yield}}{yield, in 10 kg/ha}
  }
}
\details{
  An experiment of 9 varieties of wheat in 7 localities in Switzerland
  in 1960, RCB design.
}
\source{
  Arthur Linder (1960).
  Design and Analysis of Experiments, notes on lectures held during the
  fall semester 1963 at the Statistics Department, University of North
  Carolina, page 160.
  https://www.stat.ncsu.edu/information/library/mimeo.archive/ISMS_1964_398-A.pdf
}
\references{
  None.
}
\examples{
data(linder.wheat)
dat <- linder.wheat
\dontrun{
require(gge)
dat <- transform(dat, eb=paste0(env,block))
m1 <- gge(yield~gen*eb, dat, env.group=env)
biplot(m1, main="linder.wheat")
}
}
\keyword{datasets}
