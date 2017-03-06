
lib(readxl)
lib(reshape2)

setwd("c:/x/rpack/agridat/data-raw/")
dat <- read_excel("vaneeuwijk.nematodes.xlsx")
dat <- melt(dat)
names(dat) <- c('gen','pop','y')
dat$gen=factor(dat$gen)

vaneeuwijk.nematodes=dat
# ----------------------------------------------------------------------------
dat <- vaneeuwijk.nematodes

op <- par(mfrow=c(2,1), mar=c(5,4,3,2))
boxplot(y ~ pop, data=dat, las=2,
        ylab="number of cysts")
title("vaneeuwijk.nematodes - cysts per nematode pop")
boxplot(y ~ gen, data=dat, las=2)
title("vaneeuwijk.nematodes - cysts per potato")
par(op)

\dontrun{
  # normal distribution
  lm1 <- lm(y ~ gen + pop, data=dat)

  # poisson distribution
  glm1 <- glm(y ~ gen+pop,data=dat,family=quasipoisson(link=log))
  anova(glm1)

  if(require(gnm)){

    # main-effects non-interaction model
    gnm0 <- gnm(y ~ pop + gen, data=dat,
                family=quasipoisson(link=log))
    # one interaction
    gnm1 <- gnm(y ~ pop + gen + Mult(pop,gen,inst=1), data=dat,
                family=quasipoisson(link=log))
    # two interactions
    gnm2 <- gnm(y ~ pop + gen + Mult(pop,gen,inst=1) + Mult(pop,gen,inst=2),
                data=dat,
                family=quasipoisson(link=log))
    # match vaneeuwijk table 2
    anova(gnm2)
    ##                          Df Deviance Resid. Df Resid. Dev
    ## NULL                                        54     8947.4
    ## pop                       4    690.6        50     8256.8
    ## gen                      10   7111.4        40     1145.4
    ## Mult(pop, gen, inst = 1) 13    716.0        27      429.4
    ## Mult(pop, gen, inst = 2) 11    351.1        16       78.3

    # compare residual qq plots
    op <- par(mfrow=c(2,2))
    plot(lm1, which=2, main="LM")
    plot(glm1, which=2, main="GLM")
    plot(gnm0, which=2, main="GNM, no interaction")
    plot(gnm2, which=2, main="GNM, 2 interactions")
    par(op)

    # extract interaction-term coefficients, make a biplot
    pops <- pickCoef(m2, "[.]pop")
    gens <- pickCoef(m2, "[.]gen")
    coefs <- coef(m2)
    A <- matrix(coefs[pops], nc = 2)
    B <- matrix(coefs[gens], nc = 2)
    
    A2=scale(A)
    B2=scale(B)
    rownames(A2) <- levels(dat$pop)
    rownames(B2) <- levels(dat$gen)
    # near-match vaneeuwijk figure 1
    biplot(A2,B2, expand=2.5,xlim=c(-2,2),ylim=c(-2,2), main="vaneeuwijk.nematodes - GAMMI biplot")

}

