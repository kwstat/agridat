# barrero.maize.R

# Data originally from http://maizeandgenetics.tamu.edu/CTP/CTP.html
# Not available from Wayback.

# Data comments
# The "barrero.maize.csv" file has imperial measurements
# e.g. pop is plants/acre (probably)

# The data "barrero.maize.xls" contains metric equivalents for journal paper
# 'yeartesting' column appears to be the first year of testing for the hybrid
# but there are missing values for some reason.


# They say:
# Column "yeartesting" is the first year of testing. If this contains
# a "." it was an experimental Texas A&M hybrid or genotype.


year: testing year, 2000-2010
yor: year of release, 2000-2010
location: 16
env: (year+loc) 2000BA, 2000CA, etc, 107 levels
rep
gen: genotype, 847
daystoflower
plantheight cm
earheight cm
population plants/ha
lodged percent lodged per plot
moisture percent
testweight kg/ha
yield ton/ha

## ---------------------------------------------------------------------------

libs(asreml,dplyr,kw,Hmisc,lattice)
#dat2 <- readr::read_csv("barrero.maize.csv")

dat <- readxl::read_excel("barrero.maize.xls")
dat$rows <- NULL # all are 2-row plots
dat$rowwidth <- NULL # rowwidth is cm
dat$rangelength <- NULL # rangelength is m
dat$rep <- paste0("R", dat$rep)
dat <- rename(dat, gen=hybrid)
dat <- rename(dat, yor=yeartesting) # year of release
dat <- rename(dat, loc=location)
# Number of plants depends on plot size. "population" is better
# plot(dat$noplants, dat$population)
dat$noplants <- NULL
# Weight depends on plot size. "testweight" is better
# plot(dat$plotweight, dat$testweight)
dat$plotweight <- NULL
# locno is same as year+loc
# all.equal(dat$locno, paste0(dat$year, dat$location))
dat <- rename(dat, env=locno)
# Not sure what erect is, but "lodged" is in the paper
# plot(dat$erect, dat$lodged)
dat$erect <- NULL
# Irrigation factor
# dat$irr <- ifelse(dat$location %in% c('BA','CC','GR','LE','PR','TH','WH'), 'no','yes')
# Plot no is not useful
dat$plot <- NULL

Hmisc::describe(dat)

## ---------------------------------------------------------------------------

# First year of testing. My "first" matches their "yor"="yeartesting"
# first <- tapply(dat$year, dat$gen, min)
# dat$first <- lookup(dat$gen, names(first), first)
# xyplot(yor ~ first, dat)

# Table 2. Number of hybrids in common for locs
# Create gen*loc incidence matrix, then count common gens per loc
d1 <- acast(dat, gen~location, fun=function(x) ifelse(length(x)>0,1,0) )
d2 <- t(d1)%*%d1
libs(Matrix)
Matrix::tril(d2) # Very similar, but not identical

# Table 3. Number of hybrids in common for years
# Slight differences on the diagonal in 2000,2003,2008
d1 <- acast(dat, gen~year, fun=function(x) ifelse(length(x)>0,1,0) )
d2 <- t(d1)%*%d1
tril(d2) # Similar, not identical

# Table 3 datapoints.  Exact match to paper.
aggregate(yield~year, data=dat, FUN=length)
# Table 3 means.
round(aggregate(yield~year, data=dat, FUN=mean, na.rm=TRUE),2)


barrero.maize <- dat
kw::agex(barrero.maize)
## ---------------------------------------------------------------------------

dat <- barrero.maize

# Table 6 of Barrero. Model equation 1.
pacman::p_load(dplyr, asreml, lucid)
dat <- arrange(dat, env)
dat <- mutate(dat,
              yearf=factor(year), env=factor(env),
              loc=factor(loc), gen=factor(gen), rep=factor(rep))
m1 <- asreml(yield ~ loc + yearf + loc:yearf, data=dat,
             random = ~ gen + rep:loc:yearf +
             gen:yearf + gen:loc +
             gen:loc:yearf,
             residual = ~ dsum( ~ units|env) )

