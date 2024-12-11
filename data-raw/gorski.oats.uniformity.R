
libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

# multiple matrices

dat1 <- read_excel("data-raw/gorski.oats.uniformity.xlsx","one", col_names=FALSE) / 100
dat2 <- read_excel("data-raw/gorski.oats.uniformity.xlsx","two", col_names=FALSE) / 100
colnames(dat1) <- colnames(dat2) <- NULL

# typed as columns, so we need to transpose
dat1 <- t(dat1) %>% as.matrix()
dat2 <- t(dat2) %>% as.matrix()

dat1 %<>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(field="F1")
dat2 %<>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(field="F2")


dat <- dplyr::bind_rows(dat1, dat2)
head(dat)

gorski.oats.uniformity <- dat
kw::agex(gorski.oats.uniformity)

## ---------------------------------------------------------------------------

desplot(dat, yield~col*row, subset=field=="F1",
        flip=TRUE, tick=TRUE, aspect=(20)/(10),
        main="gorski.oats.uniformity - field F1")
desplot(dat, yield~col*row, subset=field=="F2",
        flip=TRUE, tick=TRUE, aspect=(20)/(15),
        main="gorski.oats.uniformity - field F2")


## ---------------------------------------------------------------------------


