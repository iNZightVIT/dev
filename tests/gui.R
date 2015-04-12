q()

library(devtools)
load_all("~/iNZight/iNZightPlots")
load_all("~/iNZight/iNZight")
gui <- iNZGUI$new()
#gui$initializeGui(D <- read.csv("~/iNZight/data/Census at School-500.csv",
#                                header = TRUE, comment.char = "#"))
gui$initializeGui(D <- read.csv("~/iNZight/data/Gap Minder Data.csv",
                                header = TRUE, comment.char = "#"))
