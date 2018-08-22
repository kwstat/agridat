# rothamsted.oats.R

# ----------------------------------------------------------------------------

nrows <- 12; ncols <- 8
n <- nrows*ncols

dat <- read.table("c:/x/rpack/agridat/data-done/rothamsted.oats.txt")
names(dat) <- c("block","trt","grain","straw")

y0 <- t(matrix(dat$grain, ncols, nrows))
y1 <- t(matrix(dat$straw, ncols, nrows))
trt <- t(matrix(dat$trt, ncols, nrows))
blk <- t(matrix(dat$block, ncols, nrows))

dat$row <- rep(nrows:1, each=ncols)
dat$col <- rep(1:ncols, nrows)

rothamsted.oats <- dat
