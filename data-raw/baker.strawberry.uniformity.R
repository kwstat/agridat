# baker.strawberry.uniformity.R

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

setwd("c:/drop/rpack/agridat/data-raw/")

dat1 <- read_excel("baker.strawberry.uniformity.xlsx",1, col_names=FALSE)
dat2 <- read_excel("baker.strawberry.uniformity.xlsx",2, col_names=FALSE)

dat1 %<>% as.matrix %>% `colnames<-`(1:ncol(dat1)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)
# The layout of the experiment in Table 1 shows 4 columns.
# There is 12 inches between column 1 and column 2, then 42 inches,
# then 12 inches between column 3 and column 4.
# We add 3 to the right two columns to indicate this layout.
# (Should be 3.5, but we want to have an integer).
dat1 <- mutate(dat1,
               col = ifelse(col==4, 7, col),
               col = ifelse(col==3, 6, col))

              

dat2 %<>% as.matrix %>% `colnames<-`(1:ncol(dat2)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

dat1 <- cbind(trial="T1", dat1)
dat2 <- cbind(trial="T2", dat2)

baker.strawberry.uniformity <- rbind(dat1, dat2)
kw::agex(baker.strawberry.uniformity, prompt=FALSE)
