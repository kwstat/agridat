# summerby.oat.uniformity.R

# Reason not used:
# Only 2 rows.
# The heatmap shows that the field is hardly 'uniform' as claimed by the
# authors. Flood damage.

# Source: Summerby, 1925. A Study of Sizes of Plats, Numbers of Replications,
# and the Frequency and Methods of using Check Plats, in Relation to
# Accuracy in Field Experiments.
# \emph{Agronomy Journal}, 3, 140--150.
# \url{https://www.crops.org/publications/aj/pdfs/17/3/AJ0170030140}.



libs(desplot,readr,reshape2)

setwd("c:/drop/rpack/agridat/data-unused/")
dat <- read_csv("summerby.oat.uniformity.csv", col_names=FALSE)

dat <- as.matrix(dat)
colnames(dat) <- 0:9
rownames(dat) <- 0:51
dat <- melt(dat)
colnames(dat) <- c("row","col","yield")
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

desplot(dat, yield ~ col*row, aspect=31/300, main="summerby.oat") # true shape
