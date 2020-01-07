# becker.chicken.r
# Time-stamp: <22 Sep 2016 13:04:37 c:/x/rpack/agridat/data-done/becker.chicken.r>

library(asreml)
library(dplyr)
library(kw)
library(Hmisc)
library(lattice)
library(rio)

dat <- data.frame(male = rep(rep(cc(M1,M2,M3,M4,M5), each=3),3),
                  female=rep(cc(F01,F02,F03,F04,F05,F06,F07,F08,F09,F10,F11,F12,F13,F14,F15),3),
                  weight=c(965,803,644,740,701,909,696,752,686,979,905,797,809,887,872,
                           813,640,753,798,847,800,807,863,832,798,880,721,756,935,811,
                           765,714,705,941,909,853,800,739,796,788,770,765,775,937,925))
becker.chicken <- dat

# ----------------------------------------------------------------------------

dat <- becker.chicken

# Sums match Becker
if(require(dplyr)) {
  dat %>% summarise(weight=sum(weight))
  dat %>% group_by(male,female) %>% summarise(weight=sum(weight))
}

if(require(lme4)){
  m1 <- lmer(weight ~  (1|male) + (1|female), data=dat)
  as.data.frame(VarCorr(m1))
       ## grp        var1 var2      vcov    sdcor
## 1   female (Intercept) <NA> 1095.6296 33.10030
## 2     male (Intercept) <NA>  776.7543 27.87031
## 3 Residual        <NA> <NA> 5524.4000 74.32631
}

# Calculate heritabilities
s2m <- 776  # variability for males
s2f <- 1095 # variability for females
s2w <- 5524 # variability within crosses
vp <- s2m + s2f + s2w # 7395
4*s2m/vp # .42 male heritability
4*s2f/vp # .59 female heritability
