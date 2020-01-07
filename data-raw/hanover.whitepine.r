# hanover.whitepine.r
# Time-stamp: <20 Apr 2017 15:54:50 c:/x/rpack/agridat/data-done/hanover.whitepine.r>

library(asreml)
library(dplyr)
library(kw)
library(Hmisc)
library(lattice)
library(rio)

dat <- data.frame(rep=rep(c("R1","R2","R3","R4"),28),
                  female=rep(rep(cc(F193,F195,F197,F201,F203,F204,F208),each=4),4),
                  male=rep(cc(M17,M19,M22,M58), each=28),
                  length=c(447,432,350,358,438,332,324,355,
                           480,474,514,421,364,286,287,256,
                           405,373,450,433,375,234,411,262,
                           420,331,458,382,
                           341,246,365,297,310,219,269,297,
                           292,232,297,218,292,310,248,252,
                           432,414,359,385,263,236,227,268,
                           323,272,238,245,
                           352,417,544,381,327,343,272,338,
                           376,338,354,338,326,438,362,375,
                           346,321,314,311,283,378,375,329,
                           445,304,289,420,
                           343,336,410,363,432,323,365,308,
                           319,373,315,387,341,296,367,237,
                           295,317,267,284,293,320,252,313,
                           373,331,373,330))
dat <- mutate(dat, length=length/100)
hanover.whitepine <- dat

# ----------------------------------------------------------------------------

dat <- hanover.whitepine

if(require(lattice)){
  # Relatively high male-female interaction in growth comared
  # to additive gene action
  bwplot(length ~ male|female, data=dat,
         main="hanover.whitepine - length for male:female crosses",
         xlab="Male parent", ylab="Epicotyl length")
  # bwplot(length ~ female|male, data=dat)
}

if(require(tidyr)) {
  # Check sums in Becker table 1
  sum(dat$length) # 380.58
  dat %>% group_by(female,male) %>%
    summarise(length=sum(length)) %>% spread(male,length)
}

# Sum of squares matches Becker p 85
m1 <- aov(length ~ rep + male + female + male:female, data=dat)
anova(m1)

# Variance components match Becker p. 85
require(lme4)
m2 <- lmer(length ~ (1|rep) + (1|male) + (1|female) + (1|male:female), data=dat)
as.data.frame(VarCorr(m2))
##           grp        var1 var2       vcov     sdcor
## 1 male:female (Intercept) <NA> 0.13685044 0.3699330
## 2      female (Intercept) <NA> 0.02094474 0.1447230
## 3        male (Intercept) <NA> 0.12036063 0.3469303
## 4         rep (Intercept) <NA> 0.01453027 0.1205415
## 5    Residual        <NA> <NA> 0.20042510 0.4476886

# Becker used this value for variability between individuals, within plot
s2w <- 1.109

# Calculating heritability for individual trees
s2m <- .120
s2f <- .0209
s2mf <- .137
vp <- s2m + s2f + s2mf + s2w  # variability of phenotypes = 1.3869
4*s2m / vp # heritability male 0.346
4*s2f / vp # heritability female 0.06
2*(s2m+s2f)/vp # heritability male+female .203
# As shown in the boxplot, heritability is stronger through the
# males than through the females.
