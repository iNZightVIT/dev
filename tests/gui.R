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


try(dispose(w), TRUE)
#load_all("~/iNZight/iNZight")
w <- gwindow()
g <- ggroup(FALSE, cont = w)
m <- gcombobox(c("one", "two", "three"), cont = g)

names(as.list(m))
m$set_items(c("one", "two", "MORE"))
