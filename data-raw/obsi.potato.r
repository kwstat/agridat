# obsi.potato.r
# Time-stamp: <21 Apr 2017 15:47:35 c:/x/rpack/agridat/data-raw/obsi.potato.r>

library(asreml)
library(dplyr)
library(kw)
library(lattice)
library(readxl)
library(readr)
library(reshape2)
library(tibble)

Girma 2000/2002
Hatheway Williams
Kinfemikael
Kock Rigney
Mohamed 87
narayara 83 85

Page 17. Methods.
Page 112. Conclusion

setwd("c:/x/rpack/agridat/data-raw/")
dat1 <- read_excel("obsi.potato.xlsx",sheet=1,col_names=FALSE)
dat1[10,7] <-  2.25 # was 22.5, likely a typo
dat1 <- as.matrix(dat1)
# match Obsi table 4.9
sum(dat1[1:3,1:4]) # 27.10
sum(dat1[4:6,1:4]) # 32.40
sum(dat1[7:9,1:4]) # 30.14
sum(dat1[10:12,1:4]) # not included 
sum(dat1[13:15,1:4]) # 32.20 row 4
sum(dat1[16:18,1:4]) # 34.21 row 5

sum(dat1[1:3,5:8]) # 30.23 row 1, col 2

# note the vertical banding
levelplot(dat1)

dat2 <- read_excel("obsi.potato.xlsx",sheet=2,col_names=FALSE)
dat2 <- as.matrix(dat2)

# note the outliers
levelplot(dat2) # difficult to compare to Obsi fig 4.4 p. 94
