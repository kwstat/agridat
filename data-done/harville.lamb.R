# harville.lamb.R
# Time-stamp: <10 Nov 2017 10:23:16 c:/x/rpack/agridat/data-done/harville.lamb.R>

library(asreml)
library(dplyr)
library(kw)
library(lattice)
library(readxl)
library(readr)
library(reshape2)
library(tibble)


setwd("c:/x/rpack/agridat/data-done/")
dat0 <- read_csv("harville.lamb.csv")
dat <- dat0
head(dat)

harville.lamb <- dat

Confidence Intervals for a Variance Ratio, or for Heritability, in an Unbalanced Mixed Linear
Model
Author(s): David A. Harville and Alan P. Fenech
Reviewed work(s):
Source: 
Biometrics, 
Vol. 41, No. 1 (Mar., 1985), pp. 137-152
Published by:  International Biometric Society
Stable URL:  http://www.jstor.org/stable/2530650 .

Weight at birth of 62 lambs. There were 5 distinct lines.
Some sires had multiple lambs. Each dam had one lamb.

The age of the dam is a category: 1 (1-2 years), 2 (2-3 years) or 3 (over 3 years).


Note: Jiang, gives the data in table 1.2, but there is a small error. Jiang has a weight 9.0 for sire 31, line 3, age 3. The correct value is 9.5.

Jiming Jiang, Linear and Generalized Linear Mixed Models and Their Applications. Table 1.2.

Andre I. Khuri, Linear Model Methodology. Table 11.5.  Page 368.
https://books.google.com/books?id=UfDvCAAAQBAJ&pg=PA164


dat <- harville.lamb
library(lme4) & library(lucid)
dat <- transform(dat, line=factor(line), sire=factor(sire), damage=factor(damage))

m1 <- lmer(weight ~  -1 + line + damage + (1|sire), data=dat, REML=TRUE)
summary(m1)
vc(m1) # Khuri reports variances 0.5171, 2.9616
##      grp        var1 var2   vcov  sdcor
##     sire (Intercept) <NA> 0.5171 0.7191
## Residual        <NA> <NA> 2.962  1.721 

