# sinebo.R
# Time-stamp: <11 Jan 2023 15:27:35 c:/drop/rpack/agridat/data-unused/sinebo.R>

# Reason not used:
# Soil covariates are NOT given in the table!

# Source: Sinebo 2005
# Trade off between yield increase and yield stability in three
# decades of barley breeding in a tropical highland environment


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

