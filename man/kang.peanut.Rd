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

  This data is also likely used in Casanoves et al 2005,
  "Evaluation of Multienvironment Trials of Peanut Cultivars", but this
  appears to be a slightly smaller subset (only 10 genotypes, and
  perhaps only the years 96,97,98,99).  Based on the d.f. in their
  table 5, it appears that environment E13 was grown in 1998.
  (5 loc * (4-1) = 15, but the table has 14, and 98-99 had only 3 reps
  instead of 4 reps.)
}
\source{
  Data from National Institute of Agricultural Technology, Argentina.
}
\references{
  A. Saxton (2004). Genetic Analysis of Complex Traits Using SAS.
}
\examples{
dat <- kang.peanut

# Table 5.1 of Kang et al. (Chapter 5 of Saxton)
require(reshape2)
round(acast(dat, env~gen, value.var="yield", fun=mean),2)

# GGE biplot of Kang, p. 82.
m1 <- gge(yield~gen*env, data=dat, scale=FALSE)
biplot(m1, flip=c(1,1), title="kang.peanut - GGE biplot")


}
\keyword{datasets}
