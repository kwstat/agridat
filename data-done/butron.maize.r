# butron.maize.r
# Time-stamp: c:/x/rpack/agridat2/butron.maize.r

library(asreml)
library(kw)
library(Hmisc)
library(lattice)

setwd("c:/x/rpack/agridat2/")
dat <- import("butron.maize.xlsx")
dat <- melt(dat, id.var=c('gen','male','female'))
names(dat)[4:5] <- c('env','yield')

butron.maize <- dat
export(butron.maize, "../agridat/man/butron.maize.Rd")
export(butron.maize, "../agridat/data/butron.maize.txt")

dat <- transform(dat, gen=factor(gen), male=factor(male), female=factor(female))

# ----------------------------------------------------------------------------

dat <- butron.maize

densityplot(~yield|env, dat, layout=c(1,5))

mat <- acast(dat, gen~env, value.var='yield')
mat <- sweep(mat, 2, colMeans(mat))
mat.svd <- svd(mat)
# Calculate PC1 and PC2 scores as in Table 4 of Butron
round(mat.svd$u[,1:2] %*% diag(sqrt(mat.svd$d[1:2])) %*% diag(c(-1,1)),3)

biplot(princomp(mat), main="butron.maize", cex=.7) # Figure 1 of Butron

# ----------------------------------------------------------------------------

\dontrun{

# Here we see if including pedigree information is helpful for a multi-environment model

# Create the pedigree
ped <- dat[, c('gen','male','female')]
ped <- ped[!duplicated(ped),] # remove duplicates
unip <- unique(c(ped$male, ped$female)) # Unique parents
unip <- unip[!is.na(unip)]
# We have to define parents at the TOP of the pedigree
ped <- rbind(data.frame(gen=c("Dent","Flint"), # genetic groups
                        male=c(0,0),
                        female=c(0,0)),
             data.frame(gen=c("A509","A637","A661","CM105","EP28",
                          "EP31","EP42","F7","PB60","Z77016"),
                        male=rep(c('Dent','Flint'),each=5),
                        female=rep(c('Dent','Flint'),each=5)),
             ped)
ped[is.na(ped$male),'male'] <- 0
ped[is.na(ped$female),'female'] <- 0

# View the pedigree.  Can't use kinship2 ... plants can be both male/female
# Not the best view...too much overplotting
library(synbreed)
pe <- with(ped[1:57,], create.pedigree(gen, male, female, gener=NULL))
windows(9,6)
synbreed::plot.pedigree(pe, vertex.size=10, vertex.label.cex=.5, asp=.5) #

library(asreml)
ped.ainv <- asreml.Ainverse(ped)$ginv

m0 <- asreml(yield ~ 1+env, random = ~ gen, data=dat)
m1 <- asreml(yield ~ 1+env, random = ~ ped(gen), ginverse=list(gen=ped.ainv), data=dat)
m2 <- update(m1, random = ~ id(env):ped(gen))
m3 <- update(m2, random = ~ diag(env):ped(gen))
m4 <- update(m3, random = ~ fa(env,1):ped(gen))
m5 <- update(m4, random = ~ fa(env,2):ped(gen))
## AIC(m0,m1,m2,m3,m4)
##    df      AIC
## m0  2 229.4037
## m1  2 213.2487
## m2  2 290.6156
## m3  6 296.8061
## m4 11 218.1568

vc(m4)
p0 <- predict(m0, classify="gen")$pred$pvals
p1 <- predict(m1, classify="gen")$pred$pvals
p1par <- p1[1:12,]   # parents
p1 <- p1[-c(1:12),]  # hybrids
# Careful!  Need to manually sort the predictions
p0 <- p0[order(as.character(p0$gen)),]
p1 <- p1[order(as.character(p1$gen)),]


# lims <- range(c(p0$predicted.value, p1$predicted.value)) * c(.95,1.05)
lims <- c(6,8.25)
plot(p0$predicted.value, p1$predicted.value,
     pch="", xlim=lims, ylim=lims, main="butron.maize",
     xlab="BLUP w/o pedigree", ylab="BLUP with pedigree")
abline(0,1,col="lightgray")
text(x=p0$predicted.value, y=p1$predicted.value, p0$gen, cex=.5, srt=-45)
text(x=min(lims), y=p1par$predicted.value, p1par$gen, cex=.5)

names(p0)[2] <- "noped"
names(p1)[2] <- "ped"
p01 <- merge(p0[,1:2],p1[,1:2],all=TRUE)
p01$male <- unlist(lapply(strsplit(as.character(p01$gen), "x"),'[',1))
p01$female <- unlist(lapply(strsplit(as.character(p01$gen), "x"),'[',2))

xyplot(ped~noped|male, data=p01,
       panel=function(x,y,...){
         panel.abline(0,1,col="lightgray")
         panel.xyplot(x,y,...)
         })
