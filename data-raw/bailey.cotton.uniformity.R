# bailey.cotton.uniformity.R

# Data were typed and proofread by KW 2023.01.11
# Location means of this data match the published means.


libs(dplyr,readxl,reshape2)
setwd("c:/drop/rpack/agridat/data-raw/")
dat1 <- read_excel("bailey.cotton.uniformity.xlsx", sheet="Sakha1921", col_names = FALSE)
dat2 <- read_excel("bailey.cotton.uniformity.xlsx", sheet="Gemmeiza1921", col_names = FALSE)
dat3 <- read_excel("bailey.cotton.uniformity.xlsx", sheet="Gemmeiza1922", col_names = FALSE)
dat3 <- dat3/10
dat4 <- read_excel("bailey.cotton.uniformity.xlsx", sheet="Giza1921", col_names = FALSE)
dat4 <- dat4/100
dat5 <- read_excel("bailey.cotton.uniformity.xlsx", sheet="Giza1923", col_names = FALSE)
dat5 <- dat5/100


dat1 <- dat1 %>% as.matrix %>% `colnames<-`(1:8) %>% melt %>%
  rename(row=Var1,col=Var2,yield=value) %>% mutate(year="1921", loc="Sakha")
dat2 <- dat2 %>% as.matrix %>% `colnames<-`(1:8) %>% melt %>%
  rename(row=Var1,col=Var2,yield=value) %>% mutate(year="1921", loc="Gemmeiza")
dat3 <- dat3 %>% as.matrix %>% `colnames<-`(1:8) %>% melt %>%
  rename(row=Var1,col=Var2,yield=value) %>% mutate(year="1922", loc="Gemmeiza")
dat4 <- dat4 %>% as.matrix %>% `colnames<-`(1:14) %>% melt %>%
  rename(row=Var1,col=Var2,yield=value) %>% mutate(year="1921", loc="Giza")
dat5 <- dat5 %>% as.matrix %>% `colnames<-`(1:8) %>% melt %>%
  rename(row=Var1,col=Var2,yield=value) %>% mutate(year="1923", loc="Giza")

dat <- rbind(dat1,dat2,dat3,dat4,dat5)
bailey.cotton.uniformity <- dat

## ---------------------------------------------------------------------------

dat <- bailey.cotton.uniformity
dat <- transform(dat, env=paste(year,loc))

# Data check. Matches Bailey 1926 Table 1. 28.13, , 46.02, 31.74, 13.52
dat %>% group_by(env) %>% dplyr::summarize(mn=mean(yield))

libs(desplot)
desplot(dat, yield ~ col*row|env)

# 1923 Giza has alternately hi/lo yield columns
filter(dat, env=="1923 Giza") %>% desplot(yield ~ col*row, main="1923 Giza")

# The yield scales are quite different at each loc, and the dimensions
# are different, so plot each location separately.
# Note: Bailey does not say if plots are 7x15 meters, or 15x7 meters.
# The choices here seem most likely in our opinion.
filter(dat, env=="1921 Sakha") %>%
  desplot(yield ~ col*row, main="1921 Sakha", aspect=(20*8.5)/(8*15))
filter(dat, env=="1921 Gemmeiza") %>%
  desplot(yield ~ col*row, main="1921 Gemmeiza", aspect=(20*8.5)/(8*15))
filter(dat, env=="1922 Gemmeiza") %>%
  desplot(yield ~ col*row, main="1922 Gemmeiza", aspect=(20*8.5)/(8*15))
filter(dat, env=="1921 Giza") %>%
  desplot(yield ~ col*row, main="1921 Giza", aspect=(11*6)/(14*8.5))
filter(dat, env=="1923 Giza") %>%
  desplot(yield ~ col*row, main="1923 Giza", aspect=(20*6)/(8*8.5))

