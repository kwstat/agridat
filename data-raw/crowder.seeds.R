# crowder.seeds.R
# Time-stamp: <02 May 2019 14:18:48 c:/x/rpack/agridat/data-done/crowder.seeds.R>

# Based on this site:
# https://haakonbakka.bitbucket.io/btopic102.html

library(INLA)
head(Seeds)
# germ    - r is the number of seed germinated (successes)
# n       - n is the number of seeds attempted (trials)
# gen     - x1 is the type of seed
# extract - x2 is the type of root extract
# plate   - plate is the numbering of the plates/experiments

library(agridat)
head(crowder.seeds)

library(INLA)
# gen,extract are fixed. plate is a random effect
# Priors for hyper parameters. See: inla.doc("pc.prec")
hyper1 = list(theta = list(prior="pc.prec", param=c(1,0.01)))
res1 = inla(germ ~ gen*extract + f(plate, model="iid", hyper=hyper1),
            data=crowder.seeds, 
            family="binomial", Ntrials=n, 
            control.family=list(control.link=list(model="logit")))
# Look at fixed effects
round(res1$summary.fixed,2)
                        mean   sd 0.025quant 0.5quant 0.975quant  mode kld
(Intercept)            -0.46 0.24      -0.94    -0.45      -0.01 -0.45   0
genO75                 -0.09 0.30      -0.67    -0.10       0.52 -0.11   0
extractcucumber         0.53 0.32      -0.12     0.53       1.17  0.53   0
genO75:extractcucumber  0.82 0.42       0.01     0.82       1.66  0.81   0

# Full summary
summary(res1)
# Posterior summaries for random effects
res1$summary.random$plate


m.beta1 = inla.tmarginal(fun = function(x) x, marginal = 
                           res1$marginals.fixed$x1)
# - this transformation is the identity (does nothing)
# - m.beta1 is the marginal for the coefficient in front of the x1 covariate
plot(m.beta1, type="l", xlab = expression(beta[1]), ylab = "Probability density")
