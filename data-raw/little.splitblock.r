
lib(rio)
lib(reshape2)
setwd("c:/x/rpack/agridat/data-done")

dh <-import("little.splitblock.xlsx", sheet=2,col_names=FALSE)
dh <- melt(as.matrix(dh))

dn <- import("little.splitblock.xlsx",sheet=3,col_names=FALSE)
dn <- melt(as.matrix(dn))

dat <- import("little.splitblock.xlsx",col_names=FALSE)
dat <- as.matrix(dat)
colnames(dat) <- 1:20
dat <- melt(dat)
names(dat) <- c('row','col','yield')
dat$harvest <- dh$value
dat$nitro <- dn$value
dat$block <- paste0("B",ceiling(dat$col/5))

little.splitblock <- dat

# ----------------------------------------------------------------------------

dat <- little.splitblock

# Match marginal totals given by Little.
## sum(dat$yield)
## with(dat, tapply(yield,col,sum))
## with(dat, tapply(yield,row,sum))

# Layout shown by Little figure 10.2
if(require(desplot)){
  desplot(yield ~ col*row, data=dat,
          out1=block, out2=col, col=nitro, cex=1, num=harvest,
          main="little.splitblock")
}

# Convert continuous traits to factors
dat <- transform(dat, R=factor(row), C=factor(block),
                 H=factor(harvest), N=factor(nitro))

if(FALSE){
  library(lattice)
  xyplot(yield ~ nitro|H,dat)
  xyplot(yield ~ harvest|N,dat)
}

# Anova table matches Little, table 10.3
m1 <- aov(yield ~  R+C+N+H+N:H+Error(R:C:N+C:H+C:N:H), data=dat)
summary(m1)
