
setwd("c:/x/rpack/agridat/data-raw/")
lib(readxl)
dat <- read_excel("gregory.cotton.xlsx")
dat %>% mutate(yield=yield/100) -> dat

gregory.cotton <- dat

# ----------------------------------------------------------------------------

dat <- gregory.cotton

if(require(dplyr)){
  # Main effect means, Gregory table 2
  dat %>% group_by(year,date) %>% summarise(yield=mean(yield))
  dat %>% group_by(year,spacing) %>% summarise(yield=mean(yield))
  dat %>% group_by(year,water) %>% summarise(yield=mean(yield))
  dat %>% group_by(year,nitrogen) %>% summarise(yield=mean(yield))
}

# Figure 2 of Gregory. Not recommended, but an interesting exercise.
# http://stackoverflow.com/questions/13887365/ggplot2-circular-heatmap-that-looks-like-a-donut
if(require(ggplot2)){
  d1 <- subset(dat, year=="Y1")
  d1 <- transform(d1, grp=factor(paste(date,nitrogen,water,spacing)))
  d1 <- d1[order(d1$grp),] # for angles
  # Rotate labels on the left half 180 deg. First 18, last 18 labels
  d1$ang <- 90+seq(from=(360/nrow(d1))/1.5, to=(1.5*(360/nrow(d1)))-360, length.out=nrow(d1))+80
  d1$ang[1:18] <- d1$ang[1:18] + 180
  d1$ang[55:72] <- d1$ang[55:72] + 180
  # Lables on left half to right-adjusted
  d1$hjust <- 0
  d1$hjust[1:18] <- d1$hjust[55:72] <- 1
  
  gg <- ggplot(d1, aes(x=grp,y=yield,fill=factor(spacing))) +
    geom_col() +
    guides(fill=FALSE) + # no legend for 'spacing'
    coord_polar(start=-pi/2) + # default is to start at top
    labs(title="gregory.cotton 1929",x="",y="",label="") +
    geom_vline(xintercept = seq(1, 72, by=3)-0.5, color="gray", size=.25) + # 72 columns centered on 1:72
    geom_vline(xintercept = seq(1, 72, by=18)-0.5, size=1) + # 72 columns centered on 1:72
    geom_vline(xintercept = seq(1, 72, by=9)-0.5, size=.5) + # 72 columns centered on 1:72
    geom_hline(yintercept=c(1,2,3)) + 
    geom_text(data=d1, aes(x=grp, y=max(yield), label=grp, angle=ang,hjust=hjust), size=2) +
    theme(panel.background=element_blank(),
          axis.title=element_blank(),
          panel.grid=element_blank(),
          axis.text.x=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks=element_blank() )
  print(gg)
  
}
