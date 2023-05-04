
# Data already exists, we just add individual factors
dat <- gomez.fractionalfactorial
head(dat)

dat <- mutate(dat,
              a=ifelse(str_detect(trt, "a"), 0, 1),
              b=ifelse(str_detect(trt, "b"), 0, 1),
              c=ifelse(str_detect(trt, "c"), 0, 1),
              d=ifelse(str_detect(trt, "d"), 0, 1),
              e=ifelse(str_detect(trt, "e"), 0, 1),
              f=ifelse(str_detect(trt, "f"), 0, 1) )
head(dat)
str(dat)

write.table(dat,
            file = "c:/drop/rpack/agridat/data/gomez.fractionalfactorial.txt", 
            sep = "\t", row.names = FALSE)
