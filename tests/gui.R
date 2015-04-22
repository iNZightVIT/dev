q()

setwd("~/iNZight/iNZight")
library(devtools)

load_all("~/iNZight/iNZightPlots")
load_all("~/iNZight/iNZight")
try(dispose(KK$win), TRUE)
KK <- iNZGUI$new()

KK$initializeGui(D <- read.csv("~/iNZight/data/Census at School-500.csv",
                               header = TRUE, comment.char = "#"))

KK$initializeGui(D <- read.csv("~/iNZight/data/FutureLearn/Gapminder-2008.csv",
                               header = TRUE, comment.char = "#"))

KK$initializeGui(D <- read.csv("~/Downloads/NZ_earthquakes2010.csv",
                               header = TRUE, comment.char = "#"))


KK$initializeGui(D <- read.csv("~/Downloads/sampleLoan20072011.csv", header = TRUE))

load_all("~/iNZight/iNZightPlots")
iNZightPlot(loan_amnt, funded_amnt, data = D, colby = mths_since_last_major_derog)

D$mths_since_last_major_derog
