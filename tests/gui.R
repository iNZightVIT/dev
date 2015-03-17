library(devtools)

load_all("~/iNZight/iNZight")
gui <- iNZGUI$new()
gui$initializeGui(read.csv("~/iNZight/data/Census at School-500.csv",
                           header = TRUE, comment.char = "#"))





library(gWidgets2)
dispose(w); 
