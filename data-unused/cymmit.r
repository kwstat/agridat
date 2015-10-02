# cymmit.r
# Time-stamp: c:/x/rpack/agridat2/cymmit.r

library(asreml)
library(Hmisc)
library(lattice)
library(rio)

# Source: Cymmit 1982 Progeny Testing Trials final report
# libcatalog.cimmyt.org/download/cim/13204.pdf

# Note, the Excel spreadsheet is assembled from OCR of the 
# original PDF and contains many errors.  Only the yield data has 
# been manually cleaned and checked.

setwd("c:/x/rpack/agridat/data-unused/")
dat <- import("cymmit.xlsx")

dat <- subset(dat, !is.na(yield))

library(agridat)
m1 <- gge(yield ~ entry*loc, dat)
biplot(m1)
