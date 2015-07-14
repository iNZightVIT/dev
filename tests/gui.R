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


KK$initializeGui(D <- read.csv("~/iNZight/data/survey/apiclus2.csv",
                               header = TRUE, comment.char = "#"))

enabled(KK$plotToolbar$menu$menu_list[["Dataset"]][[3]])
KK$plotToolbar$menu$block

KK$initializeGui(D <- read.csv("~/iNZight/data/Census at School-500.csv",
                               header = TRUE, comment.char = "#"))

KK$initializeGui(D2 <- read.csv("~/iNZight/data/FutureLearn/Gapminder.csv",
                               header = TRUE, comment.char = "#"))





w <- gwindow()
gt <- ggroup(horiz = FALSE, cont = w)
mg <- ggroup(cont = gt)
m <- gmenu(list("A" = list(
                    gaction(label = "Test", handler = function(h, ...) gmessage("click")),
                    gaction(label = "Test", handler = function(h, ...) gmessage("click"))),
                "B" = list(
                    gaction(label = "Test", handler = function(h, ...) gmessage("click")),
                    gaction(label = "Test", handler = function(h, ...) gmessage("click")))
                ),
           cont = mg)


as.list(m)

enabled(m$menu_list$A[[1]]) <- FALSE
