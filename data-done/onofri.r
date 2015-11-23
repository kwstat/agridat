
Many datasets, functions
http://accounts.unipg.it/~onofri/RTutorial/
aomisc package will not load in current R


lib(rio)

andrea.onofri@unipg.it

# Split-block
# http://accounts.unipg.it/~onofri/RTutorial/CaseStudies/recrop.htm
dat <- import("http://accounts.unipg.it/~onofri/RTutorial/CaseStudies/recrop/recrop.RData")

# Split-plot
# http://accounts.unipg.it/~onofri/RTutorial/CaseStudies/FabaBean.htm
dat <- import("http://accounts.unipg.it/~onofri/RTutorial/CaseStudies/FabaBean/FabaBean.RData")

# ----------------------------------------------------------------------------


The WinterWheat data appear to be the rep-level data for the R-news article
"Using R to Perform the AMMI Analysis on Agriculture Variety Trials"
http://www.casaonofri.it/Biometry/index.html
Also used here
http://tarwi.lamolina.edu.pe/~fmendiburu/AMMI.htm

# Multi-year winter-wheat
# http://accounts.unipg.it/~onofri/RTutorial/CaseStudies/WinterWheat.htm
# http://www.casaonofri.it/Biometry/index.html

lib(rio)
dat <- import("c:/x/rpack/agridat/data-done/onofri.winterwheat.xlsx")
dat$block <- paste0("B",dat$block)

onofri.winterwheat <- dat
# ----------------------------------------------------------------------------
dat <- onofri.winterwheat
dat <- transform(dat, year=factor(dat$year))
m1 <- aov(yield ~ year + block:year + gen + gen:year, dat)
anova(m1) # Matches Onofri figure 1

if(require(agricolae)){
  m2 <- AMMI(dat$year, dat$gen, dat$block, dat$yield)
  plot(m2)
}


