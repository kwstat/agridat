# fisher.barley.r
# Time-stamp: <25 Feb 2017 22:57:23 c:/x/rpack/agridat/data-raw/fisher.barley.r>

library(asreml)
library(dplyr)
library(kw)
library(lattice)
library(readxl)
library(readr)
library(reshape2)
library(tibble)


setwd("c:/x/rpack/agridat/data-raw/")
dat0 <- read_excel("fisher.barley.xlsx")

fisher.barley <- dat0
# ----------------------------------------------------------------------------

dat <- fisher.barley

# Yates 1938 figure 1. Regression on env mean
dat2 <- dat %>% group_by(gen,env) %>% summarize(yield=sum(yield))
dat2 <- dat2 %>% group_by(env) %>% mutate(envmn=mean(yield))
xyplot(yield ~ envmn, dat2, group=gen, type=c('p','r'),
       main="fisher.barley - stability regression",
       xlab="Environment mean", ylab="Variety mean",
       auto.key=list(columns=3))

# calculate stability according to Shukla (1972), eqn 11
# matches Shukla, Table 4, M.S. column
dat2 <- dat
dat2 <- dat2 %>% group_by(gen,env) %>% summarize(yield=sum(yield))
dat2 <- dat2 %>% group_by(env) %>% mutate(envmn=mean(yield))
dat2 <- dat2 %>% group_by(gen) %>% mutate(genmn=mean(yield))
dat2 <- dat2 %>% group_by() %>% mutate(grandmn=mean(yield))
# correction factor overall
dat2 <- dat2 %>% mutate(cf = sum((yield - genmn - envmn + grandmn)^2))
t=5; s=6 # t genotypes, s environments
dat2 <- dat2 %>% group_by(gen) %>% mutate(ss=sum((yield-genmn-envmn+grandmn)^2))
# divide by 6 to scale down to plot-level
dat2 <- dat2 %>% mutate( sig2i = 1/((s-1)*(t-1)*(t-2)) * (t*(t-1)*ss-cf)/6)
dat2[!duplicated(dat2$gen),c('gen','sig2i')]        gen     sig2i
##       <chr>     <dbl>
## 1 Manchuria  25.87912
## 2  Peatland  75.68001
## 3  Svansota  19.59984
## 4     Trebi 225.52866
## 5    Velvet  22.73051

# mixed model approach gives similar results
library(asreml)
dat2 <- dat2[order(dat2$gen),]
m.sv <- asreml(yield ~ gen, data=dat2,
               random = ~ env,
               rcov = ~ at(gen):units)
summary(m.sv)$varcomp
summary(m.sv)$varcomp[,1:2]/6
##                            gamma component
## gen_Manchuria!variance  33.99949  33.99949
## gen_Peatland!variance   70.65257  70.65257
## gen_Svansota!variance   25.42145  25.42145
## gen_Trebi!variance     231.85878 231.85878
## gen_Velvet!variance     14.08488  14.08488

