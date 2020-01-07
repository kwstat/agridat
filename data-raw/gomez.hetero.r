# gomez.hetero.r
# Time-stamp: <19 Nov 2016 20:28:34 c:/x/rpack/agridat/data-done/gomez.hetero.r>

lib(kw)
lib(reshape2)

dat <- data.frame(gen=paste("G",pad(1:35),sep=""),
                  group=c(rep("hybrid",15),rep("parent",17),rep("check",3)),
                  R1=c(8171,7049,8067,7855,8815,7211,6557,7999,9310,7372,7142,8265,7413,7130,7089,5832,7619,8427,7311,6010,6514,7832,7914,7448,7014,6375,7042,5998,7175,7425,7453,7073,7235,6984,7185)/1000,
                  R2=c(7951,7792,8597,7601,8259,8115,8388,8701,8310,8198,6980,9097,8807,7990,8543,5671,5580,8327,6984,7124,7366,7251,7994,7808,8799,7716,6531,6888,7756,7531,7568,8244,7362,7723,6958)/1000,
                  R3=c(8074,7626,6772,7273,7621,8488,6895,8253,9194,8246,8653,8514,10128,8088,7893,6042,8488,7065,7240,6536,7240,7116,7519,7327,7301,6590,6699,6926,7528,7091,7607,6839,7445,7735,7417)/1000)

dat <- melt(dat)
names(dat) <- c('gen','group','rep','yield')

# Check range
apply(dat[,3:5], 1, function(x) diff(range(x)))

gomez.heteroskedastic <- dat
# ----------------------------------------------------------------------------

data("gomez.heteroskedastic")
dat <- gomez.heteroskedastic

# Fix the outlier as reported by Gomez p. 311
dat[dat$gen=="G17" & dat$rep=="R2","yield"] <- 7.58

m1 <- lm(yield ~ rep + gen, data=dat)
anova(m1)
