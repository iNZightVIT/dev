q()


## Set-up
setwd("~/iNZight/iNZight")
library(devtools)

## Load - generic
try(dispose(KK$win), TRUE)
#load_all("~/iNZight/iNZightTools", export_all = FALSE)
load_all("~/iNZight/iNZightPlots", export_all = FALSE)
load_all("~/iNZight/iNZightModules", export_all = FALSE)
load_all(export_all = FALSE)

## Run - generic
KK <- iNZGUI$new()
KK$initializeGui(D <- read.csv("~/iNZight/data/Census at School-500.csv", header = TRUE, comment.char = "#"))

TRUE



#census.at.school.500 <- read.csv("~/iNZight/data/Census at School-500.csv", header = TRUE, comment.char = "#")
#use_data(census.at.school.500)







### --- MAPS MODULE

try(dispose(KK$win), TRUE)
load_all("~/iNZight/iNZightMaps", export_all = FALSE)
load_all("~/iNZight/iNZightModules", export_all = FALSE)
#load_all(export_all = FALSE)
data(gapminder)

KK <- iNZGUI$new()
KK$initializeGui(gapminder)

TRUE


w <- gwindow()
g <- ggroup(cont=w)
gbutton("button", cont=g)
img <- gimage("zoom-in", cont = g)
old_cursor <- getToolkitWidget(img)$getWindow()$getCursor()
cross <- gdkCursorNew("GDK_HAND1")
addHandler(img, "enter-notify-event", handler=function(h,...) {
           getToolkitWidget(img)$getWindow()$setCursor(cross)
           TRUE
           })
addHandler(img, "leave-notify-event", handler=function(h,...) {
           getToolkitWidget(img)$getWindow()$setCursor(old_cursor)
           TRUE
           })











### --- MULTIPLE RESPONSE MODULE
try(dispose(KK$win), TRUE)
#load_all("~/iNZight/iNZightMR", export_all = FALSE)
load_all("~/iNZight/iNZightModules", export_all = FALSE)
#load_all(export_all = FALSE)

KK <- iNZGUI$new()
KK$initializeGui(D <- read.csv("~/iNZight/data/CaS2011_5000.csv", header = TRUE, comment.char = "#"))

TRUE

setwd("~/iNZight/iNZightMR")
census.at.school.5000 <- read.csv("~/iNZight/data/CaS2011_5000.csv", header = TRUE, comment.char = "#")
devtools::use_data(census.at.school.5000)










### --- TIME SERIES MODULE
try(dispose(KK$win), TRUE)
load_all("~/iNZight/iNZightTS", export_all = FALSE)
load_all("~/iNZight/iNZightModules", export_all = FALSE)
load_all(export_all = FALSE)

KK <- iNZGUI$new()
KK$initializeGui(D <- read.csv("~/iNZight/data/time-series/visitorsQ.csv", header = TRUE, comment.char = "#"))

TRUE


setwd("~/iNZight/iNZightTS")
visitorsQ <- read.csv("~/iNZight/data/time-series/visitorsQ.csv", header = TRUE, comment.char = "#")
devtools::use_data(visitorsQ)











### additional data sets

KK$initializeGui(D <- read.csv("~/iNZight/data/FutureLearn/Gapminder.csv", header = TRUE, comment.char = "#"))
KK$initializeGui(D <- read.csv("~/iNZight/data/survey/apiclus2.csv", header = TRUE, comment.char = "#"))



