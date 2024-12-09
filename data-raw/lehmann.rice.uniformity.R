                

-----
  
libs(readxl)

dat <- read_excel("data-raw/lehmann.rice.uniformity.xlsx")
head(dat)

libs(kw)
lehmann.rice.uniformity <- dat
agex(lehmann.rice.uniformity)

libs(dplyr)
dat %>% group_by(year, range) %>% summarize(tot=sum(yield)) %>% as.data.frame()

libs(desplot)
desplot(dat, yield~range*plot|year,
        aspect=(17*50)/(2*200),
        flip=TRUE, tick=TRUE,
        main="lehmann.rice.uniformity")
