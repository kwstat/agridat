# kotowski.potato.uniformity.R

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

dat1 <- read_excel("data-raw/kotowski.potato.uniformity.xlsx","field1yield", col_names=FALSE) / 10
dat2 <- read_excel("data-raw/kotowski.potato.uniformity.xlsx","field1starch", col_names=FALSE) / 10 
dat3 <- read_excel("data-raw/kotowski.potato.uniformity.xlsx","field2yield", col_names=FALSE) / 10
dat4 <- read_excel("data-raw/kotowski.potato.uniformity.xlsx","field2starch", col_names=FALSE) / 10

# multiple matrices

dat1 %<>% as.matrix %>% `colnames<-`(1:ncol(dat1)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(field="F1")
dat3 %<>% as.matrix %>% `colnames<-`(1:ncol(dat3)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(field="F2")

dat2 %<>% as.matrix %>% `colnames<-`(1:ncol(dat2)) %>% melt %>% rename(row=Var1,col=Var2,starch=value) %>% mutate(field="F1")
dat4 %<>% as.matrix %>% `colnames<-`(1:ncol(dat4)) %>% melt %>% rename(row=Var1,col=Var2,starch=value) %>% mutate(field="F2")


dat13 <- dplyr::bind_rows(dat1, dat3)
dat24 <- dplyr::bind_rows(dat2, dat4)

dat <- select(dat13, field, row, col, yield)
dat <- cbind(dat, select(dat24, starch))

## ---------------------------------------------------------------------------

kotowski.potato.uniformity <- dat
kw::agex(kotowski.potato.uniformity)

libs(desplot)
desplot(dat, yield~col*row|field, subset=field=="F1",
        tick=TRUE, flip=TRUE,
        aspect=(4*10)/(12*2.5),
        main="kotowski.potato.uniformity - yield, field F1")
desplot(dat, yield~col*row|field, subset=field=="F2",
        tick=TRUE, flip=TRUE,
        aspect=(4*10)/(26*2.5),
        main="kotowski.potato.uniformity - yield, field F2")
desplot(dat, starch~col*row|field, subset=field=="F1",
        tick=TRUE, flip=TRUE,
        aspect=(4*10)/(12*2.5),
        main="kotowski.potato.uniformity - starch, field F1")
desplot(dat, starch~col*row|field, subset=field=="F2",
        tick=TRUE, flip=TRUE,
        aspect=(4*10)/(26*2.5),
        main="kotowski.potato.uniformity - starch, field F2")

