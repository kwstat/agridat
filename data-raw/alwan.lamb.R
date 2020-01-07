
# ----------------------------------------------------------------------------

libs(rio)
setwd("c:/x/rpack/agridat/data-done/")
dat <- rio::import("alwan.lamb.csv")

alwan.lamb <- dat

# ----------------------------------------------------------------------------

library(agridat)
dat <- alwan.lamb

# merge LF1 LF2 LF3 class counts, and combine M/F
dat$shape <- ifelse(dat$shape=="LF2", "LF3", dat$shape)
dat$shape <- ifelse(dat$shape=="LF1", "LF3", dat$shape)
dat <- aggregate(count ~ year+breed+sire0+sire+shape+yr+b1+b2+b3, dat, FUN=sum)

dat <- transform(dat,
                 year=factor(year), breed=factor(breed),
                 sire0=factor(sire0), sire=factor(sire))
# LF5 or LF3 first is a bit arbitary...affects the sign of the coefficients
dat <- transform(dat, shape=ordered(shape, levels=c("LF5","LF4","LF3")))

# View counts by year and breed
require(latticeExtra)
dat2 <- aggregate(count ~ year+breed+shape, dat, FUN=sum)
useOuterStrips(barchart(count ~ shape|year*breed, data=dat2, main="alwan.lamb"))

# Model used by Gilmour and SAS
dat <- subset(dat, count > 0) 
library(ordinal)
m1 <- clmm(shape ~ yr + b1 + b2 + b3 + (1|sire), data=dat, weights=count, link="probit", Hess=TRUE)
summary(m1) # Very similar to Gilmour results
ranef(m1) # sign is opposite of SAS

## SAS var of sires .04849
## Effect 	Shape 	Estimate 	Standard Error 	DF 	t Value 	Pr > |t|
## Intercept 	1 	0.3781 	0.04907 	29 	7.71 	<.0001
## Intercept 	2 	1.6435 	0.05930 	29 	27.72 	<.0001
## yr 	  	0.1422 	0.04834 	2478 	2.94 	0.0033
## b1 	  	0.3781 	0.07154 	2478 	5.28 	<.0001
## b2 	  	0.3157 	0.09709 	2478 	3.25 	0.0012
## b3 	  	-0.09887 	0.06508 	2478 	-1.52 	0.1289

## Gilmour results for probit analysis
## Int1   .370 +/- .052
## Int2  1.603 +/- .061
## Year  -.139 +/- .052
## B1    -.370 +/- .076
## B2    -.304 +/- .103
## B3     .098 +/- .070

# Plot random sire effects with intervals, similar to SAS example
plot.random <- function(model, random.effect, ylim=NULL, xlab="", main="") {

  est <- ranef(model)[[random.effect]]
  labs <- rownames(est)
  est <- est[[1]] # extract column from data.frame
  ci <- model$ranef + qnorm(0.975) * sqrt(model$condVar) %o% c(-1,1)
  # sort by estimated effect
  ix <- order(est)
  est <- est[ix]
  labs <- labs[ix]
  ci <- ci[ix,]
  
  if(is.null(ylim)) ylim <- range(ci)
  n <- length(est)
  plot(1:n, est, axes=FALSE, ylim=ylim, xlab=xlab, ylab="effect", main=main, type="n")
  text(1:n, est, labels=substring(labs,2) , cex=.75)
  axis(1)
  axis(2)
  segments(1:n, ci[,1], 1:n, ci[,2])
  abline(h=c(-.5, -.25, 0, .25, .5), col="gray")
  return(ix)  
}
ix <- plot.random(m1, "sire")

# foot-shape proportions for each sire, sorted by estimated sire effects
# positive sire effects tend to have lower proportion of lambs in LF4 and LF5
tab <- prop.table(xtabs(count ~ sire+shape, dat), margin=1)
tab <- tab[ix,]
tab <- tab[nrow(tab):1,] # reverse the order
barchart(tab,
         horizontal=FALSE, auto.key=TRUE,
         main="alwan.lamb", xlab="Sire", ylab="Proportion of lambs",
         scales=list(x=list(rot=70)),
         par.settings = simpleTheme(col=c("yellow","orange","red")) )


# ----------------------------------------------------------------------------

m2 <- clmm(shape ~ year + breed + (1|sire), data=dat, weights=count, link="probit", Hess=TRUE)
summary(m2)
round(ranef(m2)$sire,2)
# alternative syntax using 'random' argument
#m3 <- clmm2(shape ~ year + breed, data=dat, weights=count, random=sire, link="probit", Hess=TRUE)
#summary(m3)



