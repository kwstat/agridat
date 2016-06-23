# omer.sorghum.r
# Time-stamp: <21 Jun 2016 17:23:19 c:/x/rpack/agridat/data-done/omer.sorghum.r>

library(asreml)
library(dplyr)
library(kw)
library(Hmisc)
library(lattice)
library(rio)

setwd("c:/x/rpack/agridat/data-done/")
dat <- read.csv("omer.sorghum.csv")
h(dat)
dat <- transform(dat, env=paste0("E",env),
                 gen=paste0("G",pad(gen)),
                 rep=paste0("R",rep))

omer.sorghum <- dat

# ----------------------------------------------------------------------------

dat <- omer.sorghum

require(lattice)
bwplot(yield ~ env, data=dat)

require(HH)
interaction2wt(yield ~  gen + env, dat)

# REML estimates
require(lme4)
require(lucid)
# 1 loc, 2 years. Match Omer table 1.
m1 <- lmer(yield ~ 1 + env + (1|env:rep) + (1|gen) + (1|gen:env),
           data=subset(dat,env%in%c('E2','E4')))
vc(m1)
# 1 loc, 3 years. Match Omer table 1.
m2 <- lmer(yield ~ 1 + env + (1|env:rep) + (1|gen) + (1|gen:env),
           data=subset(dat, env %in% c('E2','E4','E6')))
vc(m2)

# all 6 locs. Match Omer table 3, frequentist approach
m3 <- lmer(yield ~ 1 + env + (1|env:rep) + (1|gen) + (1|gen:env),
           data=dat)
vc(m3)

# ----------------------------------------------------------------------------

# Bayesian approach
require(rjags)
require(R2WinBUGS)

mod <- function(){
  
  # Data model 
  for (i in 1:n.obs){
    y[i] ~ dnorm(mu[i], tau.e) 
    mu[i] <- m + b[blk[i],env[i]] + p[env[i]] + g[geno[i]] + a[geno[i],env[i]] 
  }
  
  # Overall mean
  m ~ dnorm(0.0, 1.0E-6)
  
  # Block effects
  for (j in 1:n.env){
    for(k in 1:(n.blk-1)){
      b[k,j] ~ dnorm(0.0, tau.b)
    } 
    b[n.blk,j] <-  sum(b[1:(n.blk-1),j]) 
  }
  
  # Genotype effects  
  for (i in 1:(n.gen-1)){
    g[i] ~ dnorm(0.0, tau.g)
  } 
  g[n.gen] <-  sum(g[1:(n.gen-1)])
  
  # Envirovments effects as fixed 
  for (j in 1: (n.env-1)){
    p[j] ~ dnorm(0.0, 1.0E-6)
  } 
  p[n.env]<- -sum(p[1:(n.env-1)])
  
  # GxE effects  a[n.gen=18,n.env=6]
  for (i in 1:(n.gen-1)){
    for (j in 1:(n.env-1)){
      a[i,j] ~ dnorm(0.0 , tau.a)
    }
  }                       
  for (j in 1:(n.env-1)){
    a[n.gen,j] <-  -sum(a[1:(n.gen-1),j])
  } 
  for (i in 1:(n.gen-1)){
    a[i,n.env] <-  -sum(a[i, 1:(n.env-1)])
  } 
  a[n.gen,n.env] <- -sum(a[n.gen, 1:(n.env-1)])
  
  # Priors  
  sig.e ~ dnorm(0, tau.e)  
  sig.g ~ dnorm(0, tau.g) %_% I(0,) 
  sig.b ~ dnorm(0, tau.b) %_% I(0,) 
  sig.ge ~ dnorm(0, tau.ge) %_% I(0,) 
  tau.e <- 1/(sig.e*sig.e) 
  tau.b <- 1/(sig.b*sig.b) 
  tau.g <- 1/(sig.g*sig.g)  
  tau.a <- 1/(sig.ge*sig.ge)
  
  # Parameters of interest....more                       
  sig2g <- sig.g^2
  sig2e <- sig.e^2
  sig2ge <- sig.ge^2
  
  # Prediction of parameters of interest-- means, heritability, SEs 
  for ( i in 1: n.gen) {PredG[i]<-  m + g[i]} 
  for ( j in 1: n.env) {PredE[j]<-  m + p[j]} 
  for ( i in 1: n.gen) { 
    for ( j in 1: n.env) { 
      PredGE[i,j]<-  m + g[i]+p[j]+a[i,j]  } 
  }
  
  # Broad-sense heritability on  mean-basis, genetic advance and CV 
  h2<- sig2g/(sig2g + sig2ge/n.env + sig2e/(n.blk*n.env)) 
  GA20 <- 100*1.4*sig2g/mn/sqrt(sig2g + sig2ge/n.env + sig2e/n.blk/n.env) 
  CVpc <- 100*sqrt(sig2e)/mn                  
} 
# end of BUGS codes


y <- dat$yield
blk <- as.numeric(substring(dat$rep,2))
env <- as.numeric(substring(dat$env,2))
geno <- as.numeric(substring(dat$gen,2))
mn <- mean(y)

n.gen <- 18
n.env <- 6
n.blk <- 4
n.obs <- nrow(dat)  # n.gen*n.env*n.blk
n.ge <- n.env*n.gen
print(cbind(mn, n.blk, n.env, n.gen, n.ge, n.obs))

# Use tau from the REML analysis of datasets
# Envt fixed (three years data 2006/7- 8/9) 
## tau.e <- c(0.00760)
## tau.g <- c(0.000687) 
## tau.b <- c(0.00184)
## tau.ge <- c(0.00142) 


dat1 <- list(y=y, mn=mn, blk=blk, env=env, geno=geno,
             n.blk=n.blk, n.env=n.env, n.gen=n.gen, n.obs=n.obs,
             tau.e=.00760, tau.g=.000687, tau.b=.00184, tau.ge=.00142)

inits <- list(list(m=mn, 
                   sig.e=.5, sig.b=1, sig.g=0.01, sig.ge=1.1),
              list(m=mn, 
                   sig.e=.5, sig.b=1, sig.g=0.01, sig.ge=1.1),
              list(m=mn, 
                   sig.e=.5, sig.b=1, sig.g=0.01, sig.ge=1.1))

modfile <- tempfile()
write.model(mod, modfile)
m1 <- jags.model(modfile, data=dat1, inits=inits, n.chains=3)
update(m1, n.iter=1000)
c1 <- coda.samples(m1, c("sig2g", "sig2e", "sig2ge"), n.iter=100000, thin=5)
vc(c1)
