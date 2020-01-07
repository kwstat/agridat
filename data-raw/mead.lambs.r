# mead.lambs.r
# Time-stamp: <09 Sep 2016 14:00:10 c:/x/rpack/agridat/data-raw/mead.lambs.r>

library(asreml)
library(dplyr)
library(kw)
library(Hmisc)
library(lattice)
library(rio)

setwd("c:/x/rpack/agridat/data-raw/")
dat0 <- import("")

dat <- dat0

str(dat)
describe(dat)

# ----------------------------------------------------------------------------

dat <- data.frame(farm=c("F1","F1","F1","F1","F1","F1","F1","F1","F1","F1","F1","F1",
                         "F2","F2","F2","F2","F2","F2","F2","F2","F2","F2","F2","F2",
                         "F3","F3","F3","F3","F3","F3","F3","F3","F3","F3","F3","F3"),
                  breed=c("A","A","A","A","B","B","B","B","C","C","C","C",
                          "A","A","A","A","B","B","B","B","C","C","C","C",
                          "A","A","A","A","B","B","B","B","C","C","C","C"),
                  lambclass=c("L0","L1","L2","L3","L0","L1","L2","L3","L0","L1","L2","L3",
                          "L0","L1","L2","L3","L0","L1","L2","L3","L0","L1","L2","L3",
                          "L0","L1","L2","L3","L0","L1","L2","L3","L0","L1","L2","L3"),
                  y=c(10,21,96,23,
                      4,6,28,8,
                      6,7,58,7,
                      8,19,44,1,
                      5,17,56,1,
                      1,5,20,2,
                      22,95,103,4,
                      18,49,62,0,
                      4,12,16,2))

mead.lambs <- dat
# ----------------------------------------------------------------------------

dat <- mead.lambs
names(dat) <- c('F','B','L','y') # for compactness

# Match totals in Mead example 14.6
if(require(dplyr)){
  dat %>% group_by(F,B) %>% summarize(y=sum(y))
}

# Models
m1 <- glm(y ~ F + B + F:B, 
          data=dat, family=poisson(link=log))
m2 <- update(m1, y ~ F + B + F:B + L)
m3 <- update(m1, y ~ F + B + F:B + L + B:L)
m4 <- update(m1, y ~ F + B + F:B + L + F:L)
m5 <- update(m1, y ~ F + B + F:B + L + B:L + F:L)

AIC(m1, m2, m3, m4, m5) # Model 4 has best AIC

# Match deviance table from Mead
if(require(broom)){
  all <- do.call(rbind, lapply(list(m1, m2, m3, m4, m5), broom::glance))
  rownames(all) <- unlist(lapply(list(m1, m2, m3, m4, m5),
                                 function(x) as.character(formula(x)[3])))
  all[,c('deviance','df.residual')]
  ##                              deviance df.residual
  ## F + B + F:B                 683.67257          27
  ## F + B + L + F:B             131.23828          24
  ## F + B + L + F:B + B:L       116.27069          18
  ## F + B + L + F:B + F:L        18.84460          18
  ## F + B + L + F:B + B:L + F:L  14.57987          12
}

# Using MASS::loglm
if(require(MASS)){
  m4b <- loglm(y ~ F + B + F:B + L + F:L, data = dat)
  # Table of farm * class interactions. Match Mead p. 360
  round(coef(m4b)$F.L,2)
  fitted(m4b)
  resid(m4b)
  # require(vcd)
  # mosaic(m4b, shade=TRUE,
  # formula = ~ F + B + F:B + L + F:L,
  # residual_type="rstandard", keep_aspect=FALSE)
}
