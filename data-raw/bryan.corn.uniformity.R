# bryan.corn.uniformity.R
# Time-stamp: <06 Dec 2019 15:53:04 c:/x/rpack/agridat/data-raw/bryan.corn.uniformity.R>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)


# multiple matrices
setwd("c:/x/rpack/agridat/data-todo")

# table22 and 23 were typed by hand--a slight difference in the means
# indicates there is probably a small typo in one of these tables
# tables 24-27 were obtained from online OCR->Excel, then checked by hand

dat22 <- read_excel("bryan.maize.uniformity.xlsx","table22", col_names=FALSE)
dat23 <- read_excel("bryan.maize.uniformity.xlsx","table23", col_names=FALSE)
dat24 <- read_excel("bryan.maize.uniformity.xlsx","table24", col_names=FALSE)
dat25 <- read_excel("bryan.maize.uniformity.xlsx","table25", col_names=FALSE)
dat26 <- read_excel("bryan.maize.uniformity.xlsx","table26", col_names=FALSE)
dat27 <- read_excel("bryan.maize.uniformity.xlsx","table27", col_names=FALSE)


dat22 %>% tibble::column_to_rownames(var="...1") %>% as.matrix %>% `colnames<-`(1:ncol(.)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) -> dat22

dat23 %>% tibble::column_to_rownames(var="...1") %>% as.matrix %>% `colnames<-`(1:ncol(.)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) -> dat23

# First two sheets were typed without decimal points
dat22 <- mutate(dat22, yield=yield/100)
dat23 <- mutate(dat23, yield=yield/100)

dat24 %>% tibble::column_to_rownames(var="...1") %>% as.matrix %>% `colnames<-`(1:ncol(.)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) -> dat24

dat25 %>% tibble::column_to_rownames(var="...1") %>% as.matrix %>% `colnames<-`(1:ncol(.)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) -> dat25

dat26 %>% tibble::column_to_rownames(var="...1") %>% as.matrix %>% `colnames<-`(1:ncol(.)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) -> dat26

dat27 %>% tibble::column_to_rownames(var="...1") %>% as.matrix %>% `colnames<-`(1:ncol(.)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) -> dat27


desplot(yield ~ col*row, dat22, flip=TRUE, tick=TRUE)
desplot(yield ~ col*row, dat23, flip=TRUE, tick=TRUE)
desplot(yield ~ col*row, dat24, flip=TRUE, tick=TRUE)
desplot(yield ~ col*row, dat25, flip=TRUE, tick=TRUE)
desplot(yield ~ col*row, dat26, flip=TRUE, tick=TRUE)
desplot(yield ~ col*row, dat27, flip=TRUE, tick=TRUE)


# Table 1.
mean(dat22$yield)/8
mean(dat23$yield)/8 # slight difference
mean(dat24$yield)/8
mean(dat25$yield)/8 # same
mean(dat26$yield)/8
mean(dat27$yield)/8 # same

dat <- rbind( data.frame(expt="K23E", dat22),
             data.frame(expt="K23N", dat23),
             data.frame(expt="I25E", dat24),
             data.frame(expt="I25N", dat25),
             data.frame(expt="M25E", dat26),
             data.frame(expt="M25N", dat27) )
bryan.corn.uniformity <- dat
kw::agex(bryan.corn.uniformity)

# ----------------------------------------------------------------------------

libs(agridat)
data("bryan.corn.uniformity")
dat <- bryan.corn.uniformity

libs(desplot)
desplot(yield ~ col*row|expt, dat,
        main="bryan.maize.uniformity",
        aspect=(48*3.5/(6*8*3.5)),
        flip=TRUE, tick=TRUE)

# Table 5, column 8 hills
dat %>% group_by(expt) %>% summarize(sd(yield)/mean(yield)*100)
