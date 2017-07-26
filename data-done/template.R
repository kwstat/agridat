
# ----------------------------------------------------------------------------

# multiple sheets combined into one

lib(readxl)

setwd("c:/x/rpack/agridat/data-done/")

d1 <- read_excel("kristensen.barley.uniformity.xlsx",1, col_names=FALSE)
d2 <- read_excel("kristensen.barley.uniformity.xlsx",2, col_names=FALSE)
d3 <- read_excel("kristensen.barley.uniformity.xlsx",3, col_names=FALSE)
d4 <- read_excel("kristensen.barley.uniformity.xlsx",4, col_names=FALSE)
d1 <- as.matrix(d1)
d2 <- as.matrix(d2)
d3 <- as.matrix(d3)
d4 <- as.matrix(d4)
rownames(d1) <- rownames(d1) <- rownames(d1) <- rownames(d1) <- 5:15
colnames(d1) <- colnames(d2) <- colnames(d3) <- colnames(d4) <- 1:10

d1 <- melt(d1)
d2 <- melt(d2)
d3 <- melt(d3)
d4 <- melt(d4)

names(d1) <- names(d2) <- names(d3) <- names(d4) <- c('row','col','yield')

d1$season <- 1; d1$crop <- "woolypyrol"
d2$season <- 2; d2$crop <- "woolypyrol"
d3$season <- 3; d3$crop <- "maize"
d4$season <- 4; d4$crop <- "yams"

kristensen.barley.uniformity <- rbind(d1,d2,d3,d4)

# ----------------------------------------------------------------------------
