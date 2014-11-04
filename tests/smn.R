library(devtools)
load_all("~/iNZight/iNZightPlots")

d <- read.csv("~/iNZight/iNZightVIT-WIN/data/FutureLearn/NHANES-1000.csv",
              header = TRUE, comment.char = "#")

d2 <- d[as.numeric(d$AgeDecade) %in% c(3, 4, 5, 6), ]
d2$AgeDecade <- factor(as.character(d2$AgeDecade))

iNZightPlot(x  = d2$RegularMarij,
            y  = d2$Smoke100,
            g1 = d2$AgeDecade,
            g2 = d2$Poverty, g2.level = "_MULTI")


library(iNZight)
iNZight(d)
