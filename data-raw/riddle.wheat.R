# riddle.wheat.R
# Time-stamp: <31 Jan 2023 13:58:39 c:/drop/rpack/agridat/data-raw/riddle.wheat.R>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

setwd("c:/drop/rpack/agridat/data-raw/")
dat1 <- read_excel("riddle.wheat.xlsx","Sheet1", col_names=TRUE)
dat2 <- read_excel("riddle.wheat.xlsx","Sheet2", col_names=TRUE)
dat <- rbind(dat1,dat2)

## ---------------------------------------------------------------------------

# Match the means in the footnotes of Table 2 and Table 3
dat %>% group_by(expt, year) %>% summarize(mn=mean(yield)) %>% as.data.frame()

# The design employed was a modified Latin square.
# There were 5 replications divided into 5 columns superimposed upon and situated at right angles to the replications.
# Strains were grown in single 16-foot row plots.
# CRD except that each strain occurred once (and only once) in each replication and each column
# The same randomization but totally different fields were used in the two years.

dat <- transform(dat, yrexpt=paste0(year, expt))
libs(desplot)
filter(dat, yrexpt=="1939Baart") %>% heat(., yield ~ strain*rep)


datb39 <- filter(dat, expt=="Baart", year==1939)
datb40 <- filter(dat, expt=="Baart", year==1940)
datw39 <- filter(dat, expt=="WhiteFed", year==1939)
datw40 <- filter(dat, expt=="WhiteFed", year==1940)


# Match table 4, sec 1
datb39 <- mutate(datb39,
                 col=NA,
                 col = ifelse(row %in% 39:44, 1, col),
                 col = ifelse(row %in% 45:50,2, col),
                 col = ifelse(row %in% 51:56, 3, col),
                 col = ifelse(row %in% 57:62, 4, col),
                 col = ifelse(row %in% 63:68, 5, col))
anova(aov(yield ~ factor(rep) + factor(col) + strain, datb39))

# Match table 4, sec b
datb40 <- mutate(datb40,
                 col=NA,
                 col = ifelse(row %in% 39:44, 1, col),
                 col = ifelse(row %in% 45:50,2, col),
                 col = ifelse(row %in% 51:56, 3, col),
                 col = ifelse(row %in% 57:62, 4, col),
                 col = ifelse(row %in% 63:68, 5, col))
anova(aov(yield ~ factor(rep) + factor(col) + strain, datb40))

# Match table 4, sec d
datw39 <- mutate(datw39,
                 col = NA,
                 col = ifelse(row %in% 2:8, 1, col),
                 col = ifelse(row %in% 9:15, 2, col),
                 col = ifelse(row %in% 16:22, 3, col),
                 col = ifelse(row %in% 23:29, 4, col),
                 col = ifelse(row %in% 30:36, 5, col) )
anova(aov(yield ~ factor(rep) + factor(col) + strain, datw39))

# Checked WhiteFed 1940 by hand. Exact match. AOV tables slightly different.
# Match table 4, sec e
datw40 <- mutate(datw40,
                 col = NA,
                 col = ifelse(row %in% 2:8, 1, col),
                 col = ifelse(row %in% 9:15, 2, col),
                 col = ifelse(row %in% 16:22, 3, col),
                 col = ifelse(row %in% 23:29, 4, col),
                 col = ifelse(row %in% 30:36, 5, col) )
anova(aov(yield ~ factor(rep) + factor(col) + strain, datw40))

dat <- rbind(datb39,datb40,datw39,datw40)


desplot(dat, yield ~ row*rep|yrexpt, tick=TRUE, out1=col, main="riddle.wheat")
# Show the randomization was the same in each year (but not each expt).
desplot(dat, strain ~ row*rep|yrexpt, tick=TRUE, out1=col, main="riddle.wheat")

dat$yrexpt <- NULL
riddle.wheat <- dat
head(riddle.wheat)


agex(riddle.wheat)

## ---------------------------------------------------------------------------

libs(lattice)

xyplot(factor(strain) ~ yield|yrexpt, data=dat)
