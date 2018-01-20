# lord.rice.uniformity.r
# Time-stamp: c:/x/rpack/agridat2/lord.rice.uniformity.r

# Source:
# Lord, L. (1931).
# A Uniformity Trial with Irrigated Broadcast Rice.
# The Journal of Agricultural Science, 21(1), 178-188.

# fields are semi-contiguous

library(lattice)
library(rio)

setwd("c:/x/rpack/agridat/data-unused/")
dat <- import("lord.rice.uniformity.csv")
colnames(dat) <- c('field','C1','C2','C3','C4','C5')
dat$row <- rep(1:14,each=2)
str(dat)
# straw and grain are in alternate rows
gr <- dat[(1:112)*2 - 1,]
rownames(gr) <- 1:112

st <- dat[(1:112)*2,]
rownames(st) <- 1:112

gr <- melt(gr, id.var=c("field","row"))
st <- melt(st, id.var=c("field","row"))
names(gr)[4] <- "grain"
names(st)[4] <- "straw"
dat <- merge(gr,st)
dat <- rename(dat, col=variable)
dat$col <- substring(dat$col, 2)
dat$col <- as.integer(dat$col)


lord.rice.uniformity <- dat

# ----------------------------------------------------------------------------

dat <- lord.rice.uniformity

# match table on page 180
## require(dplyr)
## dat %>% group_by(field) %>% dplyr::summarize(grain=sum(grain), straw=sum(straw))
##   field grain straw
##   <chr> <dbl> <dbl>
## 1 10      590   732
## 2 11      502   600
## 3 12      315   488
## 4 13      291   538
## 5 14      489   670
## 6 26      441   560
## 7 27      451   629
## 8 28      530   718

# There are consistently high yields along all edges of the field
# require(lattice)
# bwplot(grain ~ factor(col)|field,dat)
# bwplot(grain ~ factor(col)|field,dat)

# Heatmaps
if(require(desplot)){
  desplot(grain ~ col*row|field, dat,
          flip=TRUE, aspect=140/50,
          main="lord.rice.uniformity")
}

# bivariate scatterplots  
# xyplot(grain ~ straw|field, dat)
