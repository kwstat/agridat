# coelho.maize.diallel

# y is the vector of phenotypic data, τ is the vector of block-locations-checks combinations
# (assumed to be fixed), which comprises the effects of environment, replication within the environ-
# ment, and checks added to the overall mean; ug is the vector of additive genetic effects (assumed
# as random); us is the vector of dominant genetic effects (assumed as random); uge is the vector of
# the interaction between additive genetic effects and environments (random), u se is the vector of
# the interaction between dominance genetic effects and environments (random), and e is the vec- tor
# of residuals (random).

Igor Ferreira Coelho, Marco Antônio Peixoto, Tiago de Souza Marçal, Arthur Bernardeli, Rodrigo Silva Alves, Rodrigo Oliveira de Lima, Edésio Fialho dos Reis, Leonardo Lopes Bhering (2021).
Accounting for spatial trends in multi-environment diallel analysis in maize breeding.
PLOS One. Published: October 21, 2021
https://doi.org/10.1371/journal.pone.0258473

Compared spatial/non-spatial models for diallel experiment.
There were 4 trials, 3 reps, RCB.  The spatial model was preferred in 2 of 4 locations.
Plots were 4m long with 4 rows spaced 0.45 m apart, for a plot area of 7.2 m^2.

According to Fig 1, in the 1x2 cross Parent 1 is the male and Parent 2 is the female.
In the 12x13 cross, Parent 12 is the male and Parent 13 is the female.
By this logic, in Supplement Table S1, the left side is the male and the top is the female.

## ---------------------------------------------------------------------------

libs(dplyr)

setwd("c:/drop/rpack/agridat/data-raw/")
dat <- rio::import("coelho.maize.diallel.txt")
dat <- janitor::clean_names(dat)
dat <- rename(dat,
              male=group1, female=group2,
              env=trials, row=rows, col=columns, rep=replications,
              gen=hybrids, check=hybrid_checks, yield=gy)
head(dat)              
dat <- mutate(dat,
              env=paste0("E", env),
              rep=paste0("R", rep),
              male=paste0("P",male),
              female=paste0("P",female),
              gen=paste0("G",gen),
              check=paste0("C",check))
head(dat)

# male 11 levels
# female 13 levels
# 78 new hybs, 6 commercial hybrid checks

coelho.diallel <- dat
## ---------------------------------------------------------------------------

dat <- coelho.diallel
dat <- transform(dat,
                 check=factor(check),
                 env=factor(env),
                 rep=factor(rep),
                 gen=factor(gen),
                 male=factor(male),
                 female=factor(female),
                 xf=factor(col),
                 yf=factor(row)
                 )

dat <- transform(dat, hyb=ifelse(dat$check=="C1", as.character(dat$gen), as.character(dat$check)))
dat$hyb = factor(dat$hyb)

head(dat)
library(agridat)

# Show yield and position of checks, true aspect
libs(desplot)
desplot(dat, yield ~ col*row|env, out1=rep, num=check,
        aspect=(14*4)/(18*1.8),
        main="coelho.diallel")

libs(sommer)           
m1 <- mmer(yield ~ rep,
           random= ~ vs(male)+vs(female),
           rcov= ~ vs(units),
           dat)
summary(m1)
  #### genetic variance covariance
  cov2cor(m1$sigma$`u:female`)
  cov2cor(m1$sigma$`u:male`)
  cov2cor(m1$sigma$`u:units`)

# see butron.maize

# Create a pedigree structure ---
ped <- dat[ , c("hyb","male","female") ]
ped <- unique(ped)
# Remove checks
ped <- subset(ped, ! (hyb %in% c("C2","C3","C4","C5","C6","C7")))
# Add checks and parents at the top with 0 male and 0 female
ped <- rbind( data.frame(hyb=c( "P1", "P2", "P3", "P4", "P5", "P6", "P7", "P8", "P9", "P10", "P11", "P12", "P13", "C1","C2","C3","C4","C5","C6"),
                         male=rep(0,19),female=rep(0,19) ),
             ped)
ped
libs(asreml)
ped.ainv <- ainverse(ped)

dat <- dat[order(dat$env, dat$xf, dat$yf),]
m2 <- asreml(yield ~ env/rep, 
             data=dat,
             random = ~ male + and(female) + hyb:fa(env),
             residual = ~ dsum( ~ ar1(xf):ar1(yf)|env),
             na.action=na.method(x="omit"))
m2 <- update(m2)
summary(m2)

# To fit a simple GxE model with relationships.
# Normally you would just write it as the shortcut aoi:ge, but when you
# include  vm() in a model, you can't use shortcuts, so you have to
# specify the structure like this:
#   idv(aoi):vm(gen, Z)
# Here idv() means something like "identity diagonal single-variance".
mod0 = asreml(yield ~ env,
              random = ~ idv(env):vm(hyb, ped),
              workspace=128e06, data=dat)

