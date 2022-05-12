
An experiment with meadowfoam.
50 new genotypes, 3 checks (C1=Ross, C2=OMF183, C3=Starlight), 6 reps of checks
Blocks are in one direction, serpentine layout.
The response variable is thousand seed weight.


pacman::p_load(dplyr,kw,readr)
dat <- read.csv("http://www.pbgworks.org/sites/pbgworks.org/files/ExampleData.txt", sep="")
names(dat) <- c("plot","gen","name","block","tsw")
dat <- mutate(dat,
              gen=paste0("G",pad(dat$gen)),
              block=paste0("B",block))
dat <- mutate(dat,
              row=c(rep(1:5, each=12), rep(6,8)),
              col=c(1:12,12:1,1:12,12:1,1:12,12:5))

kling.augmented <- dat
agex(kling.augmented)
## ---------------------------------------------------------------------------

dat <- kling.augmented
libs(desplot,lattice,lme4)
desplot(dat, ~ col*row, num=plot) # Match expt design
desplot(dat, tsw ~ col*row, text=name, cex=1.5)

# fixed blocks, random genotypes
m1 <- lmer(tsw ~ block + (1|name), data=dat)
m1
ran1 <- ranef(m1, condVar=TRUE)
ran1
dotplot(ran1) # Caterpillar plot

dat <- mutate(dat,
              new=ifelse(gen > "G50", 0, 1),
              entryc=ifelse(gen > "G50", gen, "999"))
dat <- mutate(dat,
              block=factor(block),
              gen=factor(gen),
              entryc=factor(entryc))
# Yuck, mixing fixed/random genotypes is so ugly...
m2 <- lmer(tsw ~ entryc + gen:new + (1|block), data=dat)

anova(aov(tsw ~ block + gen, data=dat)) # Same Residual SS as Kling

# Try the augmentedRCBD package
libs(augmentedRCBD)
dat <- mutate(dat, block=factor(block), gen=factor(gen))
# Some of the anova table rows match the results from Kling
out1 <- augmentedRCBD(dat$block, dat$gen, dat$tsw, checks=c("G89","G90","G91"))
