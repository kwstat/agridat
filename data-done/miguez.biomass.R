# miguez.biomass.R

library(nlraa)
dat <- sm
dat <- janitor::clean_names(dat)
dat$block <- paste0("B",dat$block)
dat$input <- ifelse(dat$input==1, "Lo","Hi")
dat$input <- factor(dat$input, levels=c("Lo","Hi"))

##

dat <- miguez.biomass
dat <- subset(dat, doy > 141)
library(lattice)
xyplot(yield ~ doy | crop*input,  data = dat,
       groups = crop,
       type=c('p','smooth'),
       auto.key=TRUE)


# ----------------------------------------------------------------------------
# Archontoulis et al fit some nonlinear models.
# Here is a simple example which does NOT account for crop/input
# A better model is desired.

dat2 <- transform(dat, eu = paste(block, input, crop))
dat2 <- groupedData(yield ~ doy | eu, data = dat2)
fit.lis <- nlsList(yield ~ SSfpl(doy, A, B, xmid, scal), data = dat2)
print(plot(intervals(fit.lis)))
#fit.me <- nlme(fit.lis, control = list(minScale =1e-50, pnlsTol=0.01))
#print(plot(augPred(fit.me, level = 0:1)))

library(nlme)
# use all data to get initial values
inits <- getInitial(yield ~ SSfpl(doy, A, B, xmid, scal), data = dat2)
inits
xvals <- 150:325
y1 <- with(as.list(inits), SSfpl(xvals, A, B, xmid, scal))
plot(yield ~ doy, dat2)
lines(xvals,y1)

# must have groupedData object to use augPred
dat2 <- groupedData(yield ~ doy|eu, data=dat2)
plot(dat2)

# without 'random', all effects are included in 'random'
m1 <- nlme(yield ~ SSfpl(doy, A, B, xmid,scale),
           data= dat2,
           fixed= A + B + xmid + scale ~ 1,
           # random = B ~ 1|eu, # to make only B random
           random = A + B + xmid + scale ~ 1|eu,
           start=inits)
fixef(m1)
summary(m1)
plot(augPred(m1, level=0:1),
     main="miguez.biomass - observed/predicted data") # only works with groupedData object
  
