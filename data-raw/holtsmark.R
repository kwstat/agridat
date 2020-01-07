
lib(rio)
setwd("c:/x/rpack/agridat/data-raw")
dat <- import("holtsmark.xlsx", col_names=FALSE)
dat <- as.matrix(dat)
lib(reshape2)
colnames(dat) <- 1:40
d2 <- melt(dat)
names(d2) <- c('row','col','yield')

holtsmark.timothy.uniformity <- d2

# ----------------------------------------------------------------------------



# ----------------------------------------------------------------------------

