
# This file is for unlisting rda objects in agridat into tidy data frames



Use 'name.crop.covs' with columns 'covar' and 'value'

lib(agridat)
lib(reshape2)

# ----------------------------------------------------------------------------

write.table(aastveit.barley.covs, file="c:/x/rpack/agridat/data/aastveit.barley.covs.txt", sep="\t", row.names=FALSE)

aastveit.barley.covs <- melt(aastveit.barley$covs)
names(aastveit.barley.covs) <- c('year','covar','value')
aastveit.barley.height <- melt(aastveit.barley$height)
names(aastveit.barley.height) <- c('year','gen','height')

agex(aastveit.barley.height)
agex(aastveit.barley.covs)

write.table(aastveit.barley.covs, "c:/x/rpack/agridat/data/aastveit.barley.covs.txt", sep="\t", row.names=FALSE)

# ----------------------------------------------------------------------------

melt(ortiz.tomato$yield) -> yld
names(yld) <- cc('env','gen','yield')
melt(ortiz.tomato$covs) -> covs
names(covs) <- cc('env','covar','value')
melt(ortiz.tomato$weight) -> wts
names(wts) <- cc('env','gen','weight')
ortiz.tomato.yield <- cbind(yld, weight=wts$weight)
ortiz.tomato.covs <- covs

agex(ortiz.tomato.covs)
agex(ortiz.tomato.yield)

# ----------------------------------------------------------------------------

talbot.potato$
  yield char

talbot.potato.yield <- talbot.potato$yield
talbot.potato.yield <- melt(talbot.potato.yield)
names(talbot.potato.yield) <- c('gen','loc','yield')

talbot.potato.traits <- talbot.potato$char
talbot.potato.traits <- melt(talbot.potato.traits)
names(talbot.potato.traits) <- c('gen','trait','value')

agex(talbot.potato.traits)
agex(talbot.potato.yield)


# ----------------------------------------------------------------------------

steptoe.morex.geno

# ----------------------------------------------------------------------------

vargas.txe
  yield covs, yr ~ trt, yr ~ cov

vvc <- vargas.txe$covs
vvc <- cbind(year=rownames(vvc), as.data.frame(vvc))

vvy <- vargas.txe$yields


# ----------------------------------------------------------------------------

vargas.wheat1
  genvals envvals  gen*trt, yr*cov <-- already data frames

vargas.wheat1$genvals %>% head
vargas.wheat1$envvals %>% head

vargas.wheat1.traits <- vargas.wheat1$genvals

vargas.wheat1.covs <- vargas.wheat1$envvals


agex(vargas.wheat1.covs)
agex(vargas.wheat1.traits)

acast(vargas.wheat1.yield, env ~ gen, value.var='yield')
acast(vargas.wheat1.yield, env ~ covar, value.var='value')

# ----------------------------------------------------------------------------

vargas.wheat2
  yield env*gen, covs env*cov

vargas.wheat2.yield <- vargas.wheat2$yield
vargas.wheat2.yield <- melt(vargas.wheat2.yield)
names(vargas.wheat2.yield) <- c('env','gen','yield')

vargas.wheat2.covs <- vargas.wheat2$covs
vargas.wheat2.covs <- melt(vargas.wheat2.covs)
names(vargas.wheat2.covs) <- c('env','covar','value')

agex(vargas.wheat2.covs)
agex(vargas.wheat2.yield)

acast(vargas.wheat2.yield, env ~ gen, value.var='yield')
acast(vargas.wheat2.yield, env ~ covar, value.var='value')

# ----------------------------------------------------------------------------

write.table(ortiz.tomato.covs, "c:/x/rpack/agridat/data/ortiz.tomato.covs.txt", sep="\t", row.names=FALSE)
