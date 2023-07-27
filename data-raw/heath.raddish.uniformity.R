# heath.raddish.uniformity.R


# OCR did not work very well.
libs(tesseract)
# Default settings
setwd("c:/x/rpack/agridat/data-done/")
eng = tesseract(options=list(tessedit_char_whitelist="0123456789."))
# Images were screenshots from the book, saved as png.
d1=ocr("heath.raddish1.png", engine=eng)
cat(d1) 

# Values were typed by hand into Excel

dat <- read.csv("heath.raddish.uniformity.csv")
h(dat)
dat <- reshape2::melt(dat, id.var=c("row","col"))
colnames(dat) <- c('row','col','block','yield')
dat$yield <- dat$yield/10

heath.raddish.uniformity <- dat

libs(kw)
kw::agex(heath.raddish.uniformity)

# ----------------------------------------------------------------------------

dat <- heath.raddish.uniformity
libs(desplot)
desplot(yield ~ col*row|block, dat,
        aspect=1,
        main="heath.raddish.uniformity")

# There is a hint of competition as indicated by the
# negative autocorrelation (mostly not significant)
libs(asreml, dplyr)
dat$rowf = factor(dat$row)
dat$colf = factor(dat$col)
dat <- arrange(dat, block, rowf, colf)
m1 <- asreml(yield ~ 1, data=dat,
             rcov= ~ at(block):ar1(rowf):ar1(colf))
lucid::vc(m1)
##            effect component std.error z.ratio constr
## block_B1!variance 1977       300         6.6       P
## block_B1!rowf.cor    0.2533    0.1068    2.4       U
## block_B1!colf.cor    0.0423    0.115     0.37      U
## block_B2!variance 2282       354.6       6.4       P
## block_B2!rowf.cor    0.2592    0.0967    2.7       U
## block_B2!colf.cor   -0.1526    0.1153   -1.3       U
## block_B3!variance 2556       366.2       7         P
## block_B3!rowf.cor   -0.027     0.1096   -0.25      U
## block_B3!colf.cor    0.0729    0.1091    0.67      U
## block_B4!variance 2427       383.5       6.3       P
## block_B4!rowf.cor    0.3473    0.0942    3.7       U
## block_B4!colf.cor   -0.0586    0.1117   -0.53      U

# Indicator for border/interior plants
dat <- mutate(dat,
              inner = row > 1 & row < 10 & col >  1 & col < 10)
# Heath has 5.80 and 9.63 (we assume this is a typo of 9.36)
group_by(dat, inner) %>% summarize(mean=mean(yield, na.rm=TRUE))
# Interior plots are significantly lower yielding
anova(aov(yield ~ block + inner, dat))
# bwplot(yield ~ inner, dat, horiz=0)
