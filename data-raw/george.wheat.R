# george.wheat.R
# Time-stamp: <29 Oct 2019 15:20:48 c:/x/rpack/agridat/data-done/george.wheat.R>

# Source:
# George, Nicholas; Lundy, Mark (2019).
# Quantifying genotype x environment effects in long-term common wheat yield trials from an agroecologically diverse production region
# Dryad, Dataset, https://doi.org/10.5061/dryad.bf8rt6b
# Retrieved 29 Oct 2019.

# In the csv file, "#VALUE!" were changed to empty cells in 43 spots.

libs(asreml,dplyr,fs,janitor,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-done/")
dat0 <- read_csv("george.wheat.csv")
dat <- janitor::clean_names(dat0)
head(dat)
names(dat) <- c("gen","year","location","block","yield")
dat$location <- snakecase::to_any_case(dat$location, "title")
dat$location <- str_replace(dat$location, " ", "")
george.wheat <- dat
agex(george.wheat)

# ----------------------------------------------------------------------------

dat <- george.wheat
dat <- mutate(dat, env=paste0(year,".",location))
reshape2::acast(dat, gen ~ env, value.var="yield", fun=mean, na.rm=TRUE) %>%
  lattice::levelplot(., aspect="m", 
                     main="george.wheat", xlab="genotype", ylab="environment",
                     scales=list(x=list(cex=.3,rot=90),y=list(cex=.5)))
bwplot(yield ~ as.character(year)|location, dat, horiz=0)
