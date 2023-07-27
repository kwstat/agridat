# Belamkar2018.R

pacman::p_load(desplot,dplyr,readxl)

File S2 has location heritabilities.

The experiment had 8 locations with 270 new, experimental lines (genotypes) and 3 check lines. There were 10 incomplete blocks at each location. There were 2 replicate blocks at Alliance and 1 block at all other locations. Each plot was 3 m long by 1.2 m wide.

The heatmap for Lincoln location in this data does not match the heatmap from Keith.

setwd("c:/Users/wrightkevi/Downloads/Belamkar 2018")

# Data download from:
# https://figshare.com/articles/dataset/Supplemental_Material_for_Belamkar_et_al_2018/6249410

dat <- read_excel("FileS4.xlsx",sheet=2)
head(dat)

# These locs no data.
dat <- dat %>%
  filter(Location != "Kansas") %>%
  filter(Location != "Westbred") %>% 
  filter(Location != "Mead")

dat <- rename(dat, loc=Location, rep=Replicate, iblock=Iblock,
              gen=Entry, gen_check=Entryc, gen_new=New,
              col=Pcol, row=Prow, yield=yldbua)

dat$rep <- paste0("R", dat$rep)
dat$iblock <- paste0("I", kw::pad( dat$iblock ))

dat <- as.data.frame(dat)
belamkar.augmented <- dat
kw::agex(belamkar.augmented)

## ---------------------------------------------------------------------------
dat <- belamkar.augmented

desplot(dat, yield ~ col*row|loc, out1=rep, out2=iblock)
dat$gen_check <- factor(dat$gen_check)
# Experiment design showing check placement
desplot(dat, gen_check ~ col*row|loc, out1=rep, out2=iblock,
        main="belamkar.augmented")

# Belamkar supplement S3 has R code for analysis
library(asreml)

# BLUEs for a single loc
d1 <- droplevels(subset(dat, loc=="Lincoln"))
# AR1xAR1 for single location
d1$colf <- factor(d1$col)
d1$rowf <- factor(d1$row)
d1$gen <- factor(d1$gen)
d1$gen_check <- factor(d1$gen_check)
d1 <- d1[order(d1$col),]
d1 <- as.data.frame(d1)
m1 <- asreml(fixed=yield ~ gen_check, data=d1,
             random = ~ gen_new:gen,
             residual = ~ar1(colf):ar1v(rowf) )
p1 <- predict(m1, classify="gen")
head(p1$pvals)
