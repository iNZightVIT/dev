q()

setwd("~/iNZight/iNZight")
library(devtools)

load_all("~/iNZight/iNZightMR")



load_all("~/iNZight/gWidgets2RGtk2")
library(survey); data(api)

#system("cp /home/tell029/R/x86_64-pc-linux-gnu-library/3.1/id.txt ~/iNZight/dev/tests/old_id.txt")

try(dispose(KK$win), TRUE)
load_all("~/iNZight/iNZightPlots")
load_all("~/iNZight/iNZight")
KK <- iNZGUI$new()


KK$initializeGui(D <- read.csv("~/iNZight/data/Census at School-500.csv",
                               header = TRUE, comment.char = "#"))

KK$initializeGui(D <- read.csv("~/iNZight/data/FutureLearn/Gapminder.csv",
                               header = TRUE, comment.char = "#"))


iNZightPlot(api99, api00, data = apistrat, trend = "linear") -> pl
pl
