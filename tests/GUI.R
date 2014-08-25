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



tab <- table(d$RegularMarij)
phat <- tab / sum(tab)
tab


tab <- table(d$Education)
phat <- tab / sum(tab)
tab
se <- 1.96 * sqrt(phat * (1 - phat) / sum(tab))
co <- 1.96 * iNZightPlots:::errorbarsize(iNZightPlots:::proportionCovs(tab))

iNZightMR:::moecalc(iNZightMR:::seMNprops(sum(tab), phat), est = phat)[c("compL", "compU")]  # same!
phat - se
phat + se

phat - co
phat + co



iNZightPlot(d$RegularMarij, d$Education,inference.type=c("comp", "conf"))
tab <- t(table(d$RegularMarij, d$Education))
phat <- tab / (N <- rowSums(tab))

1.96 * sqrt(sweep(phat * (1 - phat), 1, N, "/"))
phat + 1.96 * t(apply(tab, 1, function(t)
                      iNZightPlots:::errorbarsize(iNZightPlots:::proportionCovs(t))))
phat - 1.96 * t(apply(tab, 1, function(t)
                      iNZightPlots:::errorbarsize(iNZightPlots:::proportionCovs(t))))

iNZightMR:::moecalc(iNZightMR:::seBinprops(N, phat[, 1]), est = phat[, 1])[c("ses", "compU", "compL")]
iNZightMR:::moecalc(iNZightMR:::seBinprops(N, phat[, 2]), est = phat[, 2])[c("ses", "compU", "compL")]



iNZightPlot(d$Education,d$RegularMarij,inference.type=c("comp", "conf"))
tab <- t(table(d$Education, d$RegularMarij))
phat <- tab / (N <- rowSums(tab))

1.96 * sqrt(sweep(phat * (1 - phat), 1, N, "/"))

t(apply(tab, 1, function(t) iNZightPlots:::errorbarsize(iNZightPlots:::proportionCovs(t))))


do.call(cbind, lapply(1:ncol(tab), function(i)
        iNZightMR:::moecalc(iNZightMR:::seBinprops(N, phat[, i]), est = phat[, i])$ses#[c("ses", "compU", "compL")]
                      )) -> comp.size
phat-1.96*comp.size
phat+1.96*comp.size


lapply(1:ncol(tab), function(i)
       iNZightMR:::moecalc(iNZightMR:::seBinprops(N, phat[, i]), est = phat[, i])[c("compL", "compU")]
       ) -> comp
L <- do.call(cbind, lapply(comp, function(c) c$compL))
U <- do.call(cbind, lapply(comp, function(c) c$compU))


phat-1.96*comp.size
L

phat+1.96*comp.size
U





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
