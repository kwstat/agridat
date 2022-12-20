# chakravertti.factorial.R

libs(dplyr,readxl)

dat <- read_excel("chakravertti.factorial.xlsx")
dat <- filter(dat, !is.na(block))
# Change the 'nil' plots to 0
dat[is.na(dat$yield),"yield"] <- 0

dat$x <- dat$y <- NULL

dat$seeds <- NA
dat$seeds <- ifelse(dat$treat %in% c('a','b','c'), "1",    dat$seeds)
dat$seeds <- ifelse(dat$treat %in% c('d','e','f'), "2",    dat$seeds)
dat$seeds <- ifelse(dat$treat %in% c('g','h','i'), "local",dat$seeds)

dat$spacing <- NA
dat$spacing <- ifelse( dat$treat %in% c('a','d','g'), 6, dat$spacing)
dat$spacing <- ifelse( dat$treat %in% c('b','e','h'), 9, dat$spacing)
dat$spacing <- ifelse( dat$treat %in% c('c','f','i'), 12, dat$spacing)

head(dat)
chakravertti.factorial <- dat

dat %>% group_by(block,treat) %>% count() %>% as.data.frame()
dat %>% group_by(block,date,gen,treat) %>% count() %>% as.data.frame()



# Simple means for each factor. Same as Chakravertti Table 3
dat %>% group_by(gen) %>% summarize(mn=mean(yield)) %>% as.data.frame()
dat %>% group_by(date) %>% summarize(mn=mean(yield)) %>% as.data.frame()
dat %>% group_by(spacing) %>% summarize(mn=mean(yield)) %>% as.data.frame()
dat %>% group_by(seeds) %>% summarize(mn=mean(yield)) %>% as.data.frame()

libs(HH)
interaction2wt(yield ~ gen + date + spacing + seeds, data=dat, main="chakravertti.factorial")



# ANOVA matches Chakravertti table 2
# This has a very interesting error structure.
# block:date is error term for date
# block:date:gen is error term for gen and date:gen
# Residual is error term for all other tests (not needed inside Error())
dat <- transform(dat,spacing=factor(spacing))
m2 <- aov(yield ~ block + date + 
           gen + date:gen + 
           spacing + seeds +
           seeds:spacing + date:seeds + date:spacing + gen:seeds + gen:spacing +
           date:gen:seeds + date:gen:spacing + date:seeds:spacing + gen:seeds:spacing +
           date:gen:seeds:spacing + Error(block/(date + date:gen)),
         data=dat)
summary(m2)