# Barrero table 6 variance components for yield match.
lucid::vc(m1)[1:5,]
 ##        effect component std.error z.ratio bound %ch
 ## rep:loc:yearf   0.111     0.01092    10       P 0  
 ##           gen   0.505     0.03988    13       P 0  
 ##     gen:yearf   0.05157   0.01472     3.5     P 0  
 ##       gen:loc   0.02283   0.0152      1.5     P 0.2
 ## gen:loc:yearf   0.2068    0.01806    11       P 0  

summary(vc(m1)[6:112,"component"]) # Means match last row of table 6
 ##   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 ## 0.1286  0.3577  0.5571  0.8330  1.0322  2.9867 



# Stuff below has not been checked...

# Table 7
library(tibble)
c1 <- coef(m1)$random
c1 <- rownames_to_column(as.data.frame(c1), "coef")
c1 <- c1[ str_match(c1$coef, "^gen_"), ]
c1 <- c1[1:nlevels(dat$gen),]
# Curiosly, Barrero did not list all top 10, but the ones they did list DO
# match my BLUPs
head(sort(c1),15)

# Fig 5
blups <- data.frame(gen=names(c1), est=as.vector(c1))
blups$gen <- gsub("gen_", "", blups$gen)
blups$yor <- lookup(blups$gen, dat$gen, dat$yor)
head(blups)
with(blups, plot(est~yor, ylim=c(-1.5,1.5)))
m2 <- lm(est~yor, data=blups)
coef(m2)  # Does NOT match figure 5 slope.  Maybe only use "Commercial hybrids"
abline(h=0, col="gray80")
abline(coef(m2))

# Fig 7.  Match to Barrero.  Q: There appears to be a negative trend
bl <- coef(m1, pattern="^yearf")
plot(bl, type='l')
abline(h=0, col="gray80")

# Right? way
p1 <- predict(m1, classify="yearf", present=list(yearf=c("yearf","loc")))
p1$pred$pval
plot(p1$pred$pval[,"predicted.value"], type='l', main="Barrero")

# KW: Why not add slope to original mixed model?
m3 <- asreml(yield ~ 1 + yor # lin(yearf)
             + irr + irr:yor +
             loc + yearf + loc:yearf, data=dat,
             random = ~ gen + rep:loc:yearf +
             gen:yearf + gen:loc +
             gen:loc:yearf,
             na.method.X='omit'
             )
fixef(m3) # yor=.0523
# .0523 * 15.93 = .83 bu / ac / yr
bl <- coef(m3, pattern="^yearf")
plot(bl, type='l')  # WARNING, the data is unbalanced, so this is not right
abline(h=0, col="gray80")

#p3 <- predict(m3, classify="yearf", average=list(loc, pwts=c(1,0,0,1,0,1,0,0,0,0,0,0,0,0,1,1)/5))
p3 <- predict(m3, classify="yearf", present=list(yearf=c("yearf","loc","irr")))
p3$pred$pval
plot(p3$pred$pval[,"predicted.value"], type='l', main="Revised")

# Keith Boldman says to put checks in their own first year
tab <- with(dat, table(year,gen))
tt <- colSums(tab>0) # years of testing per hyb
tt <- names(tt[tt>3]) # These are the "check" hybrids
tt
dat$first <- ifelse(dat$gen %in% tt, "1900", dat$yor)
dat <- transform(dat, first=factor(first))

# Then use this model
# Yld ~ mu env FirstYear !r Hybrid  # also with one-level pedigree
m4 <- asreml(yield ~ env + first, data=dat, random = ~ gen + gen:env,
             na.method.X='omit')
fixef(m4)[1:12]
bl <- fixef(m4)[2:12]
bl <- data.frame(yor=2000:2010, est=bl)
plot(est~yor, data=bl, type='b')
coef(lm(est~yor, data=bl)) # .116 seems too high

bl <- fixef(m4)
bl <- bl[13:(length(bl)-1)]
bl <- data.frame(bl=bl)
bl$year <- as.numeric(substring(rownames(bl), 5,8))
with(bl, plot(bl~year))
