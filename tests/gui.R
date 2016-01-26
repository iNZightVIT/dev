q()

## Set-up
setwd("~/iNZight/iNZight")
library(devtools)

## Load - generic
try(dispose(KK$win), TRUE)
load_all("~/iNZight/iNZightModules", export_all = FALSE)
load_all(export_all = FALSE)

## Run - generic
KK <- iNZGUI$new()
KK$initializeGui(D <- read.csv("~/iNZight/data/Census at School-500.csv", header = TRUE, comment.char = "#"))

TRUE











### --- MAPS MODULE

try(dispose(KK$win), TRUE)
#load_all("~/iNZight/iNZightMaps", export_all = FALSE)
load_all("~/iNZight/iNZightModules", export_all = FALSE)
load_all(export_all = FALSE)

KK <- iNZGUI$new()
KK$initializeGui(D <- read.csv("~/iNZight/data/QuakesNZ2000.csv", header = TRUE, comment.char = "#"))

KK$initializeGui()

TRUE














### --- MULTIPLE RESPONSE MODULE
try(dispose(KK$win), TRUE)
load_all("~/iNZight/iNZightMR", export_all = FALSE)
load_all("~/iNZight/iNZightModules", export_all = FALSE)
load_all(export_all = FALSE)

KK <- iNZGUI$new()
KK$initializeGui(D <- read.csv("~/iNZight/data/CaS2011_5000.csv", header = TRUE, comment.char = "#"))

TRUE

















### --- TIME SERIES MODULE
try(dispose(KK$win), TRUE)
load_all("~/iNZight/iNZightTS", export_all = FALSE)
load_all("~/iNZight/iNZightModules", export_all = FALSE)
load_all(export_all = FALSE)

KK <- iNZGUI$new()
KK$initializeGui(D <- read.csv("~/iNZight/data/time-series/visitorsQ.csv", header = TRUE, comment.char = "#"))

TRUE














### additional data sets

KK$initializeGui(D <- read.csv("~/iNZight/data/FutureLearn/Gapminder.csv", header = TRUE, comment.char = "#"))
KK$initializeGui(D <- read.csv("~/iNZight/data/survey/apiclus2.csv", header = TRUE, comment.char = "#"))



