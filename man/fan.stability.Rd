\name{fan.stability}
\alias{fan.stability}
\docType{data}
\title{
  Maize hybrids grown in China
}
\description{
  Yield of 13 hybrids, grown in 10 locations across 2 years.  Conducted
  in Yunnan, China.
}
\usage{data(fan.stability)}
\format{
  A data frame with 260 observations on the following 5 variables.
  \describe{
    \item{\code{gen}}{genotype factor}
    \item{\code{maturity}}{maturity, days}
    \item{\code{year}}{year}
    \item{\code{loc}}{location factor}
    \item{\code{yield}}{yield, Mg/ha}
  }
}
\details{
  Data are the mean of 3 reps.
  
  These data were used to conduct a stability analysis of yield.
}
\source{
  Fan, X.M. and Kang, M.S. and Chen, H. and Zhang, Y. and Tan, J. and
  Xu, C. (2007). Yield stability of maize hybrids evaluated in
  multi-environment trials in Yunnan, China. \emph{Agronomy Journal},
  99, 220-228.
  \url{https://www.soils.org/publications/aj/abstracts/99/1/220}

  Used with permission of Manjit Kang.
}

\examples{
data(fan.stability)
dat <- fan.stability

dat$env <- factor(paste(dat$loc, dat$year, sep=""))
require('reshape2')
dm <- acast(dat, gen~env, value.var="yield")
require('agricolae')
# Use 0.464 as pooled error from ANOVA.  Calculate yield mean/stability.
stability.par(dm, rep=3, MSerror=0.464) # Table 5 of Fan et al.
}
\keyword{datasets}
