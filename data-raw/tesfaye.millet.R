# tesfaye.millet.R

# Data from
# Tesfaye K, Alemu T, Argaw T, de Villiers S, Assefa E (2023)
# Evaluation of finger millet (Eleusine coracana (L.) Gaertn.) in multi-environment trials using enhanced statistical models.
# PLoS ONE 18(2): e0277499.
# https://doi.org/10.1371/journal.pone.0277499

Experiments conducted at Bako and Assosa research centers in Ethiopia.

Data in PloS ONE  was published under Creative Commons Attribution License.

# 4 year, 2 sites = 7 environments
# 2-3 reps per trial
# 47 genotypes

libs(dplyr,janitor,rio)
dat <- rio::import("data-raw/tesfaye.millet.txt")
dat <- clean_names(dat)
dat <- rename(dat, rep=replicate,col=column,gen=genotype,yield=yldkg_h) 
dat <- mutate(dat, rep=paste0("R",rep))
ht(dat)
tesfaye.millet <- dat
kw::agex(tesfaye.millet)

dat <- mutate(dat,
              env=factor(paste0(site,year)),
              gen=factor(gen),
              rep=factor(rep),
              xfac=factor(col), yfac=factor(row))
head(dat)

libs(desplot,dplyr,lucid)
desplot(dat, yield ~ col*row|env, out1=rep, main="tesfaye.millet")
Hmisc::describe(dat)
libs(asreml)
dat <- arrange(dat, env, xfac,yfac)
m1 <- asreml(yield ~ 1 + env,
             data=dat,
             random = ~  at(env):xfac + at(env):yfac + gen:fa(env),
             residual = ~ dsum( ~ ar1(xfac):ar1(yfac)|env) )
m1 <- update(m1)
lucid::vc(m1)

libs(gge)
m2 <- gge(dat, yield ~ gen*env)
biplot(m2)
