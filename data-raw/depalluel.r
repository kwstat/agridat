# depalluel.r
# Time-stamp: <13 Feb 2017 14:27:15 c:/x/rpack/agridat/data-raw/depalluel.r>

library(asreml)
library(dplyr)
library(kw)
library(lattice)
library(readxl)
library(readr)
library(tibble)

dat <- tibble(food=rep(cc(potatoes,turnips,beet,corn,turnips,beet,corn,potatoes,beet,corn,potatoes,turnips,corn,potatoes,turnips,beet),2),
              animal=rep(c(1,6,11,16,5,10,15,4,9,14,3,8,13,2,7,12),2),
              breed=rep(cc(france,beauce,champagne,picardy,france,beauce,champagne,picardy,france,beauce,champagne,picardy,france,beauce,champagne,picardy),2),
              weight=c(69.75,71,77.25,71, 69,70.75,71,80, 72,73.5,69.25,79, 74,70.75,68.5,80, # initial
                       79.75,86,90.5,87, 87,86,93,101, 94,96,84,97.5, 106,95.5, 84.5, 101), # at kill
              date=c(rep(0,16), #initial
                     c(1,1,1,1,2,2,2,2, 3,3,3,3, 4,4,4,4)))

depalluel.sheep <- dat

# ----------------------------------------------------------------------------

dat <- depalluel.sheep
xyplot(weight ~ date, dat, col=factor(dat$food), type=c('p','smooth'))
xyplot(weight ~ date|food, dat, group=animal, type='l', auto.key=list(columns=4),
       main="depalluel.sheep")

