# grover.diallel.R
#, Time-stamp:, <23, Sep, 2021, 14:39:55, c:/one/rpack/agridat/data-raw/grover.diallel.R>

yield <- c(
  104.86, 88.66, 109.76, 128.10, 128.36, 74.40, 88.70, 88.02, 110.16, 101.26, 91.52, 59.06, 75.28, 112.48, 77.94, 114.44, 96.88, 109.86, 124.26,
  92.18, 98.08, 80.82, 86.20, 103.14, 109.74, 109.94, 89.56, 80.96, 59.96, 98.46, 72.92, 58.56, 104.18, 109.44, 81.58, 96.44,
  84.32, 105.04, 78.22, 123.84, 119.84, 70.86, 69.10, 106.52, 116.26, 80.22, 113.96, 65.52, 124.74, 92.76, 71.34, 119.96, 100.86, 98.16, 132.48,
  82.16, 90.94, 106.54, 76.36, 109.66, 99.56, 117.52, 94.56, 71.98, 52.48, 73.10, 76.28, 86.72, 100.24, 97.74, 95.52, 98.82,
  76.92, 80.80, 74.52, 92.56, 103.24, 60.94, 76.80, 89.52, 99.76, 82.84, 87.26, 81.62, 94.56, 90.62, 77.52, 84.76, 86.88, 93.26, 114.38,
  81.66, 96.20, 83.28, 79.06, 90.98, 110.18, 95.56, 83.66, 91.34, 52.98, 89.18, 61.66, 65.26, 85.12, 121.10, 84.48, 99.14,
  76.48, 73.54, 99.52, 115.28, 129.72, 68.00, 88.16, 108.68, 120.12, 88.36, 106.98, 86.76, 114.34, 122.36, 69.48, 86.42, 92.52, 102.26, 105.34,
  101.24, 125.48, 95.92, 99.52, 119.40, 125.68, 88.54, 85.28, 89.28, 50.98, 75.86, 64.48, 74.64, 108.76, 106.38, 90.28, 107.16)

dat <- data.frame(yield=yield,
                  rep=rep(c("R1","R2","R3","R4"), each=36),
                  parent1=rep(c("P1","P2","P3","P4","P5","P6"), each=6),
                  parent2=c("P1","P2","P3","P4","P5","P6"))
dat <- transform(dat, cross=paste0(parent1,":",parent2))
                 sum(yield)

grover.diallel <- dat

sum(dat$yield)/4
libs(reshape2)
acast(dat, parent1 ~ parent2, value.var="yield", fun=mean)
# The mean for the 2x2 cross is slightly different than Grover p. 252.
# There appears to be an unknown error in the one of the 4 reps

anova(aov(yield ~ rep + cross, data=dat))
## Analysis of Variance Table

## Response: yield
##            Df Sum Sq Mean Sq F value    Pr(>F)    
## rep         3   2034  677.86  5.7478  0.001113 ** 
## cross      35  32773  936.38  7.9399 < 2.2e-16 ***
## Residuals 105  12383  117.93

library(lmDiallel)
m1 <- lm(yield ~ rep + GCA(parent1, parent2) +
           tSCA(parent1, parent2) +
           REC(parent1, parent2), data=dat)
anova(m1)

m2 <- lm.diallel(yield ~ parent1 + parent2, Block=rep,
                 data=dat, fct="GRIFFING1")
library(multcomp)
summary( glht(linfct=diallel.eff(m2), test=adjusted(type="none")) )
## Linear Hypotheses:
##                Estimate Std. Error t value Pr(>|t|)    
## Intercept == 0  93.0774     0.9050 102.851    <0.01 ***
## g_P1 == 0        1.4851     1.4309   1.038   1.0000    
## g_P2 == 0       -0.9911     1.4309  -0.693   1.0000    
## g_P3 == 0        2.2631     1.4309   1.582   0.9748    
## g_P4 == 0        5.4247     1.4309   3.791   0.0302 *  
## g_P5 == 0       -4.2490     1.4309  -2.969   0.1972    
## g_P6 == 0       -3.9328     1.4309  -2.748   0.3008    
## ts_P1:P1 == 0  -10.4026     4.5249  -2.299   0.6014    
## ts_P1:P2 == 0   -9.7214     3.2629  -2.979   0.1933    
## ts_P1:P3 == 0   -0.4581     3.2629  -0.140   1.0000    
## ts_P1:P4 == 0   17.0428     3.2629   5.223    <0.01 ***
## ts_P1:P5 == 0   25.4765     3.2629   7.808    <0.01 ***
## ts_P1:P6 == 0  -21.9372     3.2629  -6.723    <0.01 ***
## ts_P2:P1 == 0   -9.7214     3.2629  -2.979   0.1928    
## ts_P2:P2 == 0    7.0899     4.5249   1.567   0.9773    
