# 18sawyt_rawdata.R
# Time-stamp: <02 Jan 2019 11:39:05 c:/x/rpack/agridat/data-unused/18sawyt_rawdata.R>

# Source: Data downloaded from:
#   https://data.cimmyt.org/dataset.xhtml?persistentId=hdl:11529/10170
#   file: 18sawyt_rawdata

# Reference: Podenphant 2018.
# The multiplicative mixed model with the mumm R package as a general and easy random interaction model tool
# https://arxiv.org/abs/1811.00782

libs(asreml,dplyr,fs,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-unused/")
dat0 <- read_csv("18sawyt_rawdata.csv")
dat <- dat0
head(dat)
dat <- dat %>%
  rename(env=Loc_no, gen=Gen_no, trait=`Trait name`, value=Value)
dat <- dat %>% 
  filter(trait=="PLANT_HEIGHT") %>%
  filter(!is.na(value)) %>% 
  mutate(gen=factor(gen), env=factor(env), value=as.numeric(value))

n_distinct(dat$gen)
# [1] 50
n_distinct(dat$env)
# [1] 61
 
heat(value ~ env*gen, dat)


mod1 <- kw:::fw(value ~ gen*env, dat)
plot(mod1)

# ----------------------------------------------------------------------------

# now try mumm
libs(mumm)

# This fails. Is it because of missing combinations?
mod0 <- mumm(value ~ 1 + env + (1|gen) + mp(gen, env), dat) # In sqrt(diag(cov)) : NaNs produced
mod0 <- mumm(value ~ 1 + env + (1|gen) + mp(gen, env), dat, control=list(eval.max=5000, iter.max=5000))

# similar to the slopes from kw::fw()
ranef(mod0)$`mp gen:env`+1

# ----------------------------------------------------------------------------

# drop 2 environments with missing gen data

dat2 <- filter(dat, !(env %in% (c("20017","51003"))))
heat(value ~ env*gen, dat2) # balanced

# now it works
mod2 <- mumm(value ~ 1 + env + (1|gen) + mp(gen, env), dat2)
ranef(mod2) # intercept and slopes

# ----------------------------------------------------------------------------

# FW-type  model on Piepho's cocksfoot data.

libs(agridat,mumm)
data(piepho.cocksfoot)    
dat <- piepho.cocksfoot
dat$year <- factor(dat$year)

levelplot(date ~ year*gen, dat)
mod3 <- mumm(date ~ -1 + gen + (1|year) + mp(year, gen), dat) # mp(random, fixed)

# Compare to Piepho table 3, "full maximum likelihood"
mod3$sigmas^2 # variances for year:gen, residual match
#        year mp year:gen    Residual 
# 17.70287377  0.02944158  0.49024737

mod3$par_fix # fixed genotypes match

mod3$sdreport # estim/stderr
#               Estimate Std. Error
# nu          49.0393183 1.55038652
# nu          42.0889493 1.67597832
# nu          45.3411252 1.59818620

ranef(mod3) # random year:gen match
# $`mp year:gen`
#        1990        1991        1992        1993        1994        1995 
#  0.10595661 -0.05298523  0.08228274 -0.09629696 -0.11045540  0.29637268 


# Feedback
1. It would be nice to have coef(), fixef(), ranef() all work on mumm objects.
2. Would it make sense to allow both mp(random effect,fixed effect) AND mp(fixed,random).  Right now only the first is allowed.
3. 
