# borden.sugarcane.R

libs(dplyr, readxl, stringr)
setwd("c:/drop/rpack/agridat/data-raw")
dat <- read_excel("borden.sugarcane.uniformity.xlsx")
head(dat)
libs(reshape2)
dat <- melt(dat, id.vars=c("row","col"))
head(dat)
dat <- rename(dat, year=variable, yield=value)
dat <- mutate(dat, year=str_replace(year, "yield", ""))
head(dat)
borden.sugarcane.uniformity <- dat
kw::agex(borden.sugarcane.uniformity, prompt=FALSE)

filter(dat, year==1929)  %>%  pull(yield) %>% mean() # 83.127 # Borden has 83.1

