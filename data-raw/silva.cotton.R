# silva.cotton2.R
# Time-stamp: <26 Sep 2017 14:22:01 c:/x/rpack/agridat/data-raw/silva.cotton.R>

library(asreml)
library(dplyr)
library(kw)
library(lattice)
library(readxl)
library(readr)
library(reshape2)
library(tibble)

setwd("c:/x/rpack/agridat/data-raw/")
dat <- read_csv("silva.cotton.csv")

silva.cotton <- dat

# ----------------------------------------------------------------------------

dat <- silva.cotton
dat$stage <- ordered(dat$stage,
                     levels=c("vegetative","flowerbud","blossom","boll","bollopen"))
# make stage and defoliation numeric factors
dat <- transform(dat,                 
                 stage = factor(stage, levels = unique(stage),
                                labels = 1:nlevels(stage)))

# sum data across plants, 1 pot = 2 plants
dat <- aggregate(cbind(weight,height,bolls,nodes) ~
                    stage+defoliation+rep, data=dat, FUN=sum)

# all traits, plant-level data
if(require(latticeExtra)){
  foo <- xyplot(weight + height + bolls + nodes ~ defoliation | stage,
                data = dat, outer=TRUE,
                xlab="Defoliation percent", ylab="", main="silva.cotton",
                as.table = TRUE, jitter.x = TRUE, type = c("p", "smooth"),
                scales = list(y = "free"))
  combineLimits(useOuterStrips(foo))
}

\dontrun{

# glm with quadratic effect for defoliation
m0 <- glm(bolls ~ 1, data=dat, family=poisson)
m1 <- glm(bolls ~ defoliation+I(defoliation^2), data=dat, family=poisson)
m2 <- glm(bolls ~ stage:defoliation+I(defoliation^2), data=dat, family=poisson)
m3 <- glm(bolls ~ stage:(defoliation+I(defoliation^2)), data=dat, family=poisson)
par(mfrow=c(2,2)); plot(m3); layout(1)
anova(m0, m1, m2, m3, test="Chisq")

# predicted values
preddat <- expand.grid(stage=levels(dat$stage),
                       defoliation=seq(0,100,length=20))
preddat$pred <- predict(m3, newdata=preddat, type="response")

# Zeviani figure 3
require(latticeExtra)
xyplot(bolls ~ jitter(defoliation)|stage, dat,
       as.table=TRUE,
       main="silva.cotton - observed and model predictions",
       xlab="Defoliation percent",
       ylab="Number of bolls") + 
xyplot(pred ~ defoliation|stage, data=preddat,
       as.table=TRUE,
       type='smooth', col="black", lwd=2)

}

\dontrun{
  # ----- mcglm -----
  dat <- transform(dat, deffac=factor(defoliation))
	
  library(car)
  library(candisc)
  library(doBy)
  library(multcomp)
  library(mcglm)
  library(Matrix)

  vars <- c("weight","height","bolls","nodes")
  splom(~dat[vars], data=dat,
        groups = stage,
        auto.key = list(title = "Growth stage",
                        cex.title = 1,
                        columns = 3),
        par.settings = list(superpose.symbol = list(pch = 4)),
        as.matrix = TRUE)
  
  splom(~dat[vars], data=dat,
        groups = defoliation,
        auto.key = list(title = "Artificial defoliation",
                        cex.title = 1,
                        columns = 3),
        as.matrix = TRUE)
  
  # multivariate linear model.
  m1 <- lm(cbind(weight, height, bolls, nodes) ~ stage * deffac,
           data = dat)
  anova(m1)

  summary.aov(m1)

  r0 <- residuals(m1)

  # Checking the models assumptions on the residuals.
  car::scatterplotMatrix(r0,
                         gap = 0, smooth = FALSE, reg.line = FALSE, ellipse = TRUE,
                         diagonal = "qqplot")

  }
