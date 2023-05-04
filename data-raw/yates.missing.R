
# The yates.missing data already exists, but I am splitting the
# treatments into individual factors

libs(dplyr,stringr)
dat <- yates.missing
dat$trt = casefold(dat$trt)

dat <- mutate(dat,
              n=ifelse(str_detect(trt, "n"), "0", "1"),
              p=ifelse(str_detect(trt, "p"), "0", "1"),
              k=ifelse(str_detect(trt, "k"), "0", "1"))
head(dat)
str(dat)

write.table(dat,
            file = "c:/drop/rpack/agridat/data/yates.missing.txt", 
            sep = "\t", row.names = FALSE)
