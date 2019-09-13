# pellegrino.maize.meta.R
# Time-stamp: <14 Aug 2019 10:13:01 c:/x/rpack/agridat/data-raw/pellegrino.maize.meta.R>

# Have not taken the time to work through this data completely.

# Source
Elisa Pellegrino, Stefano Bedini, Marco Nuti, Laura Ercoli (2018).
Impact of genetically engineered maize on agronomic, environmental and toxicological traits: a meta-analysis of 21 years of field data.
Scientific Reports, 8, 3113.

libs(asreml,dplyr,fs,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-raw/")
dat1 <- read_excel("pellegrino.maize.meta.xlsx", "grain yield all")
# dat2 <- read_excel("pellegrino.maize.meta.xlsx", "Damaged ears all")
dat1 <- mutate(dat1,
               study=`Class and unique identifier`,
               trait="yield",
               reps.gmo=`Replicates GMO`,reps.non=`Replicates Non-GMO`,
               mean.gmo=`Grain Yield GMO (t ha-1)`,
               sem.gmo=`SEMYield GMO`,
               sd.gmo=`SDYield GMO`,
               cv.gmo=CV...35,
               lsd.gmo=LSD...36,
               t.gmo=t...37,
               mean.non=`Grain Yield Non-GMO (t ha-1)`,
               sem.non=`SEMYield Non-GMO`,
               sd.non=`SDYield non-GMO`,
               cv.non=CV...41,
               lsd.non=LSD...42,
               t.non=t...43,
               f.value=FYield,
               p.value=PYield)
dat1 <- mutate(dat1, `GMO event type` = ifelse(`GMO event type` %in% c('triple','Triple'), "triple", `GMO event type`))
dat1 <- mutate(dat1, sem.gmo=as.numeric(sem.gmo), sem.non=as.numeric(sem.non))
# https://www.statisticshowto.datasciencecentral.com/hedges-g/
# https://www.statisticshowto.datasciencecentral.com/pooled-standard-deviation/
dat1 <- mutate(dat1,
               # https://en.wikipedia.org/wiki/Effect_size
               sd.pool = sqrt(((reps.gmo-1)*sd.gmo^2 + (reps.non-1)*sd.non^2) /
                               (reps.gmo + reps.non - 2)),
               #sdpool = sqrt( sd.gmo^2/reps.gmo + sd.non^2 / reps.non),
               #sdpool = sqrt(sd.gmo^2 + sd.non^2),
               
               # https://stats.stackexchange.com/questions/66956/whats-the-difference-between-hedges-g-and-cohens-d
               #sdpool = sqrt(( sd.gmo^2 * reps.gmo + sd.non^2 * reps.non ) / (reps.gmo + reps.non -2 ) ),
               #sdpool = sqrt(( sd.gmo^2 * reps.gmo + sd.non^2 * reps.non ) / (reps.gmo + reps.non ) ),
               
               wt = 1 - 3/(4*(reps.gmo+reps.non)-9),
               hedges.g = (mean.gmo - mean.non) / sd.pool * wt)
libs(effsize)               

dat1s <- filter(dat1, `GMO event type`=="single")
with( dat1s, mean( (mean.gmo-mean.non ) ) )
with( dat1s, mean( hedges.g ))
#View( select(dat1s, mean.gmo, mean.non, sd.gmo, sd.non, reps.gmo, reps.non, sdpool, wt, hedges.g) )
dat1s[ , cc(yi, sei, mean.gmo, mean.non, sem.gmo, sem.non)] %>% ht
            mod1 <- rma.uni(yi, sei, method="ML", data=dat1s)
plot(mod1)
library(metafor)


