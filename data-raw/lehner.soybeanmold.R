# lehner.soybeanmold.R
# Time-stamp: <09 Nov 2017 10:26:48 c:/x/rpack/agridat/data-done/lehner.soybeanmold.R>

library(asreml)
library(dplyr)
library(kw)
library(lattice)
library(readxl)
library(readr)
library(reshape2)
library(tibble)

setwd("c:/x/rpack/agridat/data-raw/")
setwd("c:/x/stat/meta/lehner 2016")
dat0 <- read_csv("lehner-white-mold-br.csv")

dat <- dat0
head(dat)
#dat$season <- dat$country <- dat$state <- NULL
dat %>% rename(year=harvest_year, yield=yld, mold=inc, sclerotia=scl, loc=location, elev=elevation,
               trt=treat) %>% 
  mutate(study=paste0("S",pad(study)), trt=paste0("T",pad(trt)), ) %>%
  select(study, year, loc, elev, region, trt, yield, mold, sclerotia) -> dat
                 
library(tidyverse); library(broom); library(tidyr);
library(cowplot); library(tibble); library(knitr); library(nlme); library(lme4)

  lehner.soybeanmold <- dat
# ----------------------------------------------------------------------------

  dat <- lehner.soybeanmold

  \dontrun{
    op <- par(mfrow=c(2,2))
    hist(dat$mold, main="White mold incidence")
    hist(dat$yield, main="Yield")
    hist(dat$sclerotia, main="Sclerotia weight")
    par(op)
  }

  require(lattice)
  xyplot(yield ~ mold|study, dat, type=c('p','r'),
         main="lehner.soybeanmold")
  # xyplot(sclerotia ~ mold|study, dat, type=c('p','r'))

  #libs(tidyr, broom)
  #dat <- dat %>% group_by(study)
#  cors <- lapply(split(dat, dat$study),
#                 FUN=function(X){ unlist(cor.test(X$yield, X$mold)[c('estimate','parameter')]) })
#                 FUN.VALUE=c(0,0))
cors <- split(dat, dat$study)
#cors <- lapply(cors,
#               FUN=function(X){ unlist(cor.test(X$yield, X$mold)[c('estimate','parameter')]) })
cors <- vapply(cors,
               FUN=function(X){ unlist(cor.test(X$yield, X$mold)[c('estimate','parameter')]) },
               c(0,0))
cors <- as.data.frame(t(as.matrix(cors)))

#  cors <- t(as.matrix(cors))
#  cors <- as.data.frame(cors)
cors$study <- rownames(cors)
cors$ni <- cors$parameter.df + 2
  # for each study, calculate correlation.
  # Seriously horrible syntax doesn't work piecewise
  #datcors <- dat %>% 
  #  do(tidy(cor.test( ~ mold + yield, .)))

  # why ???
  dat_yld2 <- filter(dat, row_number() == 1)
  dat_yld3 <-
    full_join(datcors, dat_yld2, by = "study") %>% 
    mutate(n = parameter + 2)  

  # calculate yi vi
  library(metafor)
  #dat_yld3 <- escalc(measure = "ZCOR", ri = estimate, ni = n, data = dat_yld3)
  #datcors %>% mutate(ri = estimate, ni = parameter+2,
  #                   yi = 1/2 * log((1 + ri)/(1 - ri)),
  #                   vi = 1/(ni - 3)) -> datcors
  cors <- transform(cors, ri = estimate.cor)
  cors <- transform(cors,
                    yi = 1/2 * log((1 + ri)/(1 - ri)),
                    vi = 1/(ni - 3))
  #head(dat_yld3)

  # overall fisher's z
  #ma_cor_yld <- rma.uni(yi, vi, method = "ML", data = dat_yld3)
  #summary(ma_cor_yld)
  overall <- rma.uni(yi, vi, method="ML", data=cors)

  ##
  #pred_r <- predict(ma_cor_yld, transf = transf.ztor)
  #pred_r
  pred_r <- predict(overall, transf=transf.ztor)
  
  # forest plot
  #wi    <- 1/sqrt(dat_yld3$vi)
  #size  <- 0.5 + 3.0 * (wi - min(wi))/(max(wi) - min(wi))
  wi    <- 1/sqrt(cors$vi)
  size  <- 0.5 + 3.0 * (wi - min(wi))/(max(wi) - min(wi))

  library(ggplot2)

  ## dat_yld3 %>% 
  ## ggplot(aes(x = study, y = estimate)) + 
  ##   geom_errorbar(aes(ymin = conf.low, ymax = conf.high), color="grey50") + 
  ##   geom_point(aes(size = size), shape = 15, color="grey70") +
  ##   geom_hline(yintercept = pred_r$pred, size=0.75)+ # vertical black line
  ##   geom_hline(yintercept = c(pred_r$cr.lb, pred_r$cr.ub), linetype="dashed")+ 
  ##   coord_flip() +
  ##   scale_y_reverse(limits = c(0.65,-1.2))+
  ##   labs(x = "Slope") + 
  ##   theme_classic() + 
  ##   labs(size = "study weight", 
  ##        title = "White mold vs. soybean yield", 
  ##        y = "Estimated r", x = "Study number (reordered)")

# ----------------------------------------------------------------------------

dat <- lehner.soybeanmold

  \dontrun{
    op <- par(mfrow=c(2,2))
    hist(dat$mold, main="White mold incidence")
    hist(dat$yield, main="Yield")
    hist(dat$sclerotia, main="Sclerotia weight")
    par(op)
  }

  require(lattice)
  xyplot(yield ~ mold|study, dat, type=c('p','r'),
         main="lehner.soybeanmold")
  # xyplot(sclerotia ~ mold|study, dat, type=c('p','r'))

  # could use metafor for forest plot
  if(require(latticeExtra) & require(metafor)){
    # calculate correlation & confidence for each loc
    cors <- split(dat, dat$study)
    cors <- sapply(cors,
                   FUN=function(X){
                     res <- cor.test(X$yield, X$mold)
                     c(res$estimate, res$parameter[1],
                       conf.low=res$conf.int[1], conf.high=res$conf.int[2])
                   })
    cors <- as.data.frame(t(as.matrix(cors)))
    cors$study <- rownames(cors)
    # Fisher Z transform
    cors <- transform(cors, ri = cor)
    cors <- transform(cors, ni = df + 2)
    cors <- transform(cors,
                      yi = 1/2 * log((1 + ri)/(1 - ri)),
                      vi = 1/(ni - 3))
    # Overall correlation
    overall <- metafor::rma.uni(yi, vi, method="ML", data=cors)
    # back transform
    overall <- predict(overall, transf=transf.ztor)

    # weight and size for forest plot
    wi    <- 1/sqrt(cors$vi)
    size  <- 0.5 + 3.0 * (wi - min(wi))/(max(wi) - min(wi))

    segplot(factor(study) ~ conf.low+conf.high, data=cors,
            draw.bands=FALSE, level=size, centers=ri, cex=size,
            col.regions=colorRampPalette(c("gray85", "dodgerblue4")),
            main="White mold vs. soybean yield",
            xlab="Study correlation, confidence, and study weight (blues)\n Overall (black)", ylab="Study ID") +
      layer(panel.abline(v=overall$pred, lwd=2)) +
      layer(panel.abline(v=c(overall$cr.lb, overall$cr.ub), lty=2, col="gray")) 
}

  library(lme4)
  m1 <- lmer(yield ~ mold #
             + (1+mold |study), data=dat)
  summary(m1)
