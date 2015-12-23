q()

setwd("~/iNZight/iNZight")
library(devtools)

document()

try(dispose(KK$win), TRUE)
load_all(export_all = FALSE)

KK <- iNZGUI$new()
KK$initializeGui(D <- read.csv("~/iNZight/data/Census at School-500.csv", header = TRUE, comment.char = "#"))


load_all("~/iNZight/iNZightMaps")
data(nzquakes)
KK$initializeGui(nzquakes)


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
