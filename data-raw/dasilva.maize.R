# dasilva.maize.R
# Time-stamp: <14 Jun 2018 16:31:26 c:/x/rpack/agridat/data-raw/dasilva.maize.R>

libs(asreml,dplyr,fs,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-raw/")
dat0 <- read_csv("dasilva.maize.csv")
dat <- dat0
head(dat)
names(dat) <- c('env','rep','gen','yield')
dat <- mutate(dat, rep=paste0("R",rep), env=paste0("E",env),
              gen=paste0("G",pad(gen)))
dasilva.maize <- dat

# ----------------------------------------------------------------------------

lib(agridat)
dat <- dasilva.maize


library(gge)
m1 <- gge(yield ~ gen*env, data=dat)
biplot(m1)

aggregate(yield ~ env, data=dat, FUN=mean)

dat %>% group_by(env,rep) %>%
  summarize(yield=mean(yield)) %>%
  ungroup %>%
    group_by(env) %>%
    summarize(yield=100*sd(yield)/mean(yield))
