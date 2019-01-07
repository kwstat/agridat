# sokal.pea.R
# Time-stamp: <02 Jan 2019 09:45:21 c:/x/rpack/agridat/data-unused/sokal.pea.R>

# Source: Sokal R.R., Rohlf F.J (1994). Biometry: The Principles and
# Practices of Statistics in Biological Research. Third Edition.
# page 218

# Provided by Miroslav Zoric

# Pea example
# Problem: heterogeneous treatment variances

dat <- data.frame(
  sugar = c("1","1","1","1","1","1","1","1","1","1","2","2","2","2","2","2","2","2","2","2","3","3","3","3","3","3","3","3","3","3","4","4","4","4","4","4","4","4","4","4","5","5","5","5","5","5","5","5","5","5"),
  length = c(75,67,70,75,65,71,67,67,76,68,57,58,60,59,62,60,60,57,59,61,58,61,56,58,57,56,61,60,57,58,58,59,58,61,57,56,58,57,57,59,62,66,65,63,64,62,65,65,62,67))
dat = transform(dat, trt=factor(sugar))

bwplot(length ~ trt, dat)
library(asreml)
library(asremlPlus)

# Model with homogeneous treatment variances
m0 = asreml(fixed = length ~ trt, data=dat)
summary(m0)$varcomp[2:5]
wald(m0, denDF="default", ssType="conditional")

# Predictions for m0
lenght.m0.pvs = predict(m0, classify="trt", maxiter=1, trace=TRUE, sed=TRUE) 
lenght.m0.pvs$predictions


# Model with heterogeneous treatment variances
m1 = asreml(fixed = length ~ trt, rcov = ~ at(trt):units, data=dat)
summary(m1)$varcomp[2:5]
wald(m1, denDF="default", ssType="conditional")

# Predictions for m1
lenght.m1.pvs = predict(m1, classify="trt", maxiter=1, trace=TRUE, sed=TRUE) 
lenght.m1.pvs$predictions

# Model comparison
info.crit.asreml(m0) # AIC = 134.9
info.crit.asreml(m1) # AIC = 128.3
reml.lrt.asreml(m1, m0, positive.zero=TRUE) # .001 significant
	
# Thus, a heterogeneous one-way anova is better fitting than homogeneous model
