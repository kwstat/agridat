# stewart.potato.r
# Time-stamp: <23 Jun 2016 18:09:58 c:/x/rpack/agridat/data-done/stewart.potato.r>

F. C. Stewart (1919).
Missing Hills in Potato Fields: Their Effect upon the Yield.
New York Agricultural Experiment Station Bulletin: Number 459: 
http://hdl.handle.net/1813/4948

Also
https://babel.hathitrust.org/cgi/pt?id=uiug.30112019760575;view=1up;seq=7


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
