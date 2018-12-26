# edwards.oats.R
# Time-stamp: c:/x/stat/Stability/edwards.r

library(asreml)
library(kw)
library(Hmisc)
library(lattice)
library(tidyverse)

ls()
setwd("c:/x/rpack/agridat/data-done")
dat <- rio::import("edwards.oats.csv")
str(dat)
dat <- mutate(dat, block=paste0("B",block))

# ----------------------------------------------------------------------------

dat$env <- paste0(dat$loc, dat$year)
dat$eid <- lookup(dat$env,
                  c("Ame1997", "Ame1998", "Ame1999", "Ame2000", "Ame2001", "Ame2002",
                    "Ame2003", "Cra1997", "Cra1998", "Cra1999", "Cra2000", "Cra2001",
                    "Cra2002", "Cra2003", "Lew1997", "Lew1998", "Lew1999", "Lew2000",
                    "Lew2001", "Lew2002", "Lew2003", "Nas1997", "Nas1998", "Nas1999",
                    "Nas2000", "Nas2001", "Nas2002", "Nas2003", "Sut1997", "Sut1999",
                    "Sut2000", "Sut2001", "Sut2002", "Sut2003"),
                  c(1,6,10,15,20,25,30, 3,7,12,17,22,27,32,
                    4,8,13,18,23,28,33, 5,9,14,19,24,29,34,
                    2,11,16,21,26,31))

dat <- select(dat, eid, year, loc, block, gen, yield, testwt)
edwards.oats <- dat

# ----------------------------------------------------------------------------

dat <- edwards.oats
dat$eid <- as.factor(dat$eid)

if(require(reshape2)){
  mat <- reshape2::acast(dat, eid ~ gen, fun.aggregate=mean,
                         value.var="yield", na.rm=TRUE)
  lattice::levelplot(mat, xlab="environment", ylab="genotype",
                     main="edwards.oats", aspect="m")
}

m1 <- lm(yield ~ gen+ eid, dat)

gg <- coef(m1)[2:80]
names(gg) <- str_replace(names(gg), "gen", "")
gg <- c(0,gg)
names(gg)[1] <- "ACStewart"

ee <- coef(m1)[81:113]
names(ee) <- str_replace(names(ee), "eid", "")
ee <- c(0,ee)
names(ee)[1] <- "1"

dat2 <- dat
dat2$gencoef <- lookup(dat2$gen, names(gg), gg)
dat2$envcoef <- lookup(dat2$eid, names(ee), ee)
dat2 <- mutate(dat2, y = yield - gencoef - envcoef)

dat2 %>% group_by(gen, eid) %>% summarize(vv = var(y)) %>% dotplot(vv ~ eid, dat)

# ----------------------------------------------------------------------------

# environment
# yr
# Location (3-letter abbreviations of cities in Iowa)
# Replicate block (this was an RCB design within each location)
# Plot
# Entry (arbitrary number assigned to treaetments, i.e., cultivars)
# Line (cultivar)
# Yield (grain yield in bushels per acre)
# Test-weight (grain density in lbs/bushel)

yield = dat$yield
n.obs = nrow(dat) # num of observations
# combination of loc/block
id.blk = with(dat, as.numeric(as.factor(paste(env,rep))))
n.blk = length(unique(id.blk)) # total number of blocks across locs = 102

id.gen = as.numeric(dat$gen)
n.gen = nlevels(dat$gen) # number of genotypes

n.env = nlevels(dat$env) # number of env

# gxe is a vector of length nrow(dat)
dat$gxe <- with(dat, factor(paste(gen,loc)))
id.gxe = as.numeric(dat$gxe)

# id.gxe_gen is NOT a vector of length=nrow(data), but rather
# a vector of length n.gxe, and id.gxe_gen is the _genotype_ of
# the (ij)th gen*env.
unigxe <- unique(dat[, c("gen","loc","gxe")])
n.gxe = nrow(unigxe) # num of gxe terms
id.gxe_gen = as.numeric(unigxe$gen)
id.gxe_env = as.numeric(unigxe$loc)

datj <- list(n.obs=n.obs, n.blk=n.blk, n.gen=n.gen, n.env=n.env, n.gxe=n.gxe,
             id.blk=id.blk, id.gen=id.gen, id.gxe=id.gxe,
             id.gxe_gen=id.gxe_gen, id.gxe_env=id.gxe_env)

require("rjags")
load.module("glm")

m1 <- jags.model(file="c:/x/stat/stability/Edwards/edwards.bug",
                 data=datj, n.chains=2, n.adapt=1000)
                 #  .RNG.seed=57677, .RNG.name="base::Wichmann-Hill"))
c1 <- coda.samples(m1, n.iter=50000, thin=20,
                   variable.names=(c('tau.gam', 'tau.ag', 'sig2.ag')))
summary(c1)

c2 <- coda.samples(m1, variable.names=(c('ag')), n.iter=50000, thin=5)
summary(c2)

remove(c1)


# ----------------------------------------------------------------------------

jagsgamma <- function(x, r, mu) {(mu^r*x^(r-1)*exp(-mu*r))/gamma(r)}
p.both.gamma <- function(x, r.jags, mu.jags, ylab = "Density", ...) {
    ## plot the density using the formula of jags
    matplot(x, cbind(jagsgamma(x, r.jags, mu.jags),
                     dgamma(x, shape=r.jags, rate=mu.jags)),
            type="l", lty=1, ylab=ylab, ...)
    mtext(substitute(list(r[jags] == R, mu[jags] == M),
                     as.list(formatC(c(R=r.jags, M=mu.jags)))))
    legend("topright", c("jagsgamma", "dgamma"), lty=1, col=1:2, bty = "n")
}

x <- seq(0,40, by=0.1)
# parameters of the gamma
p.both.gamma(x, r.jags = 0.001, mu.jags = 0.001)
p.both.gamma(x, r.jags = 1, mu.jags = 1)
