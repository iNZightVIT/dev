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

KK$initializeGui(D2 <- read.csv("~/iNZightg/data/FutureLearn/Gapminder.csv",
                               header = TRUE, comment.char = "#"))


iNZightPlot(api99, api00, data = apistrat, trend = "linear") -> pl
pl




load_all("~/iNZight/iNZightPlots")
iNZightPlot(getlunch, data = D,  inference.type = c("comp", "conf"))
iNZightPlot(getlunch, gender, data = D, zoombars = c(1, 3),  inference.type = c("comp", "conf"))

load_all("~/iNZight/iNZightPlots")
iNZightPlot(Country, data = D2)


