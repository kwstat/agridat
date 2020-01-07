# Lillemo wheat data

dat <-rbind(c(4.0,3.5,3.0,0.1,3.0,3.0,2.0,9.0,3.0,3.0,13.0,11.0,35.0,11.0,16.3,7.0,15.0),
            c(2.5,4.5,3.0,1.1,3.0,3.0,5.0,0.5,2.0,3.0,0.3,3.5,7.5,4.5,5.0,2.5,12.5),
            c(3.5,5.5,0.5,0.6,5.0,4.0,2.5,5.0,2.0,2.0,18.3,12.5,12.5,3.0,25.0,10.0,12.5),
            c(4.5,3.0,0.5,1.1,6.0,5.0,12.5,2.5,4.0,5.0,10.0,2.0,7.5,15.0,8.7,2.0,20.0),
            c(4.0,3.5,2.0,3.0,3.0,30.0,10.0,27.5,6.0,4.0,5.7,19.0,22.5,7.5,8.3,7.0,20.0),
            c(4.0,2.5,0.5,4.5,5.0,20.0,7.5,10.0,4.0,4.0,6.7,15.0,15.0,10.0,14.0,8.5,20.0),
            c(0.5,4.0,3.0,1.0,6.0,15.0,7.5,9.0,4.0,4.0,17.3,19.0,15.0,11.0,30.0,16.0,15.0),
            c(6.5,6.0,1.0,12.5,6.0,30.0,37.5,24.0,7.0,5.0,11.7,12.5,30.0,15.0,13.0,8.0,17.5),
            c(0.5,4.0,0.0,1.3,4.0,5.0,2.5,5.0,2.0,2.0,4.0,9.0,7.5,5.0,21.7,5.0,10.0),
            c(2.0,2.5,1.0,0.6,4.0,15.0,4.0,5.5,3.0,2.0,5.0,9.0,10.0,7.5,15.0,4.0,12.5),
            c(2.5,6.0,3.0,1.5,4.0,15.0,17.5,7.5,3.0,4.0,33.3,17.5,25.0,7.5,18.3,17.5,20.0),
            c(3.5,5.5,3.0,2.5,6.0,10.0,27.5,12.5,5.0,7.0,20.7,21.0,30.0,12.5,28.3,13.5,27.5),
            c(4.5,5.5,4.0,1.6,6.0,30.0,27.5,14.0,4.0,2.0,6.7,22.5,35.0,20.0,14.0,17.5,30.0),
            c(3.0,4.5,3.0,9.0,6.0,20.0,27.5,22.5,8.0,6.0,4.7,18.5,32.5,27.5,28.3,15.0,30.0),
            c(5.0,4.5,0.5,0.1,5.0,5.0,12.5,17.5,8.0,5.0,9.3,22.5,7.5,10.0,19.0,13.5,22.5),
            c(1.0,4.5,0.5,0.6,5.0,5.0,4.5,10.0,3.0,3.0,2.7,16.5,15.0,5.0,18.3,12.5,22.5),
            c(4.0,5.0,0.0,0.2,6.0,6.0,10.0,1.5,4.0,5.0,9.7,12.0,25.0,5.0,21.7,9.0,35.0),
            c(5.5,6.0,3.0,3.0,6.0,40.0,17.5,2.5,7.0,6.0,16.7,13.5,20.0,13.5,16.7,17.5,20.0),
            c(2.5,5.5,3.0,0.1,5.0,10.0,3.5,8.0,3.0,4.0,7.3,11.0,17.5,5.0,16.7,8.0,15.0),
            c(4.5,5.5,2.0,2.5,6.0,40.0,3.5,15.5,8.0,5.0,7.3,12.0,12.5,7.5,20.0,6.5,12.5),
            c(2.5,4.5,1.0,0.8,5.0,3.0,2.0,5.0,3.0,4.0,11.0,10.0,7.5,10.0,19.0,6.5,10.0),
            c(4.0,2.5,1.0,7.0,6.0,15.0,1.0,7.5,3.0,3.0,28.3,22.5,22.5,17.5,35.0,11.0,32.5),
            c(7.5,7.5,4.0,25.0,7.0,40.0,65.0,65.0,9.0,9.0,51.7,70.0,55.0,85.0,70.0,50.0,80.0),
            c(8.0,7.5,2.0,25.0,7.0,60.0,85.0,66.0,9.0,9.0,46.7,60.0,45.0,75.0,70.0,40.0,65.0))

