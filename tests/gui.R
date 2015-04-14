q()

setwd("~/iNZight/iNZight")
library(devtools)

load_all("~/iNZight/iNZightPlots")
load_all("~/iNZight/iNZight")
try(dispose(KK$win), TRUE)
KK <- iNZGUI$new()
KK$initializeGui(D <- read.csv("~/iNZight/data/Gap Minder Data.csv",
                               header = TRUE, comment.char = "#"))

KK$initializeGui(D <- read.csv("~/iNZight/data/Census at School-500.csv",
                               header = TRUE, comment.char = "#"))



KK$initializeGui(D <- read.csv("~/Downloads/NZ_earthquakes2010.csv",
                               header = TRUE, comment.char = "#"))
