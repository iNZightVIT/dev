q()


## Set-up
setwd("~/iNZight/iNZight")
library(devtools)



## Load - generic
try(dispose(KK$win), TRUE)
#load_all("~/iNZight/gWidgets2RGtk2", export_all = FALSE)
#load_all("~/iNZight/iNZightRegression", export_all = FALSE)
load_all("~/iNZight/iNZightTools", export_all = FALSE)
#load_all("~/iNZight/iNZightTS", export_all = FALSE)
load_all("~/iNZight/iNZightPlots", export_all = FALSE)
load_all("~/iNZight/iNZightModules", export_all = FALSE)
if (! "package:iNZight" %in% search()) load_all(export_all = FALSE)
data(census.at.school.500, package = 'iNZight')
##data(gapminder, package = "iNZight")
##data(api, package="survey")

## Run - generic
KK <- iNZGUI$new()
##KK$initializeGui()
##KK$initializeGui(apiclus2)
KK$initializeGui(census.at.school.500)
##KK$initializeGui(gapminder)

NULL



gt <- gtable(structure(data.frame(c("one", "two"), stringsAsFactors = FALSE), names = "Available Variables"))


NULL
tt <- function(set) {
    with(set, loess(y ~ x, span = 0.7, degree = 1, family="gaussian", na.action = "na.exclude"))
}

pred <- predict(tt(KK$getActiveDoc()$getSettings()), newdata = census.at.school.500$armspan)
length(pred)

head(census.at.school.500$height - pred)
head(residuals(tt(KK$getActiveDoc()$getSettings()), type = ?))


win <- KK$win
wBoots <- gwindow("Performing Bootstrap ...",
                  parent = win, width=350, height=120)
ggBoots <- gvbox(container = wBoots)
ggBoots$set_borderwidth(15)


glabel("hello", container = ggBoots, anchor = c(-1, 0))

win <- KK$win

TRUE

# TO DO: histogram colour by


TRUE

### --- MAPS MODULE

try(dispose(KK$win), TRUE)
load_all("~/iNZight/iNZightPlots", export_all = FALSE)
load_all("~/iNZight/iNZightMaps", export_all = FALSE)
load_all("~/iNZight/iNZightModules", export_all = FALSE)
#load_all(export_all = FALSE)
data(gapminder)

KK <- iNZGUI$new()
##KK$initializeGui(nzquakes)
KK$initializeGui(gapminder)

TRUE

try(dispose(w))
w <- gwindow()
g <- gvbox(cont=w)
tbl <- glayout(cont=g)
#t <- gcombobox(c("Red", "Blue", "magenta"), editable = TRUE)
#t$widget$setSizeRequest(105, -1)
#tbl[1,1] <- t
tbl[1, 1:2] <- glabel("hello")
tbl[2, 1] <- LAB <- glabel("this")
tbl[2, 2] <- VAL <- gcombobox(1:2, editable=TRUE,name="mybox")
tbl[2, 3] <- gedit("hello", editable=TRUE)

tbl[2,]
visible(tbl[2,1:3]) <- TRUE

lapply(tbl[2,1:3], function(h) visible(h) <- FALSE)
lapply(tbl[2,1:3], function(h) visible(h) <- TRUE)


VAL$parent$child_positions

wi <- which(sapply(VAL$parent$child_positions, function(x) identical(VAL, x$child)))
VAL$parent$children[[wi]]


VAL$parent[2,2]




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








setwd("~/iNZight/iNZight")
library(devtools)

### --- TIME SERIES MODULE
try(dispose(KK$win), TRUE)
load_all("~/iNZight/iNZightTS", export_all = FALSE)
load_all("~/iNZight/iNZightModules", export_all = FALSE)
if (! "package:iNZight" %in% search()) load_all(export_all = FALSE)
data("visitorsQ", package = "iNZightTS")

KK <- iNZGUI$new()
KK$initializeGui(visitorsQ)

TRUE


setwd("~/iNZight/iNZightTS")
visitorsQ <- read.csv("~/iNZight/data/time-series/visitorsQ.csv", header = TRUE, comment.char = "#")
devtools::use_data(visitorsQ)











### additional data sets

KK$initializeGui(D <- read.csv("~/iNZight/data/FutureLearn/Gapminder.csv", header = TRUE, comment.char = "#"))
KK$initializeGui(D <- read.csv("~/iNZight/data/survey/apiclus2.csv", header = TRUE, comment.char = "#"))
