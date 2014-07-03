\name{kang.peanut}
\alias{kang.peanut}
\docType{data}
\title{
  Peanut yields for 10 genotypes in 15 environments
}
\description{
  Peanut yields for 10 genotypes in 15 environments
}
\usage{data(kang.peanut)}
\format{
  A data frame with 590 observations on the following 4 variables.
  \describe{
    \item{\code{gen}}{genotype factor, 10 levels}
    \item{\code{rep}}{replicate factor, 4 levels}
    \item{\code{yield}}{yield}
    \item{\code{env}}{environment factor, 15 levels}
  }
}
\details{
  Florman, Tegua, mf484, mf485, mf487, mf489 have a long crop cycle.
  The others have a short crop cycle.
}
\source{
  Data from National Institute of Agricultural Technology, Argentina.
}
\references{
  A. Saxton (2004). Genetic Analysis of Complex Traits Using SAS.
}
\examples{
dat <- kang.peanut

# Table 5.1 of Kang et al.
require(reshape2)
round(acast(dat, env~gen, value.var="yield", fun=mean),2)

# GGE biplot of Kang, p. 82.
# m1 <- gge(yield~gen*env, data=dat, scale=FALSE)
# biplot(m1, flip=c(1,1), title="kang.peanut")

}
\keyword{datasets}
