
setwd("c:/drop/rpack/agridat/")
dat <- readr::read_csv("c:/drop/rpack/agridat/data-raw/immer.wheat.csv")

head(dat)

libs(dplyr)
sum(dat$yield)
dat %>%
  filter(year==1935) %>%
  filter(loc=="U.Farm") %>% 
  group_by(rep) %>% summarize(sum(yield)) %>% print(n=Inf)
dat %>% group_by(loc,year,rep) %>% summarize(sum(yield)) %>% print(n=Inf)

Yield in bu/ac for spring wheat varieties.

The source document has "U.Farm" (University Farm) which is called "StPaul" here.
The value for 1935, StPaul, Hope, Rep 2 is 24.5 (not 21.7 as in the source) based on the totals.

Data provenance: K.Wright prepared the data from page 234 of the text.

Source:
Erwin LeClerg, Warren Leonard, Andrew Clark (1962). "Field Plot Technique"
https://archive.org/details/fieldplottechniq0000lecl

library(latticeExtra)
useOuterStrips(dotplot(gen~yield|factor(year)*loc, data=dat))

# barley


setwd("c:/drop/rpack/agridat/")
dat <- readr::read_csv("data-raw/immer.barley.csv")

head(dat)

libs(dplyr)
sum(dat$yield)
dat %>%
  filter(year==1935) %>%
  filter(loc=="U.Farm") %>% 
  group_by(rep) %>% summarize(sum(yield)) %>% print(n=Inf)
dat %>% group_by(loc,year,rep) %>% summarize(sum(yield)) %>% print(n=Inf)

Yield in bu/ac for barley varieties.

Data provenance: K.Wright prepared the electronic data from page 340 of the source.

Source:
  Hayes, Herbert & Forrest Immer (1942).
  Methods of Plant Breeding
  https://archive.org/details/in.ernet.dli.2015.200783/page/n359/mode/2up

library(latticeExtra)
useOuterStrips(dotplot(gen~yield|factor(year)*loc, data=dat))
