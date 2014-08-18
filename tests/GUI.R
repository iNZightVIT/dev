system("cd ~/iNZight; ~/R-3.0.2/bin/R CMD INSTALL iNZightPlots"); q()


system("cd ~/iNZight; R CMD INSTALL iNZight iNZightPlots"); q()


system("cd ~/iNZight; R CMD INSTALL iNZightPlots"); q()
#d <- read.csv("~/iNZight/data/Census at School-500.csv"); library(iNZightPlots)
d <- read.csv("~/Downloads/NHANES-1000.csv", header=T); library(iNZightPlots)


# Tests
ff <- function(x, y = NULL, g1 = NULL, g2 = NULL, g2.level = "_MULTI")
    iNZightPlot(x, y, g1 = g1, g2 = g2, g2.level = g2.level, inference.type = c("comp", "conf"))

ff(d$Education)
ff(d$Education, d$Gender)
ff(d$Education, d$AgeDecade)
ff(d$Education, d$Gender, d$AgeDecade)
ff(d$Education, d$AgeDecade, d$Gender)

ff(d$RegularMarij)
ff(d$RegularMarij, d$Smoke100)
ff(d$RegularMarij, d$Smoke100, d$AgeDecade)
ff(d$AgeFirstMarij, d$AgeDecade)






tab <- t(table(d$RegularMarij, d$Education))
phat <- tab / (N <- rowSums(tab))

sqrt(phat[, 1] * (1 - phat[, 1])) / N
sqrt(phat[, 2] * (1 - phat[, 2])) / N




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
upd <- function(all = FALSE) {
    library(gWidgets2RGtk2); library(objectProperties); library(gWidgets2)
    library(grid); library(RGtk2); library(RODBC); library(gdata);
    library(cairoDevice); library(iNZightPlots); library(reshape2); library(survey)
    if (all)
        invisible(lapply(list.files('~/iNZight/gWidgets2RGtk2/R', full.names = TRUE),
                         function(x) source(x)))
    invisible(lapply(list.files('~/iNZight/iNZightPlots/R', full.names = TRUE),
                     function(x) source(x)))
    invisible(lapply(list.files('~/iNZight/iNZight/R', full.names = TRUE),
                     function(x) source(x)))
    
    source("~/iNZight/iNZightTools/R/newdevice.R")
    
}
upd()
iNZight(d <- read.csv("~/iNZight/data/Census at School-500.csv", header = TRUE))

iNZightPlot(d$height, d$armspan, colby = d$age, inpar = inzPlotDefaults())

iNZightPlot(height, armspan, data = d, quant.smooth = 0.5, xlab = "hello")
