
setwd("c:/x/rpack/agridat/data-done")
dat <- import("crampton.pig.csv")
crampton.pig <- dat

# ----------------------------------------------------------------------------

dat <- crampton.pig
dat <- transform(dat, gain=weight2-weight1)
require(lattice)
# Trt 4 looks best
xyplot(gain ~ feed, dat, group=treatment, type=c('p','r'),
       auto.key=list(columns=5),
       xlab="Feed eaten", ylab="Weight gain", main="crampton.pig")


library(dplyr)
dat <- dat %>% group_by(treatment)
dat %>% summarize(mean(feed), mean(gain))

dat1 <- dat[,c('treatment','rep','weight1')]
dat1$time <- 'T0'
dat2 <- dat[,c('treatment','rep','weight2')]
dat2$time <- 'T1'
names(dat1)[3] <- names(dat2)[3] <- 'weight'
dat12 <- rbind(dat1,dat2)

xyplot(weight~factor(time)|treatment, data=dat12,
       group=rep, type='l', layout=c(5,1), aspect=1)

# Basic Anova without covariates
m1 <- lm(weight2 ~ treatment + rep, data=dat)
anova(m1)
# Add covariates
m2 <- lm(weight2 ~ treatment + rep + weight1 + feed, data=dat)
anova(m2)
# Remove treatment, test this nested model
m3 <- lm(weight2 ~ rep + weight1 + feed, data=dat)
anova(m2,m3) # p-value .07. F=2.34 matches Ostle
