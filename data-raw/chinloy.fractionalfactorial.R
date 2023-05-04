# chinloy.sugarcane.R
          
libs(readxl)
setwd("c:/drop/rpack/agridat/data-raw")
dat <- read_excel("chinloy.fractionalfactorial.xlsx")
dat$n=substring(dat$trt,1,1)
dat$p=substring(dat$trt,2,2)
dat$k=substring(dat$trt,3,3)
dat$b=substring(dat$trt,4,4)
dat$m=substring(dat$trt,5,5)
str(dat)

write.table(dat,
            file = "c:/drop/rpack/agridat/data/chinloy.fractionalfactorial.txt", 
            sep = "\t", row.names = FALSE)

chinloy.fractionalfactorial <- dat

# ----------------------------------------------------------------------------

dat <- chinloy.fractionalfactorial

# Treatments are coded with levels 0,1,2. Make sure they are factors
dat <- transform(dat,
                 n=factor(n), p=factor(p), k=factor(k), b=factor(b), m=factor(m))

if(require(desplot)){
  desplot(yield ~ col*row, dat, out1=block, text=trt, shorten="no", cex=0.6,
          aspect=178/86,
          main="chinloy.fractionalfactorial")
}

# Main effect and some two-way interactions. These match Chinloy table 6.
# Not sure how to code terms like p^2k=b^2m
m1 <- aov(yield ~ block + n + p + k + b + m + n:p + n:k + n:b + n:m, dat)
anova(m1)
