# lin.unbalanced.r
# Time-stamp: c:/x/rpack/agridat/data-raw/lin.unbalanced.r

library(asreml)
library(kw)
library(Hmisc)
library(lattice)
library(readxl)
lib(reshape2)

setwd("c:/x/rpack/agridat/data-raw/")

dat <- read_excel("lin.unbalanced.xlsx", col_names=FALSE)
dat <- as.data.frame(dat)
colnames(dat) <- paste0('L',pad(0:18))
rownames(dat) <- dat[,1]
dat <- as.matrix(dat[,2:19])
image(dat)
dat2 <- melt(dat)
names(dat2) <- c('gen','loc','yield')
dat2$region <- ifelse(dat2$loc %in% c('L10','L11','L12','L13','L14','L15','L16','L17','L18'),
                      'Atl-Que','Ont')
dat2 <- subset(dat2, !is.na(yield))
dat <- dat2

lin.unbalanced <- dat2

# ----------------------------------------------------------------------------

dat <- lin.unbalanced

# location maximum, lin & binns table 1
aggregate(yield ~ loc, data=dat, FUN=max)

# location 'index', lin & binns, table 1
dat2 <- subset(dat, is.element(dat$gen, c('Bruce','Laurier','Leger','S1','S2','S3','S4','S5','S6','S7','T1','T2')))
aggregate(yield ~ loc, data=dat2, FUN=mean)


if(require(reshape2)){
  # calculate the superiority measure of Lin & Binns 1988

  dat3 <- acast(dat, gen ~ loc, value.var="yield")
  #locmean <- apply(dat3, 2, mean)
  locmax <- apply(dat3, 2, max, na.rm=TRUE)
  P <- apply(dat3, 1, function(x) {
    sum((x-locmax)^2, na.rm=TRUE)/(2*length(na.omit(x)))
  })/1000
  P <- sort(P)
  round(P) # match Lin & Binns 1988 table 2, column Pi
 }
