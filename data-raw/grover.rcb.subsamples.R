
tiller <- c(31, 46, 41, 42, 48, 65, 55, 60, 77,
            24, 44, 46, 48, 66, 60, 42, 58, 65,
            26, 35, 60, 41, 57, 55, 67, 55, 77,
            20, 45, 48, 52, 50, 41, 51, 47, 45,
            25, 60, 47, 67, 48, 53, 44, 42, 52,
            23, 58, 38, 63, 74, 49, 48, 55, 45,
            26, 40, 41, 74, 53, 57, 74, 66, 43,
            31, 44, 68, 51, 48, 52, 55, 62, 50,
            33, 68, 50, 78, 54, 72, 78, 44, 66,
            25, 62, 46, 58, 40, 55, 50, 55, 57,
            34, 60, 53, 72, 47, 44, 77, 62, 55,
            22, 60, 52, 71, 60, 53, 51, 72, 59,
            38, 38, 49, 55, 52, 61, 70, 66, 51,
            40, 55, 63, 39, 50, 55, 78, 75, 53,
            39, 38, 55, 50, 38, 44, 68, 82, 48,
            27, 62, 71, 60, 74, 50, 78, 64, 47)

dat <- data.frame(tiller=tiller,
                   trt=c("T1","T2","T3","T4","T5","T6","T7","T8","T9"),
                   block=rep(c("R1","R2","R3","R4"), each=36),
                   unit=rep(c("S1","S2","S3","S4"), each=9))
sum(dat$tiller) # 7594 # matches book
grover.rcb.subsample <- dat

# Fixed-effects ANOVA. Matches Grover page 86.
anova(aov(tiller ~ block + trt + block:trt, data=dat))

An experiment on rice with 9 fertilizer treatments in 4 blocks, 4 hills per plot. The response variable is tiller count (per hill). The hills are sampling units.
