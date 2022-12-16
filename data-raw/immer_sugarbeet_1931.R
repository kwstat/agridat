# immer_sugarbeet_1931.R

# Obtained a pdf from Rothamsted (Folder 1, Genstat data 10)
# Screenshot of table, then uploaded to
# https://www.onlineocr.net/

## ---------------------------------------------------------------------------

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

# one matrix, no column names

setwd("c:/drop/rpack/agridat/data-raw/")
dat <- read_excel("immer_sugarbeet_1931.xlsx","Sheet1", col_names=FALSE)
sum(dat)
apply(dat, 2, sum) # Match to original paper
dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

# Add 40 pounds back to the data, per original document
dat$yield <- dat$yield+40


# Combine with previous immer data

immer30 <- agridat::immer.sugarbeet.uniformity
immer30 <- cbind(year=1930, immer30)

immer31 <- cbind(year=1931, dat, sugar=NA, purity=NA)

dat <- rbind(immer30, immer31)

immer.sugarbeet.uniformity <- dat


agex(immer.sugarbeet.uniformity)


## ---------------------------------------------------------------------------


require(desplot)
desplot(dat, yield ~ col*row|year,
        flip=TRUE, aspect=1,
        main="immer.sugarbeet.uniformity")

