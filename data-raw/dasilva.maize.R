# dasilva.maize.R
# Time-stamp: <13 Aug 2019 14:31:23 c:/x/stat/biplot-stderr/DaSilva/dasilva.maize.R>

# Source:

## Carlos Pereira da Silva, Luciano Antonio de Oliveira, Joel Jorge Nuvunga, Andrezza Kéllen Alves Pamplona, Marcio Balestre. (2015)
## A Bayesian Shrinkage Approach for AMMI Models
## http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0131414#pone-0131414-t001 CC-BY. Partial code, data.

# DaSilva Table 1 has a footnote "Machado et al 2007". This is not listed in the references.
# The reference appears to be:
# Machado et al.
# Estabilidade de produção de híbridos simples e duplos de milhooriundos de um mesmo conjunto gênico
# Bragantia, 67, no 3.
# www.scielo.br/pdf/brag/v67n3/a10v67n3.pdf

# In DaSilva Table 1, the mean of E1 is 10.803.  This appears to be a copy of
# the mean from row 1 of Table 1 in Machado. Using the supplemental data
# from this paper, the correct mean is 8.685448.

# The supplemental data for this paper (DaSilva) come from
# the locations in rows 2-10 of Table 1 of Machado.

# Calculate the Mean yield in Table 1.  Means for 8 locations match the
# results in the paper. For location E8, the mean does not match.
  env     yield   # DaSilva     # Machado
1  E1  6.211817   # 6.212  E2.  # Row 2 in Machado
2  E2  4.549104   # 4.549  E3.  # Row 3 in Machado
3  E3  5.152254   # 5.152  E4   # etc
4  E4  6.245904   # 6.246  E5
5  E5  8.084609   # 8.085  E6
6  E6 13.191890   # 13.192 E7
7  E7  8.895721   # 8.896  E8
8  E8  8.685448                 # Row  9
9  E9  8.737089   # 8.737  E9   # Row 10

# Using the supplemental data of this paper, I was able to match
# the anova table in supplement S2.

libs(asreml,dplyr,fs,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-raw/")
dat0 <- read_csv("dasilva.maize.csv")
dat <- dat0
head(dat)
names(dat) <- c('env','rep','gen','yield')
dat <- mutate(dat, rep=paste0("R",rep), env=paste0("E",env),
              gen=paste0("G",pad(gen)))
dasilva.maize <- dat

# ----------------------------------------------------------------------------

lib(agridat)
dat <- dasilva.maize


library(gge)
m1 <- gge(yield ~ gen*env, data=dat)
biplot(m1)

# Mean yield per env
aggregate(yield ~ env, data=dat, FUN=mean)

# Try to match CVs.  Not right.
dat %>% group_by(env,rep) %>%
  summarize(yield=mean(yield)) %>%
  ungroup %>%
    group_by(env) %>%
    summarize(yield=100*sd(yield)/mean(yield))

