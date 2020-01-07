# eden.r
# Time-stamp: <10 Feb 2017 15:14:17 c:/x/rpack/agridat/data-raw/eden.r>

library(asreml)
library(dplyr)
library(kw)
library(lattice)
library(readxl)
library(readr)
library(tibble)


setwd("c:/x/rpack/agridat/data-raw/")
dat0 <- read_excel("eden.nonnormal.xlsx")
lib(reshape2)
dat0 <- as.matrix(dat0)
rownames(dat0) <- 1:32
melt(dat0)
dat <- melt(dat0)
colnames(dat) <- c('pos','block','height')
eden.nonnormal <- dat

# ----------------------------------------------------------------------------

dat <- eden.nonnormal
mean(dat$height) # 55.23 matches Eden table 1

# Eden figure 2
if(require(dplyr) & require(lattice)){
  dat <- group_by(dat, block)
  dat <- mutate(dat, blkmn=mean(height))
  dat <- transform(dat, dev=height-blkmn)
  
  histogram( ~ dev, data=dat, breaks=seq(from=-40, to=30, by=2.5),
            xlab="Deviations from block means",
            main="eden.nonnormal - heights skewed left")
}

\dontrun{

  library(dplyr)
  library(lattice)
  library(latticeExtra)
  
  # Eden table 1
  # anova(aov(height ~ factor(block), data=dat))
  
  # Eden table 2,3. Note, this may be a different definition of skewness
  # than is commonly used today (e.g. e1071::skewness).
  skew <- function(x){
    n <- length(x)
    x <- x - mean(x)
    s1 = sum(x)
    s2 = sum(x^2)
    s3 = sum(x^3)
    k3=n/((n-1)*(n-2)) * s3 -3/n*s2*s1 + 2/n^2 * s1^3
    return(k3)
  }
  # Negative values indicate data are skewed left
  dat %>% group_by(block) %>%
    summarize(s1=sum(height),s2=sum(height^2), mean2=var(height), k3=skew(height))

  # Another way to view skewness with qq plot
  qqmath( ~ dev|factor(block), data=dat,
         panel = function(x, ...) {
           panel.qqmathline(x, ...)
           panel.qqmath(x, ...)
         })

  # Eden: "By a process of amalgamation the eight sets of 32 observations were
  # reduced to eight sets of four and the data treated as a potential
  # layout for a 32-plot trial".
  dat2 <- transform(dat, grp = (1:32+7)%/%8)
  dat2 <- aggregate(height ~ grp+block, dat2, sum)
  dat2$trt <- rep(letters[1:4], 8)
  dat2$block <- factor(dat2$block)

  # Treatments were assigned at random 1000 times
  set.seed(54323)
  fobs <- rep(NA, 1000)
  for(i in 1:1000){
    # randomize treatments within each block
    # trick from http://stackoverflow.com/questions/25085537
    dat2$trt <- with(dat2, ave(trt, block, FUN = sample))
    fobs[i] <- anova(aov(height ~ block + trt, dat2))["trt","F value"]
  }

  # F distribution with 3,21 deg freedom
  # Similar to Eden's figure 4, but on a different horizontal scale
  xval <- seq(from=0,to=max(fobs), length=50)
  yval <- df(xval, df1 = 3, df2 = 21)
  # Re-scale, 10 = max of historgram, 0.7 = max of density
  histogram( ~ fobs, breaks=xval,
            xlab="F value",
            main="Observed (histogram) & theoretical (line) F values") +
    xyplot((10/.7)* yval ~ xval, type="l", lwd=2)

}
