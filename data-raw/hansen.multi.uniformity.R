# hansen.multi.uniformity

## ---------------------------------------------------------------------------

  
libs(readxl,desplot,dplyr,reshape2)
dat <- read_excel("hansen.multi.uniformity.xlsx")
hansen.multi.uniformity <- dat

# Field A2: Average across years
dat %>% group_by(row,col) %>% summarize(mn=mean(yield)) %>% dcast(row ~ col, value.var="mn")

# Field E2: Match column totals
dat %>% filter(field=="E2") %>% group_by(year,col) %>% summarize(tot=sum(yield)) %>% dcast(year~col, value.var="tot")

# Heatmaps. Aspect ratio is an educated guess
libs(dplyr, desplot)
dat <- dat %>% mutate(dat, field=factor(field), year=factor(year))
dat %>% filter(field=="A2") %>% desplot(yield ~ col*row|year, tick=TRUE, flip=TRUE, aspect=(5*7.4)/(6*7.4))
dat %>% filter(field=="E2") %>% desplot(yield ~ col*row|year, tick=TRUE, flip=TRUE, aspect=(8*8)/(16*8))

# Look at correlation of plots across years
libs(dplyr, lattice)
dat <- dat %>% mutate(plot=paste(row,col))
filter(dat, field=="A2") %>% acast(plot ~ year, value.var="yield") %>%
  splom()
filter(dat, field=="E2") %>% acast(plot ~ year, value.var="yield") %>%
  splom()
