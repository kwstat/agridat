# sinebo.r
# Time-stamp: <19 Aug 2015 16:51:00 c:/x/rpack/agridat2/unused/sinebo.r>

# Source: Sinebo 2005
# Trade off between yield increase and yield stability in three
# decades of barley breeding in a tropical highland environment

# Ahg, soil covariates are NOT given in the table!

library(rio)

setwd("c:/x/rpack/agridat2/unused/")
covs <- import("sinebo.xls",sheet=1)
yld <- import("sinebo.xls",sheet=2)

rownames(covs) <- covs$env
covs$env <- NULL
covs <- as.matrix(covs)
rownames(yld) <- yld$env
yld$env <- NULL
yld <- yld[1:12,]
yld <- as.matrix(yld)

