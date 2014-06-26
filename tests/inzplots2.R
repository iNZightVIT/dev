library(grid); library(survey); library(quantreg); library(hexbin)
upd <- function() {
    dd <- "~/iNZight/iNZightPlots/R"
    if (length(list.files(dd, pattern = "*~")) > 0)
        system(paste0("rm ", dd, "/*~"))
    invisible(lapply(list.files(dd, full.names = TRUE), source))
}
data(api)
d1 <- read.csv("~/iNZight/data/Census at School-500.csv")
d2 <- read.csv("~/iNZight/data/nhanes-03-04.chris.csv", header = TRUE)
d3 <- read.csv("~/iNZight/data/Gap Minder Data.csv")
d4 <- apiclus2

des1<-svydesign(id=~dnum+snum, fpc=~fpc1+fpc2, data=d4)
des2 <- svydesign(id=~1, weights=~WTINT2YR, data=d2)


######################################################### X: NUMERIC; Y: NUMERIC
## simple data
upd()
iNZightPlot(y = height, x = armspan, data = d1)
iNZightPlot(y = height, x = armspan, data = d1, g1 = gender)
iNZightPlot(y = height, x = armspan, data = d1, g1 = gender, g2 = getlunch, g2.level = "_MULTI")

## frequency data
upd()
iNZightPlot(y = height, x = armspan, data = d1, freq = year)
iNZightPlot(y = height, x = armspan, data = d1, freq = year, g1 = gender)
iNZightPlot(y = height, x = armspan, data = d1, freq = year, g1 = gender, g2 = getlunch, g2.level = "_MULTI")

## survey data
# - small
upd()
iNZightPlot(y = api99, x = api00, design = des1)
iNZightPlot(y = api99, x = api00, design = des1, g1 = sch.wide)
upd();iNZightPlot(y = api99, x = api00, design = des1, g1 = sch.wide, g2 = awards, g2.level = "_MULTI")[[2]][[1]]




## large simple
upd()
iNZightPlot(y = Life.Expectancy, x = log10(GDP.per.Capita), data = d3)

## large frequency
upd()
iNZightPlot(y = Life.Expectancy, x = log10(GDP.per.Capita), data = d3, freq = Population)

## large survey
upd()
iNZightPlot(y = BPXSAR, x = BPXDAR, design = des2)


############################################################ X:NUMERIC; Y:NULL
upd()
iNZightPlot(meals, data = d4)
iNZightPlot(meals, design = des1)

hist(d4$meals)
