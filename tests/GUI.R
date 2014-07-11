system("cd ~/iNZight; R CMD INSTALL iNZight iNZightModules"); q()
system("cd ~/iNZight; R CMD INSTALL iNZight"); q()
d <- read.csv("~/iNZight/data/Census at School-500.csv"); library(iNZight); iNZight(d)

d <- read.csv("~/iNZight/iNZightVIT-WIN/data/NZIncomes03_11000.csv")
library(iNZight)
iNZight(d)

d <- read.csv('~/iNZight/data/Census at School-500.csv')
library(iNZightPlots)

pl <- function(...) iNZightPlot(...)
gs <- function(...) getPlotSummary(...)
gi <- function(...) getPlotInference(...)

upd <- function() {
    invisible(lapply(list.files('~/iNZight/iNZightPlots/R', full.names = TRUE),
                     function(x) source(x)))
    library(grid)
    library(s20x)
    library(boot)
}

upd()
pl(d$height, main = "Heights of 500 School Students", xlab = "Height (cm)")
pl(d$height, d$getlunch)
pl(d$height, g1 = d$travel, g2 = d$getlunch, g2.level = "dairy")
pl(d$height, g1 = d$getlunch, g2 = d$gender, g2.level = "female")

upd()
pl(d$highest_qualification, g1 = d$ethnicity, g1.level = "MaoriCombin",
   g2 = d$age_cat, g2.level = 8, inference.type = c("comp", "conf"))





## Manual load
upd <- function() {
    library(gWidgets2RGtk2); library(objectProperties)
    library(grid); library(RGtk2); library(RODBC); library(gdata);
    library(cairoDevice); library(iNZightPlots); library(reshape2)
   # invisible(lapply(list.files('~/iNZight/gWidgets2RGtk2/R', full.names = TRUE),
   #                  function(x) source(x)))
    invisible(lapply(list.files('~/iNZight/iNZightPlots/R', full.names = TRUE),
                     function(x) source(x)))
   # invisible(lapply(list.files('~/iNZight/iNZight/R', full.names = TRUE),
   #                  function(x) source(x)))
    
    source("~/iNZight/iNZightTools/R/newdevice.R")
    
}
upd()
iNZight(d <- read.csv("~/iNZight/data/Census at School-500.csv", header = TRUE))

iNZightPlot(d$height, d$armspan, colby = d$age)
