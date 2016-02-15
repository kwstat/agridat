# cowling.r
# Time-stamp: <12 Feb 2016 16:23:42 c:/x/rpack/agridat/data-raw/cowling.r>

# Data from:
# Wallace A. Cowling, Katia T. Stefanova, Cameron P. Beeck, Matthew N. Nelson,
# Bonnie L. W. Hargreaves, Olaf Sass, Arthur R. Gilmour, and Kadambot H. M. Siddique
# Using the Animal Model to Accelerate Response to
# Selection in a Self-Pollinating Crop
# http://doi.org/10.1534/g3.115.018838

library(asreml)
library(dplyr)
library(kw)
library(Hmisc)
library(lattice)
library(rio)

setwd("c:/x/rpack/agridat/data-raw/")

dped <- import("cowling_pedigree.xlsx")
names(dped) <- c('gen','fempar','malepar','filial','order')
ainv <- asreml.Ainverse(dped[,c('gen','fempar','malepar')])$ginv

d1 <- import("cowling_cycle1.xlsx")
d2 <- import("cowling_cycle2.xlsx")
names(d1) <- names(d2) <- c('site','entry','range','row','rep','abs')

lib(desplot)
desplot(abs~row*range,d1, out1=rep)
xyplot(abs~row, d1, type=c('p','r'), xlim=c(0,40)) # slope 4
xyplot(abs~range, d1, type=c('p','r'), xlim=c(0,40)) # slope 45

desplot(abs~row*range,d2, out1=rep)
xyplot(abs~row, d2, type=c('p','r'), xlim=c(0,75))
xyplot(abs~range, d2, type=c('p','r'), xlim=c(0,75))

with(d1, table(entry))  %>% sort
desplot(entry~row*range,d1, num=entry, show.key=FALSE)

# ----------------------------------------------------------------------------

# Table S4.  ASReml-R code for base model, second model, final model and accuracy.

dat <- rbind(d1,d2)
dat <- transform(dat, x=row, y=range)
dat <- transform(dat, site=factor(site), entry=factor(entry),
                 range=factor(range), row=factor(row), rep=factor(rep))

#BASE MODEL
# Takes about 15 minutes with pedigree
m1 <- asreml(abs~site + at(site):lin(row)+ at(site):lin(range), data=dat,
             random=~ diag(site):id(entry) + diag(site):rep +
               at(site,c('POPA10SHPK6')):row +at(site,c('POPA13SHPK6')):range,
             rcov=~ at(site):ar1(range):ar1(row),
             na.method.X = "Include",
             control=asreml.control(workspace=8e7),ginverse=list(entry=ainv))
lib(lucid)
vc(m1)

m1 <- asreml(abs~site + at(site):lin(row)+ at(site):lin(range),
             random=~ diag(site):id(entry) + diag(site):rep +
               at(site,c('POPA10SHPK6')):row +at(site,c('POPA13SHPK6')):range,
             rcov=~ at(site):ar1(range):ar1(row), na.method.X = "Include", data=dat,
                     control=asreml.control(workspace=8e7),ginverse=list(entry=ped.ainv))

#SECOND MODEL
ped2BS.asr <- asreml(abs~site + at(site):lin(row)+ at(site):lin(range),
                        random=~ diag(site):ped(entry) + diag(site):id(entry) + diag(site):rep +
                        at(site,c('POPA10SHPK6')):row +at(site,c('POPA13SHPK6')):range,
                        rcov=~ at(site):ar1(range):ar1(row), na.method.X = "Include", data=dat,
                        control=asreml.control(workspace=12e7,ginverse=list(entry=ped.ainv)))
 
#FINAL MODEL
ped4BS.asr <- asreml(abs~site + at(site):lin(row)+ at(site):lin(range),
                     random=~ corgh(site):ped(entry) + corgh(site):id(entry) + diag(site):rep +
                     at(site,c('POPA10SHPK6')):row+at(site,c('POPA13SHPK6')):range,
                     rcov=~ at(site):ar1(range):ar1(row), na.method.X = "Include", data=dat,
                     G.param=ped3BS.asr$G.param ,R.param=ped3BS.asr$R.param,
                     control=asreml.control(workspace=16e7,ginverse=list(entry=ped.ainv)))

#ACCURACY
ped4BS.ped <- predict(ped4BS.asr, classify="site:entry", maxiter=1,
                      only="site:ped(entry)",
                      levels=list("entry"=obs.lines),workspace=200e7,pworkspace=200e7)

num.cycle <- length(unique(dat$site))
num.obs <- length(ped4BS.ped$predictions$pvals$predicted.value)/num.cycle

ped.df <- read.csv('Pedigree.csv',header=T)
ped.Ainverse <- asreml.Ainverse(ped.df, fgen=list('fgen',0.01))
ped.Ai <- asreml.sparse2mat(ped.Ainverse$ginv)
ped.A <- solve(ped.Ai)
accuracy.df <- data.frame(SE=ped4BS.ped$predictions$pvals$standard.error, sigma2A=c(rep(ped4BS.asr$gammas[[2]],num.obs), rep(ped4BS.asr$gammas[[3]],num.obs)), inb=rep(diag(ped.A),num.cycle))
accuracy.df$accuracy <- sqrt(1-((accuracy.df$SE^2)/(accuracy.df$inb*accuracy.df$sigma2A)))
