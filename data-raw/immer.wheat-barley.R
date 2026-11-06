library(dplyr)
library(latticeExtra)
setwd("c:/drop/rpack/agridat/")

# barley
datb <- readr::read_csv("data-raw/immer.barley.csv")
# wheat
datw <- readr::read_csv("c:/drop/rpack/agridat/data-raw/immer.wheat.csv")
# in datw$rep, replace R1, R2, R3 with R01, R02, R03
datw <- mutate(datw, rep=ifelse(rep=="R1", "R01", ifelse(rep=="R2", "R02", ifelse(rep=="R3", "R03", rep))))
datb <- cbind(crop="barley", datb)
datw <- cbind(crop="wheat", datw)
dat <- rbind(datb, datw)

head(datb)

sum(datb$yield)
datb %>%
  filter(year==1935) %>%
  filter(loc=="StPaul") %>% 
  group_by(rep) %>% summarize(sum(yield)) %>% print(n=Inf)
datb %>% group_by(loc,year,rep) %>% summarize(sum(yield)) %>% as.data.frame()

Yield in bu/ac for barley varieties with 4 locs, 4 varieties, 5 reps, 2 years (1932, 1935).
Immer (1950) said the 1932 data were used because 1933 and 1934 were drought years with low yield.

The StPaul location is called "Univ. Farm" (University Farm) in the source document.

Data provenance: K.Wright prepared the electronic data from page 340 of Hays (1942).

Source:
  Hayes, Herbert & Forrest Immer (1942).
  Methods of Plant Breeding
  https://archive.org/details/in.ernet.dli.2015.200783/page/n359/mode/2up

Reference:
Immer, Forrest (1950).
Applied Statistis: A Series of Lectures in the Graduate School of the University of Minnesota.
Burgess Publishing Company, Minneapolis, Minnesota. p. 16

library(latticeExtra)
  useOuterStrips(dotplot(gen~yield|factor(year)*loc, data=datb))

# Full anova. Match Immer p 22
d1 <- datb
d1 <- transform(d1, year=factor(year), loc=factor(loc), gen=factor(gen), rep=factor(rep))
m1 <- aov(yield ~ rep + loc + year + gen + gen:loc + gen:year + gen:loc:year +
  loc:year + rep:loc + rep:year + rep:loc:year, data=d1)

immer.barley <- datb
kw::agex(immer.barley)

# -----

head(datw)

library(dplyr)
sum(datw$yield)
datw %>%
  filter(year==1935) %>%
  filter(loc=="U.Farm") %>% 
  group_by(rep) %>% summarize(sum(yield)) %>% print(n=Inf)
datw %>% group_by(loc,year,rep) %>% summarize(sum(yield)) %>% print(n=Inf)

useOuterStrips(dotplot(gen~yield|factor(year)*loc, data=datw))

Yield in bu/ac for spring wheat varieties with
3 loc, 3 year (1931, 1932, 1935), 5 gen, 3 rep.

The source document has "U.Farm" (University Farm) which is called "StPaul" here.
The value for 1935, StPaul, Hope, Rep 2 is 24.5 (not 21.7 as in the source) based on the totals.
The wheat rep numbers are R1, R2, R3 in the source document, but are changed to
R01, R02, R03 here to emphasize the wheat and barley are in different
replicates. (Almost certainly)

Data provenance: K.Wright prepared the data from page 234 of LeClerg et al. (1962).

Source:
Erwin LeClerg, Warren Leonard, Andrew Clark (1962).
Field Plot Technique.
https://archive.org/details/fieldplottechniq0000lecl


useOuterStrips(dotplot(gen~yield|factor(year)*loc, data=dat, group=crop))
immer.mets <- dat
