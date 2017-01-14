# summerby.oat.r
# Time-stamp: c:/x/rpack/agridat2/summerby.oat.r

# Summerby, 1925. A Study of Sizes of Plats, Numbers of Replications,
# and the Frequency and Methods of using Check Plats, in Relation to
# Accuracy in Field Experiments.
# \emph{Agronomy Journal}, 3, 140--150.
# \url{https://www.crops.org/publications/aj/pdfs/17/3/AJ0170030140}.

# Note: The heatmap shows that the field is hardly 'uniform'.
# The paper is difficult to understand in places.
# Decided not to use this data.


library(agridat)
library(rio)


setwd("c:/x/rpack/agridat/data-unused/")
dat <- import("summerby_oat.csv", header=TRUE)

dat <- as.matrix(dat)
colnames(dat) <- 0:9
rownames(dat) <- 0:51
dat <- melt(dat)
colnames(dat) <- cc(row,col,yield)
dat <- transform(dat, plat=10*row+col)
dat <- subset(dat, !is.na(yield))
dat <- dat[order(dat$plat),]

# now the 'field' coordinates
dat$row <- dat$col <- NULL

dat$row <- ifelse(dat$plat <65 | dat$plat >364, 2, 1)
dat$col <- NA
dat$col <- ifelse(dat$plat <65, dat$plat+236, dat$col)
dat$col <- ifelse(dat$plat>64 & dat$plat<365, 365-dat$plat, dat$col)
dat$col <- ifelse(dat$plat>364, dat$plat-364, dat$col)

lib(agridat)
desplot(yield ~ col*row, dat, aspect=31/300, main="summerby.oat") # true shape
