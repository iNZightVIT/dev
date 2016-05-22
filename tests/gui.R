q()


## Set-up
setwd("~/iNZight/iNZight")
library(devtools)
data(gapminder, package = "iNZight")

## Load - generic
try(dispose(KK$win), TRUE)
#load_all("~/iNZight/iNZightTools", export_all = FALSE)
load_all("~/iNZight/iNZightPlots", export_all = FALSE)
#load_all("~/iNZight/iNZightModules", export_all = FALSE)
load_all(export_all = FALSE)
##data(census.at.school.500, package = 'iNZight')
data(gapminder, package = "iNZight")

## Run - generic
KK <- iNZGUI$new()
KK$initializeGui(gapminder) #census.at.school.500)

TRUE


TRUE

### --- MAPS MODULE

try(dispose(KK$win), TRUE)
load_all("~/iNZight/iNZightPlots", export_all = FALSE)
load_all("~/iNZight/iNZightMaps", export_all = FALSE)
load_all("~/iNZight/iNZightModules", export_all = FALSE)
load_all(export_all = FALSE)
data(gapminder)

KK <- iNZGUI$new()
KK$initializeGui(gapminder)

TRUE

try(dispose(w))
w <- gwindow()
g <- gvbox(cont=w)
t <- gedit("Text", cont=g)
addHandlerChanged(t, function(h, ...) gmessage(svalue(h$obj)))
addHandlerBlur(t, function(h, ...) gmessage(svalue(h$obj)))

tbl[1, 1:2] <- glabel("hello")
tbl[2, 1] <- LAB <- glabel("this")
tbl[2, 2] <- VAL <- gcombobox(1:2, editable=TRUE,name="mybox")

VAL$parent


names(as.list(tbl))
tbl$set_items(glabel("hello"), 2, 2)

editable(VAL) <- FALSE
VAL$poss_items <- c("one", "two", "three")
names(as.list(VAL))


tbl$remove_child(VAL)
tbl[2, 2] <- VAL2

tbl$remove_child(VAL2)
tbl[2, 2] <- VAL2

###
btn <- gbutton("", cont=g)
btn$set_icon(system.file("~/iNZight/iNZight/inst/images/graph-plus-transp.gif"))


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
