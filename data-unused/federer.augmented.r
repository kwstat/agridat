# federer.augmented.r
# Time-stamp: <13 Sep 2017 14:07:08 c:/x/rpack/agridat/data-unused/federer.augmented.r>

This simulated data is from:

Federer, Walter T.
Augmented Split-Block Experiment Design
Agronomy Journal, Vol 97, page 578--586, 2005.

Note that using the values in Table 6 does NOT give
the results shown in the paper.  To match the output as shown in the paper,
make the following changes:

Table position   PDF from Agronomy Journ       Datalines from SAS program
A9 B8            15                            25
A9 B9            14                            34
A8 B9            15                            45


dat <- read.csv("federer.augmented.csv")
dat$newa <- ifelse(dat$a < -9, 1, 0)
dat$an <- ifelse(dat$newa==1, 99, dat$a)
dat$newb <- ifelse(dat$b<=6, 1, 0)
dat$bn <- ifelse(dat$newb==1, 999, dat$b)
dat <- transform(dat,
                 rep=factor(rep), a=factor(a), b=factor(b),
                 bn=factor(bn), an=factor(an))

# GLM anova table
dat.aov <- aov(y~rep*a*b,data=dat)
# GLM anova table
dat.aov <- aov(y~rep*an*bn,data=dat)

# this does not seem right

dat$anewa <- with(dat, interaction(a, newa, sep=":"))
dat$bnewb <- with(dat, interaction(b, newb, sep=":"))
library(lme4)

dat$newaf <- factor(dat$newa)
dat$newbf <- factor(dat$newb)
dat.lme <- lmer(y~an + bn+ an:bn+(1|rep) + (1|a:newaf) + (1|b:newbf),data=dat)

dat.lme <- lmer(y~an + bn+ an:bn+(1|rep) + (1|a:newa),data=dat)
dat.lme <- lmer(y~an + bn+ an:bn+(1|rep) + (1|bnewb),data=dat)
dat.lme <- lmer(y~an + bn+ an:bn+(1|rep) + (1|anewa) + (1|bnewb),data=dat)


# asreml is very easy to use and has very close agreement with SAS.
library(asreml)
dat.asreml <- asreml(y~an+bn+an:bn, data=dat, random=~rep+a:newa+b:newb)

# Least squares means
predict(dat.asreml, classify=list("an","bn","an:bn"))$predictions

# Fixed effects.  Different from SAS, probably due to parameterization
# differences between R and SAS
coef(dat.asreml)$fix

# Random effects
summary(dat.asreml)$coef.random

# Tests of fixed effects.  Slightly different from SAS
# (asreml uses Wald tests)
anova(dat.asreml)
