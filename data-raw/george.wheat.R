# george.wheat.R
# Time-stamp: <06 Jul 2020 15:48:27 c:/x/rpack/agridat/data-raw/george.wheat.R>

# Source:
# George, Nicholas; Lundy, Mark (2019).
# Quantifying genotype x environment effects in long-term common wheat yield trials from an agroecologically diverse production region
# Dryad, Dataset, https://doi.org/10.5061/dryad.bf8rt6b
# Retrieved 29 Oct 2019.

# In the csv file, "#VALUE!" were changed to empty cells in 43 spots.

libs(asreml,dplyr,fs,janitor,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-raw/")
dat0 <- read_csv("george.wheat.csv")
dat <- janitor::clean_names(dat0)
head(dat)
names(dat) <- c("gen","year","loc","block","yield")
dat$loc <- snakecase::to_any_case(dat$loc, "title")
dat$loc <- stringr::str_replace(dat$loc, " ", "")
dat$block <- paste0("B",dat$block) # modified 2020.07.06
george.wheat <- dat
head(george.wheat)
agex(george.wheat)
#write.table(george.wheat, file="c:/x/rpack/agridat/data/george.wheat.txt", sep="\t", row.names=FALSE)

# ----------------------------------------------------------------------------

dat <- george.wheat
dat <- mutate(dat, env=paste0(year,".",loc))
reshape2::acast(dat, gen ~ env, value.var="yield", fun=mean, na.rm=TRUE) %>%
  lattice::levelplot(., aspect="m", 
                     main="george.wheat", xlab="genotype", ylab="environment",
                     scales=list(x=list(cex=.3,rot=90),y=list(cex=.5)))
bwplot(yield ~ as.character(year)|loc, dat, horiz=0)
