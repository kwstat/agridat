# acorsi.r
# Time-stamp: <23 Feb 2017 16:21:01 c:/x/rpack/agridat/data-raw/acorsi.r>

library(asreml)
library(dplyr)
library(kw)
library(lattice)
library(readxl)
library(readr)
library(reshape2)
library(tibble)


setwd("c:/x/rpack/agridat/data-raw/")
dat <- read_excel("acorsi.grayleafspot.xlsx")

rn <- dat[,1]
dat <- as.matrix(dat[,-1])
rownames(dat) <- rn[[1]]
dat <- melt(dat)
names(dat) <- c('gen','env','y')

acorsi.grayleafspot <- dat
# ----------------------------------------------------------------------------

dat <- acorsi.grayleafspot
# acorsi figure 2
op <- par(mfrow=c(2,1), mar=c(5,4,3,2))
boxplot(y ~ env, dat, xlab="environment", las=2)
boxplot(y ~ gen, dat, xlab="genotype", las=2)
par(op)

dontrun{
  # try to reproduce the results of acorsi, but this does not converge, perhaps
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
  deviance(m2) # 10^18 nonsense
  
  # Turner makes a biplot like this. Why?
  pred2 <- matrix(m2$predictors, 36, 9) # 36 gen, 9 env
  svd2 <- svd(pred2)
  A <- sweep(svd2$v, 2, sqrt(svd2$d), "*")[, 1:2]
  B <- sweep(svd2$u, 2, sqrt(svd2$d), "*")[, 1:2]
  biplot(A,B)
}
