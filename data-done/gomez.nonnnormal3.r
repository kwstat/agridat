# gomez.nonnnormal3.r
# Time-stamp: <21 Nov 2016 09:24:31 c:/x/rpack/agridat/data-done/gomez.nonnnormal3.r>

library(asreml)
library(dplyr)
library(kw)
library(Hmisc)
library(lattice)
library(rio)

setwd("c:/x/rpack/agridat/data-done/")
dat0 <- import("")

dat <- dat0

str(dat)
describe(dat)

gomez.nonnormal3 <- data.frame(gen=rep(c('ASD7','Mudgo','Ptb21','D2041','SuYai20','Balamawee','DNJ24','Ptb27','RathuHeenati','Taichung','DS1','BJ1'),3),
                               rep=rep(c('R1','R2','R3'),each=12),
                               survival=c(4400,2133,0,2533,2400,0,3200,0,1733,9333,1333,4666,
                                          2533,4933,0,2666,2666,0,2933,0,3333,10000,3600,4666,
                                          4800,8000,0,4933,5466,2000,2800,0,1066,10000,3333,1600)/100)

# ----------------------------------------------------------------------------
