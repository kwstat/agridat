# cramer.cucumber1.r

lib(dplyr)

dat <- scan(text="
1 01 29 022 040 0240 01 00 00
1 02 21 017 034 0120 17 02 01
1 03 31 052 032 0440 29 15 03
1 04 30 049 077 0550 25 09 05
1 05 28 088 140 1315 58 13 27
1 06 28 162 105 0986 39 09 14
1 07 25 026 070 0741 36 05 10
1 08 31 074 125 0803 55 08 35
2 01 19 025 054 0510 27 05 04
2 02 27 035 038 0510 34 03 05
2 03 23 050 027 0290 01 00 00
2 04 32 035 055 0560 47 10 08
2 05 30 021 098 0982 53 02 06
2 06 32 041 105 0878 31 04 13
2 07 25 069 038 0639 26 04 09
2 08 33 048 127 0870 57 11 13
3 01 22 023 027 0330 12 04 00
3 02 26 044 047 0460 27 07 08
3 03 23 039 040 0460 32 03 13
3 04 30 058 071 0810 30 10 05
3 05 26 012 064 0622 31 03 09
3 06 31 024 111 1133 26 01 07
3 07 24 046 082 0879 33 04 04
3 08 28 048 161 1122 63 05 07
")
matrix(dat, nrow=24, byrow=TRUE) %>% as.data.frame -> dat
names(dat) <- c("cycle","rep","plants","flowers","branches","leaves","totalfruit","culledfruit","earlyfruit")
cramer.cucumber1 <- dat

# ----------------------------------------------------------------------------

dat <- cramer.cucumber1
dat <- transform(dat,
                 marketable = totalfruit-culledfruit,
                 branchesperplant = branches/plants,
                 nodesperbranch = leaves/(branches+plants),
                 femalenodes = flowers+totalfruit)
dat <- transform(dat,
                 perfenod = (femalenodes/leaves),
                 fruitset = totalfruit/flowers,
                 fruitperplant = totalfruit / plants,
                 marketableperplant = marketable/plants,
                 earlyperplant=earlyfruit/plants)

dat1 <- subset(dat, cycle==1)

indep <- c("branchesperplant", "nodesperbranch", "perfenod", "fruitset")
dep0 <- "fruitperplant"
dep <- c("marketable","earlyperplant")

sdat <- data.frame(scale(dat[1:8, c(indep,dep0,dep)]))
# slopes
lmcoef <- lm(as.formula(paste(dep0,"~",paste(indep,collapse="+"))),
             data=sdat)
estdep=coef(lmcoef)[-1]; ##no intercept
estdep
# branchesperplant   nodesperbranch         perfenod         fruitset 
#        0.7160269        0.3415537        0.2316693        0.2985557 

# slopes for dep0 ~ indep
X <- as.matrix(sdat[,indep])
Y <- as.matrix(sdat[,c(dep0)])
estdep <- solve(t(X)%*%X) %*% t(X) %*% Y

# slopes for dep ~ dep0
X <- as.matrix(sdat[,dep0])
Y <- as.matrix(sdat[,c(dep)])
estind2 <- solve(t(X)%*%X) %*% t(X) %*% Y

# correlation coefficients for indep variables, non-standardized
corrind=cor(sdat[,indep])
corrind
# Correlation coefficients for dependent variables
corrdep=cor(sdat[,c(dep0, dep)])
corrdep

result = corrind
result = result*matrix(estdep,ncol=4,nrow=4,byrow=TRUE)
round(result,2) # match SAS columns 1-4

resdep0 = rowSums(result)
round(resdep0,2)
# branchesperplant   nodesperbranch         perfenod         fruitset 
#             0.87             0.65            -0.08             0.42

resdep <- cbind(resdep0,resdep0)*matrix(estind2, nrow=4,ncol=2,byrow=TRUE)
colnames(resdep) <- dep
round(resdep,2) # slightly different from SAS last 2 columns

round(result,2) # match SAS columns 1-4
round(cbind(fruitperplant=resdep0, round(resdep,2)),2)

# ----------------------------------------------------------------------------

# For reference, here are results from rpathanalysis package, which match
# the results above

res1 = path(data=dat1, indep=indep, dep0=dep0, dep=dep, bci="yes")
print(res1, detail=1)

## Direct Effects, Indirect Effects, and Total Correlations ##
                 branchesperplant nodesperbranch perfenod fruitset
branchesperplant             0.72           0.18    -0.06     0.03
nodesperbranch               0.37           0.34    -0.10     0.04
perfenod                    -0.17          -0.15     0.23     0.01
fruitset                     0.07           0.05     0.01     0.30

                 fruitperplant marketable earlyperplant
branchesperplant          0.87       0.84          0.76
nodesperbranch            0.65       0.63          0.58
perfenod                 -0.08      -0.08         -0.07
fruitset                  0.42       0.41          0.37

Bootstrap 95 percent Confidence Intervals--using BC method 
Random Seed= 2058 
Number of Resamples= 500 
   Independent Variables          NAME Lower.Confidence.Limit   Observed.Statistic Upper.Confidence.Limit
1       branchesperplant fruitperplant                   0.68                 0.87                   0.97
2       branchesperplant    marketable                   0.66                 0.84                   0.95
3       branchesperplant earlyperplant                   0.57                 0.76                   0.92
4         nodesperbranch fruitperplant                   0.12                 0.65                   0.94
5         nodesperbranch    marketable                   0.12                 0.63                   0.92
6         nodesperbranch earlyperplant                   0.11                 0.58                   0.85
7               perfenod fruitperplant                  -0.76                -0.08                   0.52
8               perfenod    marketable                  -0.73                -0.08                   0.51
9               perfenod earlyperplant                  -0.72                -0.07                   0.46
10              fruitset fruitperplant                  -0.25                 0.42                   0.83
11              fruitset    marketable                  -0.25                 0.41                   0.80
12              fruitset earlyperplant                  -0.24                 0.37                   0.72

############################
  Correlation Coefficients  

`Correlation coefficients for independent variables`
                 branchesperplant nodesperbranch    perfenod   fruitset
branchesperplant       1.00000000      0.5180859 -0.24111738 0.09342666
nodesperbranch         0.51808587      1.0000000 -0.44301604 0.14199069
perfenod              -0.24111738     -0.4430160  1.00000000 0.04488241
fruitset               0.09342666      0.1419907  0.04488241 1.00000000

`Correlation coefficients for dependent variables`
              fruitperplant marketable earlyperplant
fruitperplant     1.0000000  0.9719600     0.8828393
marketable        0.9719600  1.0000000     0.9571163
earlyperplant     0.8828393  0.9571163     1.0000000
