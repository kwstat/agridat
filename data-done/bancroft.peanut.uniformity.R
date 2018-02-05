# bancroft.peanut.uniformity.R
# Time-stamp: <30 Jan 2018 17:51:35 c:/x/rpack/agridat/data-done/bancroft.peanut.uniformity.R>

libs(dplyr,readxl,reshape2)

setwd("c:/x/rpack/agridat/data-done/")

d1 <- read_excel("bancroft.peanut.uniformity.xlsx",1, col_names=FALSE)
d2 <- read_excel("bancroft.peanut.uniformity.xlsx",2, col_names=FALSE)

d1 <- as.matrix(d1)
d2 <- as.matrix(d2)

rownames(d1) <- rownames(d2) <- 1:18
colnames(d1) <- colnames(d2) <- 1:6

d1 <- melt(d1)
d2 <- melt(d2)

names(d1) <- names(d2) <- c('row','col','yield')

d1$block <- "B1"
d2$block <- "B2"

bancroft.peanut.uniformity <- rbind(d1,d2)


# ----------------------------------------------------------------------------

