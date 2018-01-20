# cymmit.r
# Time-stamp: <18 Jan 2018 16:29:21 c:/x/rpack/agridat/data-unused/cymmit.r>

# Source: Cymmit 1982 Progeny Testing Trials final report
# libcatalog.cimmyt.org/download/cim/13204.pdf

# Note, the Excel spreadsheet is assembled from OCR of the 
# original PDF and contains many errors.  Only the yield data has 
# been manually cleaned and checked.

library(asreml)
library(Hmisc)
library(lattice)
library(rio)

setwd("c:/x/rpack/agridat/data-unused/")
dat <- import("cymmit.xlsx")

dat <- subset(dat, !is.na(yield))

library(agridat)
m1 <- gge(yield ~ entry*loc, dat)
biplot(m1)