dimnames(dat) <-list(c("G1","G2","G3","G4","G5","G6","G7","G8","G9","G10",
                       "G11","G12","G13","G14", "G15","G16","G17","G18","G19",
                       "G20","G21","G22","G23","G24"),
                     #c("E1","E2","E3","E4", "E5","E6","E7", "E8", "E9","E10",
                     #  "E11", "E12","E13","E14", "E15","E16","E17"))
                     c("Bj03","Bj05","CA03","Ba04", "Ma04","Kh06","Gl05", "BT06", "Ch04","Ce04",
                       "Ha03", "Ha04","Ha05","Ha07", "Aa03","Aa04","Aa05"))
require(reshape2)
dat <- melt(dat)
names(dat) <- c('gen','env','score')
dat$scale <- c("0-9","0-9","0-5","%", "0-9","%","%", "%", "1-9","1-9",
                       "%", "%","%","%", "%","%","%")[match(dat$env,
                    c("Bj03","Bj05","CA03","Ba04", "Ma04","Kh06","Gl05", "BT06", "Ch04","Ce04",
                      "Ha03", "Ha04","Ha05","Ha07", "Aa03","Aa04","Aa05"))]

lillemo.wheat <- dat

# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------

dat <- lillemo.wheat

# Interesting look at different measurement scales by environment
require(lattice)
qqmath(~score|env, dat, group=scale,
       as.table=TRUE, scales=list(y=list(relation="free")),
       auto.key=list(columns=4),
       main="lillemo.wheat - QQ plots by environment")

\dontrun{
# Change data to matrix format
require(reshape2)
datm <- acast(dat, gen~env, value.var='score')

# Environment means. Matches Lillemo Table 3
apply(datm, 2, mean)

# Various transforms within envts to approximate 0-9 scale
datt <- datm
datt[,3] <- 1.8 * datt[,3]
datt[,c(4,6:8,11:17)] <- apply(datt[,c(4,6:8,11:17)],2,sqrt)

# Genotype means of transformed data. Matches Lillemo table 3.
round(rowMeans(datt),2)

# Biplot of transformed data like Lillemo Fig 2
require(gge)
biplot(gge(datt, scale=FALSE), title="lillemo.wheat")

# Median polish of transformed table
m1 <-medpolish(datt)
# Half-normal prob plot like Fig 1
require(faraway)
halfnorm(abs(as.vector(m1$resid)))

# Plot matrix of residuals
library(reshape2)
res1 <-as.matrix(m1$residuals)
res1 <- melt(res1)
library(ggplot2)
fig <- ggplot(res1, aes(Var1, Var2)) +
  geom_tile(aes(fill = value)) +
  scale_fill_gradient2(low="yellow", high="red", mid="white", midpoint=0)
fig + xlab("") + ylab("") + ggtitle("lillemo.wheat - medpolish residuals") +
  geom_text(aes(Var1, Var2, label=round(res1$value,1)), size=2.5) +
  coord_flip()

# Nonparametric stability

# Lillemo table 4, Mean rank
apply(apply(datm, 2, rank),1,mean)

# Table 4. Huhn non-parametric S1
huhn1 <- function(mat){
  # Gen in rows, Env in cols  
  nenv <- ncol(mat)
  # Ranks in each environment
  rmat <- apply(mat, 2, rank)
  gfun <- function(x){
    oo <- outer(x,x,"-")
    sum(abs(oo))
  }
  apply(rmat, 1, gfun)/(nenv*(nenv-1))
}
round(huhn1(datm),2) # Most numbers match Lillemo Table 4 column S1

# Table 4. Huhn non-parametric S2
huhn2 <- function(mat){
  # Gen in rows, Env in cols  
  nenv <- ncol(mat)
  # Ranks in each environment
  rmat <- apply(mat, 2, rank)

  mnrnk <- apply(rmat, 1, mean) # mean rank
  apply((rmat-mnrnk)^2,1,sum)/(nenv-1)
}
round(huhn2(datm),2) # Most match Lillemo

} # dontrun
