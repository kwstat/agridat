# obsi.potato.r
# Time-stamp: <13 Aug 2019 17:03:28 c:/x/rpack/agridat/data-raw/obsi.potato.R>

# Source:
# Dechassa Obsi. 2008.
# Application of Spatial Modeling to the Study of Soil Fertility Pattern.
# MS Thesis, Addis Ababa University. Page 122-125.

library(asreml)
library(dplyr)
library(kw)
library(lattice)
library(readxl)
library(readr)
library(reshape2)
library(tibble)

Page 17. Methods.
Page 112. Conclusion

setwd("c:/x/rpack/agridat/data-raw/")

dat1 <- read_excel("obsi.potato.xlsx",sheet=1,col_names=FALSE)
dat1[10,7] <-  2.25 # was 22.5, likely a typo
dat1 <- as.matrix(dat1)
colnames(dat1) <- 1:26
# match Obsi table 4.9
sum(dat1[1:3,1:4]) # 27.10
sum(dat1[4:6,1:4]) # 32.40
sum(dat1[7:9,1:4]) # 30.14
sum(dat1[10:12,1:4]) # not included 
sum(dat1[13:15,1:4]) # 32.20 row 4
sum(dat1[16:18,1:4]) # 34.21 row 5

sum(dat1[1:3,5:8]) # 30.23 row 1, col 2

dat1 <- melt(dat1)
names(dat1) <- c("row","col","yield")

library(desplot)
desplot(yield ~ col*row, dat1, flip=TRUE)
# note the horizontal banding
levelplot(t(dat1))

dat2 <- read_excel("obsi.potato.xlsx",sheet=2,col_names=FALSE)
dat2 <- as.matrix(dat2)
colnames(dat2) <- 1:19
dat2 <- melt(dat2)
colnames(dat2) <- c("row","col","yield")
desplot(yield ~ col*row, dat2, flip=TRUE, tick=TRUE)

# note the outliers

dat <- rbind(cbind(loc="L1", dat1),
             cbind(loc="L2", dat2))
obsi.potato.uniformity <- dat

# ----------------------------------------------------------------------------


dat <- obsi.potato.uniformity

dat %>% group_by(loc) %>% summarize(yield=mean(yield))
  loc   yield
  <fct> <dbl>
1 L1     2.54 # Obsi says 2.55
2 L2     5.31 # Obsi says 5.36

desplot(yield ~ col*row, dat, subset=loc=="L1", flip=TRUE, tick=TRUE)
desplot(yield ~ col*row, dat, subset=loc=="L2", flip=TRUE, tick=TRUE)
