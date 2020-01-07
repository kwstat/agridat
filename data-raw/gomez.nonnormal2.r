# gomez.nonnormal2.r
# Time-stamp: <19 Nov 2016 22:58:54 c:/x/rpack/agridat/data-done/gomez.nonnormal2.r>

library(asreml)
library(dplyr)
library(kw)
library(Hmisc)
library(lattice)
library(rio)

setwd("c:/x/rpack/agridat/data-done/")
dat0 <- import("")

dat <- data.frame(gen=rep(c("IR5","IR20-1","C463G","C168-134","BPI76","MRC4071","PARC22","TN1","Rexoro","Luma1","IR127-80-1","IR1108-3-5","IR1561-228-3-3","IR2061-464-2"),3),
                  rep=rep(c('R1','R2','R3'),each=14),
                  white=c(139,843,758,895,416,468,237,095,2609,2639,2199,358,019,0,
                          092,438,379,1281,1739,132,532,070,2536,2229,1288,262,0,364,
                          263,694,191,322,806,209,486,098,1569,198,515,291,061,444)/100)
# check total
sum(dat$white)

gomez.nonnormal2 <- dat

# ----------------------------------------------------------------------------

dat <- gomez.nonnormal2
dat <- transform(dat, white2=sqrt(white+.5))

# Gomez anova table 7.21
m1 <- lm(white2 ~ rep + gen, data=dat)
anova(m1)
## Response: white2
##           Df Sum Sq Mean Sq F value    Pr(>F)    
## rep        2  2.401  1.2004  1.9137    0.1678    
## gen       13 48.011  3.6931  5.8877 6.366e-05 ***
## Residuals 26 16.309  0.6273                      
