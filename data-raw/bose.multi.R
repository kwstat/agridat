# bose.multi.R
# Time-stamp: <09 Jan 2018 15:47:00 c:/x/rpack/agridat/data-raw/bose.multi.R>

library(asreml)
library(dplyr)
library(kw)
library(lattice)
library(readxl)
library(readr)
library(reshape2)
library(tibble)

setwd("c:/x/rpack/agridat/data-raw/")
dat1 <- read_excel("bose.multi.xlsx","Sheet1", col_names=FALSE)
dat2 <- read_excel("bose.multi.xlsx","Sheet2", col_names=FALSE)
dat3 <- read_excel("bose.multi.xlsx","Sheet3", col_names=FALSE)

# dat1 %<>% as.matrix %>% setNames(., 1:15) %>% melt %>% rename(col=Var1,row=Var2,yield=value)
dat1 %<>% as.matrix %>% `colnames<-`(1:15) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(year="1930", crop="barley")

dat2 %<>% as.matrix %>% `colnames<-`(1:15) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(year="1931", crop="wheat")

dat3 %<>% as.matrix %>% `colnames<-`(1:15) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(year="1932", crop="lentil")

dat <- rbind(dat1,dat2,dat3)
dat <- select(dat, year, crop, row, col, yield)
bose.multi.uniformity <- dat

# ----------------------------------------------------------------------------

dat <- bose.multi.uniformity

# match sum at bottom of Bose tables 1, 4, 5
# dat %>% group_by(year) %>% summarize(sum=sum(yield))

if(require(desplot) & require(dplyr)){
  # Calculate percent of mean yield for each year
  dat <- group_by(dat, year) %>% mutate(pctyld = (yield-mean(yield))/mean(yield))
  # Bose smoothed the data by averaging 2x3 plots together before drawing
  # contour maps.  Heatmaps of raw data have similar structure to Bose Fig 1.
  desplot(pctyld ~ col*row|year, dat,
          tick=TRUE, flip=TRUE, aspect=(26)/(15),
          main="bose.multi.* - Percent of mean yield")
  # contourplot() results need to be mentally flipped upside down
  # contourplot(pctyld ~ col*row|year, dat,
  #   region=TRUE, as.table=TRUE, aspect=26/15)
}
