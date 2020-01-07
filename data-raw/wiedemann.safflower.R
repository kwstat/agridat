
lib(rio)
setwd("c:/x/rpack/agridat/data-done")
dat <- import("wiedemann.safflower.xlsx")
dat <- as.matrix(dat[,-1])
colnames(dat) <- 1:33
rownames(dat) <- 1:54
lib(reshape2)
dat <- melt(dat)
names(dat) <- c('row','col','yield')

wiedemann.safflower <- dat
