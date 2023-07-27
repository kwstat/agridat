# draper.safflower.uniformity.R
# Time-stamp: <12 Jul 2023 16:44:00 c:/drop/rpack/agridat/data-raw/draper.safflower.uniformity.R>

library(asreml)
library(dplyr)
library(kw)
library(Hmisc)
library(lattice)
library(rio)

setwd("c:/x/rpack/agridat/data-raw/")
dat5 <- import("draper.safflower.xlsx",sheet=1, col_names=FALSE)
dat4 <- import("draper.safflower.xlsx",sheet=2, col_names=FALSE)

colnames(dat5) <- 1:15
colnames(dat4) <- 1:17

library(reshape2)
dat5 <- melt(as.matrix(dat5))
dat4 <- melt(as.matrix(dat4))
names(dat4) <- names(dat5) <- c('row','col','yield')

draper.safflower.uniformity <- rbind(
  cbind(expt="E5",dat5),
  cbind(expt="E4",dat4))

# ----------------------------------------------------------------------------

# I tried to match the means from Draper. Close, but not exact.
# His data cleaning may be different from mine.
# Also, Draper overlaid an RCB design and calculated CV, which
# I also cannot match.

cv <- function(x) round(100 * sd(x)/mean(x), 2)
# Check reported yield.

draper.safflower.uniformity %>%
  filter(expt=="E4") %>% pull(yield) %>% mean() # 215.1294 grams/plot
# 215.1294 g     *  1 lb      * 1 plot         * 43560 ft^2
# 1        plot  * 453.592 g  * 3.33 * 4 ft^2  * 1 acre

draper.safflower.uniformity %>%
  filter(expt=="E4") %>% 
  pull(yield) %>%
  mean() / 453.592 / (3.33*4) * 43560 # 1551 lb/acre



# 4-foot
# Draper says yield was 1487 pounds/acre

# remove border plots
dat4c <- draper.safflower.uniformity %>%
  filter(expt=="E4") %>%
  filter(col > 1, col < 17) %>% filter(row > 1, row < 20) %>% 
  pull(yield)
mean(dat4c) / 453.592 / (3.33*4) * 43560 # 1487 lb/ac
cv(dat4c)




# 5-foot yield 2517 per acre
dat5c <- draper.safflower.uniformity %>%
  filter(expt=="E5") %>% filter(col > 1) %>% filter(col<15) %>% filter(row > 1) %>% filter(row<20) %>% 
  pull(yield)
mean(dat5c)  / 453.592 / (3.33*5) * 43560 # 2528 lb/ac
cv(dat5c)

%>% mean() # 485.2467 grams/plot
draper.safflower.uniformity %>% filter(expt=="E5") %>% pull(yield) %>% cv() # 485.2467 grams/plot
draper.safflower.uniformity %>% filter(expt=="E5") %>% pull(yield) %>% mean()# 2798 lb/acre

