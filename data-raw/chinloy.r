
          
lib(readxl)
setwd("c:/x/rpack/agridat/data-raw")
dat <- read_excel("chinloy.sugarcane.xlsx")
dat$N=substring(dat$trt,1,1)
dat$P=substring(dat$trt,2,2)
dat$K=substring(dat$trt,3,3)
dat$B=substring(dat$trt,4,4)
dat$F=substring(dat$trt,5,5)

chinloy.fractionalfactorial <- dat

# ----------------------------------------------------------------------------

dat <- chinloy.fractionalfactorial

# Treatments are coded with levels 0,1,2. Make sure they are factors
dat <- transform(dat,
                 N=factor(N), P=factor(P), K=factor(K), B=factor(B), F=factor(F))

if(require(desplot)){
  desplot(yield ~ col*row, dat, out1=block, text=trt, shorten="no", cex=0.6,
          aspect=178/86,
          main="chinloy.fractionalfactorial")
}

# Main effect and some two-way interactions. These match Chinloy table 6.
# Not sure how to code terms like P^2K=B^2F
m1 <- aov(yield ~ block + N + P + K + B + F + N:P + N:K + N:B + N:F, dat)
anova(m1)
