

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# multiple matrices

dat1 <- read_excel("kerr.sugarcane.uniformity.xlsx","T1", col_names=FALSE)
dat2 <- read_excel("kerr.sugarcane.uniformity.xlsx","T2", col_names=FALSE)
dat3 <- read_excel("kerr.sugarcane.uniformity.xlsx","T3", col_names=FALSE)
dat4 <- read_excel("kerr.sugarcane.uniformity.xlsx","T4", col_names=FALSE)

dat1 %<>% as.matrix %>% `colnames<-`(1:ncol(dat1)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(trial="T1")
dat2 %<>% as.matrix %>% `colnames<-`(1:ncol(dat2)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(trial="T2")
dat3 %<>% as.matrix %>% `colnames<-`(1:ncol(dat3)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(trial="T3")
dat4 %<>% as.matrix %>% `colnames<-`(1:ncol(dat4)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(trial="T4")

dat <- rbind(dat1,dat2, dat3, dat4)

kerr.sugarcane.uniformity <- dat

# ----------------------------------------------------------------------------

dat <- kerr.sugarcane.uniformity

# match Kerr figure 4
desplot(yield ~ col*row|trial, dat,
        flip=TRUE, aspect=1, # true aspect
        main="kerr.sugarcane.uniformity")

# CV matches Kerr table 2, page 768
aggregate(yield ~ trial, dat, FUN= function(x) round(100*sd(x)/mean(x),2))

