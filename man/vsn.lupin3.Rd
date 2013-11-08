\name{vsn.lupin3}
\alias{vsn.lupin3}
\docType{data}
\title{
  Early generation lupin trial with 3 sites
}
\description{
  Early generation lupin trial with 3 sites, 330 test lines, 6 check lines.
}

\format{
  A data frame with 1236 observations on the following 5 variables.
  \describe{
    \item{\code{site}}{a factor with levels \code{S1} \code{S2} \code{S3}}
    \item{\code{col}}{a numeric vector}
    \item{\code{row}}{a numeric vector}
    \item{\code{gen}}{a numeric vector}
    \item{\code{yield}}{a numeric vector}
  }
}
\details{
  An early-stage multi-environment trial, with 6 check lines and 300
  test lines.  The 6 check lines were replicated in each environment.
}
\source{
  Multi-Environment Trials - Lupins.
  \url{http://www.vsni.co.uk/software/asreml/htmlhelp/asreml/xlupin.htm}

  Used with permission of Arthur Gilmour, Brian Cullis, Robin Thompson.
}

\examples{

dat <- vsn.lupin3

# Split gen into check/test, make factors
dat <- within(dat, {
  check <- ifelse(gen>336, 0, gen)
  check <- ifelse(check<7, check, 7)
  check <- factor(check)
  test <- factor(ifelse(gen>6 & gen<337, gen, 0))
  gen=factor(gen)
})

desplot(yield~ col*row|site, dat, main="vsn.lupin3")
desplot(check~ col*row|site, dat,
        main="vsn.lupin3: check plot placement") # Site 1 & 2 used same randomization

\dontrun{
require("asreml")

# Single-site analyses suggested random row term for site 3, random column terms
# for all sites, AR1 was unnecessary for the col dimension of site 3
dat <- transform(dat, colf=factor(col), rowf=factor(row))
dat <- dat[order(dat$site, dat$colf, dat$rowf),] # Sort for asreml
m1 <- asreml(yield ~ site + check:site, data=dat,
             random = ~ at(site):colf + at(site,3):rowf + test,
             rcov = ~ at(site,c(1,2)):ar1(colf):ar1(rowf)
             + at(site,3):id(colf):ar1(rowf))
m1$loglik
summary(m1)$varcomp
# Variance components
#                      Effect Estimate  Std Err Z Ratio Con
#  at(site, S1):colf!colf.var  0.6228  0.4284       1.5 Pos
#  at(site, S2):colf!colf.var  0.159   0.1139       1.4 Pos
#  at(site, S3):colf!colf.var  0.04832 0.02618      1.8 Pos
#  at(site, S3):rowf!rowf.var  0.0235  0.008483     2.8 Pos
#               test!test.var  0.1031  0.01468      7   Pos
#            site_S1!variance  2.771   0.314        8.8 Pos
#            site_S1!colf.cor  0.1959  0.05375      3.6 Unc
#            site_S1!rowf.cor  0.6503  0.03873     17   Unc
#            site_S2!variance  0.9926  0.1079       9.2 Pos
#            site_S2!colf.cor  0.2868  0.05246      5.5 Unc
#            site_S2!rowf.cor  0.5744  0.0421      14   Unc
#            site_S3!variance  0.1205  0.01875      6.4 Pos
#            site_S3!rowf.cor  0.6394  0.06323     10   Unc

# Add site:test
m2 <- update(m1, random=~. + site:test)
m2$loglik

# CORUH structure on the site component of site:test
m3 <- asreml(yield ~ site + check:site, data=dat,
             random = ~ at(site):colf + at(site,3):rowf + corh(site):test,
             rcov = ~ at(site,c(1,2)):ar1(colf):ar1(rowf)
             + at(site,3):id(colf):ar1(rowf))
m3$loglik

# Unstructured genetic variance matrix
m4 <- asreml(yield ~ site + check:site, data=dat,
             random = ~ at(site):colf + at(site,3):rowf + us(site):test,
             rcov = ~ at(site,c(1,2)):ar1(colf):ar1(rowf)
             + at(site,3):id(colf):ar1(rowf))
m4$loglik

# Note that a 3x3 unstructured matrix can be written LL'+Psi with 1 factor L
# Explicitly fit the factor analytic model
m5 <- asreml(yield ~ site + check:site, data=dat,
             random = ~ at(site):colf + at(site,3):rowf
               + fa(site,1, init=c(.7,.1,.1,.5,.3,.2)):test,
             rcov = ~ at(site,c(1,2)):ar1(colf):ar1(rowf)
             + at(site,3):id(colf):ar1(rowf))
m5$loglik # Same as m4

# Model 4, Unstructured (symmetric) genetic variance matrix
un <- diag(3)
un[upper.tri(un,TRUE)] <- m4$gammas[5:10]
round(un+t(un)-diag(diag(un)),3)

# Model 5, FA matrix = LL'+Psi.  Not quite the same as unstructured,
# since the FA model fixes site 2 variance at 0.
psi <- diag(m5$gammas[5:7])
lam <- matrix(m5$gammas[8:10], ncol=1)
round(tcrossprod(lam,lam)+psi,3)

}
}
\keyword{datasets}
