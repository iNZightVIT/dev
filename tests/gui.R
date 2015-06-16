q()

setwd("~/iNZight/iNZight")
library(devtools)

load_all("~/iNZight/iNZightMR")



load_all("~/iNZight/gWidgets2RGtk2")


#system("cp /home/tell029/R/x86_64-pc-linux-gnu-library/3.1/id.txt ~/iNZight/dev/tests/old_id.txt")

try(dispose(KK$win), TRUE)
load_all("~/iNZight/iNZightPlots")
load_all("~/iNZight/iNZight")
KK <- iNZGUI$new()

KK$initializeGui(D <- read.csv("~/iNZight/data/Census at School-500.csv",
                               header = TRUE, comment.char = "#"))

KK$initializeGui(D <- read.csv("~/iNZight/data/FutureLearn/Gapminder.csv",
                               header = TRUE, comment.char = "#"))



curMenu <- svalue(KK$menubar)
curMenu[["Plot"]] <- list(
    gaction("New", handler = function(h, ...) gmessage("ok")),
    gaction("Close", handler = function(h, ...) gmessage("done."))
    )
svalue(KK$menubar) <- curMenu



########## Test

w <- gwindow()
gtop <- ggroup(FALSE, cont = w)
menugrp <- ggroup(cont = gtop)
men <- list("File" = list(gaction("Open", handler = function(h, ...) gmessage("open."))))
q <- gmenu(men, cont = menugrp)

men2 <- c(svalue(q),
          list("Plot" = list(gaction("Close", handler = function(h, ...) dispose(w)))))
svalue(q) <- men2

men3 <- c(svalue(q)[[1]],
          list("Plot" = list(gaction("Open", handler = function(h, ...) dispose(w)))))
svalue(q) <- men3
