q()

setwd("~/iNZight/iNZight")
library(devtools)

load_all("~/iNZight/iNZightMR")



load_all("~/iNZight/gWidgets2RGtk2")



try(dispose(KK$win), TRUE)
load_all("~/iNZight/iNZightPlots")
load_all("~/iNZight/iNZight")
KK <- iNZGUI$new()

KK$initializeGui(D <- read.csv("~/iNZight/data/Census at School-500.csv",
                               header = TRUE, comment.char = "#"))

KK$initializeGui(D <- read.csv("~/iNZight/data/FutureLearn/Gapminder.csv",
                               header = TRUE, comment.char = "#"))



library(survey)
data(api)
D <- as.data.frame(cbind(Cluster = factor(paste(apiclus2$dnum, apiclus2$cnum, sep = "-")), apiclus2))
KK$initializeGui(D)


KK$initializeGui(D <- read.csv("~/Downloads/NZ_earthquakes2010.csv",
                               header = TRUE, comment.char = "#"))


KK$initializeGui(D <- read.csv("~/Downloads/sampleLoan20072011.csv", header = TRUE))



load_all("~/iNZight/iNZightPlots")
iNZightPlot(height, data = D, locate.extreme = c(3, 1), locate.col = "red", highlight = 114)
