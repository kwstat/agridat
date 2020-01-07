# pederson.lettuce.repeated.R
# Time-stamp: <23 Jul 2018 16:39:37 c:/x/rpack/agridat/data-raw/pederson.lettuce.repeated.R>

libs(asreml,dplyr,fs,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-raw/")
dat0 <- read_excel("pederson.lettuce.repeated.xlsx")
dat <- dat0
head(dat)

pderston.lettuce.repeated <- dat
agex(pderston.lettuce.repeated)
# ----------------------------------------------------------------------------

dat <- mutate(dat,
              plant=factor(plant),
              #day=factor(day),
              trt=factor(trt)
              )


# SAS
proc mixed data=Project.Spacingdata; 
class trt plant day; 
model weight=trt day trt*day; 
repeated day / subject=plant type=un r rcorr;   

# nlme
require(nlme)
datg <- groupedData(weight ~ day|plant, data=dat)

# cs
cs1 <- gls(weight ~ trt * day, data=datg,
           correlation=corCompSymm(form = ~ 1 | plant),
           na.action=na.omit)
cs1 # rho = .717
logLik(cs1)*2 # SAS 2894

rm(un1)
un1 <- gls(weight ~ trt * day, data=datg,
           correlation=corSymm(value=rep(.6,55), form = ~ 1 | plant),
           control=lmeControl(opt="optim", msVerbose=TRUE,
                              maxIter=500, msMaxIter=500, #niterEM=500,                              
                              #tolerance=1e-7, msTol=1e-7, msMaxEval=500)
                              ))
logLik(un1)*2 # SAS 1898.6
un1

anova(un1)
noquote(lucid(rcor(un1), dig=2))


# asreml
dat$day=factor(dat$day)
lib(asreml)
dat <- transform(dat, plant=paste0(trt,plant))
dat <- dat[order(dat$plant),]

un2 <- asreml(weight ~ trt * as.numeric(day) , data=dat,
              rcov = ~ plant:id(day)
              #rcov = ~ plant:corg(day, init=rep(.8,55)),
              )
anova(un2)
noquote(lucid(rcor(un2)$month, dig=2))

3 trt
18 plants
11 day
594 total

un2 <- asreml(weight ~ trt * day , data=dat,
              rcov = ~ plant:id(day)
              #rcov = ~ plant:corg(day, init=rep(.8,55)),
              )
un2 <- update(un2,
              rcov = ~ plant:idh(day))
