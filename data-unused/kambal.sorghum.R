# kambal.sorghum.R

# Reason not used: Data for Agadi 72 and Tozi 72 are the same values!

#Source:
#  A.E. Kambal & M.A. Mahmoud (1978).
#  Genotype x Environment Interactions in Sorghum Variety Tests in the Sudan Central Rainlands.
#  Experimental Agriculture, 14, 41-48.

setwd("c:/one/rpack/agridat/data-raw")
dat <- read.csv("kambal.sorghum.csv")

dat <- transform(dat, env=paste0(year, "-", loc))

libs(dplyr,gge,reshape2,lattice)
m1 <- gge(dat, yield ~ gen*env)
biplot(m1)

# Note the perfect correlation
dat %>% acast(gen ~ env, value.var="yield") %>% splom()
