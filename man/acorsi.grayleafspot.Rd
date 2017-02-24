\name{acorsi.grayleafspot}
\alias{acorsi.grayleafspot}
\docType{data}
\title{
  Multi-environment trial evaluating 36 maize genotypes in 9 locations 
}
\description{
  Multi-environment trial evaluating 36 maize genotypes in 9 locations 
}
\usage{data("acorsi.grayleafspot")}
\format{
  A data frame with 324 observations on the following 3 variables.
  \describe{
    \item{\code{gen}}{genotype, 36 levels}
    \item{\code{env}}{environment, 9 levels}
    \item{\code{y}}{grey leaf spot severity}
  }
}
\details{
  The response variable is the mean of two reps, of the percentage of
  leaf area affected by gray leaf spot within each rep.
  
  Acorsi et al use this data to illustrate the fitting of a generalized
  AMMI model with non-normal data.
}
\source{
  C. R. L. Acorsi, T. A. Guedes, M. M. D. Coan, R. J. B. Pinto,
  C. A. Scapim, C. A. P. Pacheco, P. E. O. Guimaraes,
  C. R. Casela. (2016).
  Applying the generalized additive main effects and multiplicative
  interaction model to analysis of maize genotypes resistant to grey leaf spot.
  \emph{Journal of Agricultural Science}.
  http://doi.org/10.1017/S0021859616001015

  Used with permission of Marlon Coan.
}
\references{
  None
}
\examples{
data(acorsi.grayleafspot)
dat <- acorsi.grayleafspot

# Acorsi figure 2
op <- par(mfrow=c(2,1), mar=c(5,4,3,2))
boxplot(y ~ env, dat, las=2,
        xlab="environment", ylab="GLS severity")
title("acorsi.grayleafspot")
boxplot(y ~ gen, dat, las=2,
        xlab="environment", ylab="GLS severity")
par(op)

\dontrun{
  # try to reproduce the results of Acorsi, but this does not converge, perhaps
  # because this data is based on means in acorsi, instead of the raw data for
  # the individual reps?  Or maybe the model syntax is wrong?  FIXME.
  require(gnm)

  # model 0, link logit. Acorsi fig 3
  m0 <- gnm(y ~ gen+env,
            data=dat, family=quasibinomial())
  # plot(m0, which=1)
  # plot(m0, which=2)
  
  # model 2, GAMMI model. See section 7.4 of Turner
  # "Generalized nonlinear models in R: An overview of the gnm package"
  set.seed(2)
  m1 <- gnm(y ~ gen + env, data=dat, family=wedderburn)
  deviance(m1) # 380
  m20 <- residSVD(m1, gen, env, 2)
  m2 <- update(m1, y ~ gen + env + Mult(gen, env, inst=1) + Mult(gen, env, inst=2), data=dat,
               start=c(coef(m1), m20[,1], m20[,2]))
  deviance(m2) # 10^18 nonsense convergence
  
  # Turner makes a biplot like this. Why?
  pred2 <- matrix(m2$predictors, 36, 9) # 36 gen, 9 env
  svd2 <- svd(pred2)
  A <- sweep(svd2$v, 2, sqrt(svd2$d), "*")[, 1:2]
  B <- sweep(svd2$u, 2, sqrt(svd2$d), "*")[, 1:2]
  biplot(A,B)
}

}
\keyword{datasets}
