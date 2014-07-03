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

des1 <- svydesign(ids=~dnum+snum, fpc=~fpc1+fpc2, data=d4)
des2 <- svydesign(ids=~1, weights=~WTINT2YR, data=d2)


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
iNZightPlot(y = api99, x = api00, design = des1, g1 = sch.wide, g2 = awards, g2.level = "_MULTI")




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
iNZightPlot(height, data = d1, freq = year)


############################################################ X:NUMERIC; Y:FACTOR
upd()
iNZightPlot(height, gender, data = d1)
iNZightPlot(height, gender, data = d1, freq = year)
iNZightPlot(meals, awards, design = des1)

iNZightPlot(height, gender, data = d1, g1 = gender)
iNZightPlot(height, gender, data = d1, freq = year, g1 = gender)
iNZightPlot(meals, awards, design = des1, g1 = awards)


############################################################# X:FACTOR; Y:FACTOR
upd()
iNZightPlot(getlunch, data = d1)
iNZightPlot(getlunch, data = d1, freq = year)
iNZightPlot(awards, design = des1)

iNZightPlot(getlunch, gender, data = d1)
iNZightPlot(getlunch, gender, data = d1, freq = year)
iNZightPlot(awards, both, design = des1)

upd()
iNZightPlot(height, data = d1)
iNZightPlot(gender, data= d1)
iNZightPlot(height, age, data =d1)
iNZightPlot(height, gender, data=d1)
iNZightPlot(gender, height, data=d1, g1 = getlunch)
iNZightPlot(gender, getlunch, data=d1)


upd()
iNZightPlot(height, data = d1, colby = cellsource)
iNZightPlot(gender, data= d1, colby = gender)
iNZightPlot(height, age, data =d1, colby = gender)
iNZightPlot(height, gender, data=d1, colby = gender)
iNZightPlot(gender, height, data=d1, g1 = getlunch, colby=gender)
iNZightPlot(gender, getlunch, data=d1, colby = gender)


upd()
iNZightPlot(height, data = d1, colby = age) -> dummy
iNZightPlot(gender, data= d1, colby = age)
iNZightPlot(height, age, data =d1, colby = age)
iNZightPlot(height, gender, data=d1, colby = age)
iNZightPlot(gender, height, data=d1, g1 = getlunch, colby=age)
iNZightPlot(gender, getlunch, data=d1, colby = age)

iNZightPlot(getlunch, travel, data = d1, g1 = cellsource)



upd()
iNZightPlot(height, data = d1, colby = cellsource, sizeby = year)
iNZightPlot(gender, data= d1, colby = gender, sizeby = cellcost)
iNZightPlot(height, age, data =d1, colby = gender, sizeby = cellcost)


upd()
iNZightPlot(height, data = d1, colby = age)
iNZightPlot(gender, data= d1, colby = age)
iNZightPlot(height, age, data =d1, colby = age)
iNZightPlot(height, gender, data=d1, colby = age)
iNZightPlot(gender, height, data=d1, g1 = getlunch, colby=age)
iNZightPlot(gender, getlunch, data=d1, colby = age)






upd()
d <- d1
iNZightPlot(height, armspan, data = d)
iNZightPlot(height, armspan, sizeby = age, g1 = gender, data = d)
iNZightPlot(height, armspan, g1 = age, sizeby = age, data = d)

upd()
iNZightPlot(height, armspan, data = d, rugs = "xy", LOE = TRUE)
iNZightPlot(height, armspan, data = d, smooth = 0.5)
iNZightPlot(height, armspan, data = d, smooth = 0.5, colby = gender, trend.by = TRUE)
iNZightPlot(height, armspan, data = d, trend = c("linear", "cubic"))
iNZightPlot(height, armspan, data = d, trend = "linear", colby = gender, trend.by = TRUE)
iNZightPlot(height, armspan, data = d, trend = c("linear", "cubic"), bs.inference = TRUE)


upd()
iNZightPlot(height, armspan, data = d, rugs = "xy", LOE = TRUE,
            g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d, smooth = 0.5,
            g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d, smooth = 0.5, colby = gender, trend.by = TRUE,
            g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d, trend = c("linear", "cubic"),
            g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d, trend = "linear", colby = gender, trend.by = TRUE,
            g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d, trend = c("linear", "cubic"), bs.inference = TRUE,
            g1 = gender, g2 = getlunch, g2.level = "_MULTI")



upd()
iNZightPlot(height, gender, data = d, g1 = gender, g2 = getlunch, g2.level = "_MULTI")

upd()
iNZightPlot(height, armspan, data = d1, freq = year)
iNZightPlot(
