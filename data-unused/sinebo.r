# sinebo.R
# Time-stamp: <02 Jan 2019 09:50:36 c:/x/rpack/agridat/data-unused/sinebo.R>

# Source: Sinebo 2005
# Trade off between yield increase and yield stability in three
# decades of barley breeding in a tropical highland environment

# Ahg, soil covariates are NOT given in the table! Decided not to use.

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

