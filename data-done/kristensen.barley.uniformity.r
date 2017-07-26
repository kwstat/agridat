



lib(readxl)

setwd("c:/x/rpack/agridat/data-done/")

d1 <- read_excel("kristensen.barley.uniformity.xlsx",1, col_names=FALSE)
d1 <- as.matrix(d1)
rownames(d1) <- 1:11
colnames(d1) <- 1:22

d1 <- melt(d1)
names(d1) <- c('row','col','yield')

d1 <- subset(d1, !is.na(d1$yield))

kristensen.barley.uniformity <- d1

# ----------------------------------------------------------------------------

