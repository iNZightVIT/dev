q()

setwd("~/iNZight/iNZight")
library(devtools)
load_all("~/iNZight/iNZightMR")

try(dispose(KK$win), TRUE)
load_all("~/iNZight/iNZightPlots")
load_all("~/iNZight/iNZight")
KK <- iNZGUI$new()

KK$initializeGui()

KK$initializeGui(D <- read.csv("~/iNZight/data/Census at School-500.csv",
                               header = TRUE, comment.char = "#"))


KK$initializeGui(D <- read.csv("~/iNZight/data/survey/apiclus2.csv",
                               header = TRUE, comment.char = "#"))

enabled(KK$plotToolbar$menu$menu_list[["Dataset"]][[3]])
KK$plotToolbar$menu$block

KK$initializeGui(D <- read.csv("~/iNZight/data/Census at School-500.csv",
                               header = TRUE, comment.char = "#"))

KK$initializeGui(D2 <- read.csv("~/iNZight/data/FutureLearn/Gapminder.csv",
                               header = TRUE, comment.char = "#"))


names(as.list(KK$ctrlWidget))
names(as.list(KK$ctrlWidget$ctrlGp))
names(as.list(KK$ctrlWidget$V1box))
KK$ctrlWidget$V1box$set_value(KK$ctrlWidget$V1box$get_items()[1])
KK$ctrlWidget$V2box$set_value(KK$ctrlWidget$V2box$get_items()[1])


svalue(KK$ctrlWidget$V1box) <- "height"


