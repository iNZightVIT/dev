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
            #cex.lab = 1.4, cex.axis = 1.5)

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
iNZightPlot(height, data =d1)
iNZightPlot(height, age, data=d1)
iNZightPlot(gender, height, data=d1, g1 = getlunch)
iNZightPlot(gender, getlunch, data=d1)


upd()
iNZightPlot(height, armspan, data = d1, colby = cellsource)
iNZightPlot(height, armspan, data = d1, colby = cellcost)
iNZightPlot(height, armspan, data = d1, colby = age, g1 = age)
iNZightPlot(gender, armspan, data= d1, colby = gender)
iNZightPlot(height, armspan, age, data =d1, colby = gender)
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
#pdf("example-trends.pdf", height = 8, width = 10)
iNZightPlot(height, armspan, data = d, trend = c("linear", "cubic"), colby = getlunch,
            trend.by = TRUE, trend.parallel = FALSE)
iNZightPlot(height, armspan, data = d, trend = c("linear", "cubic"), colby = getlunch,
            trend.by = TRUE, trend.parallel = TRUE)
#dev.off()
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




#################### FULL SUITE OF TESTING:

##### X NUMERIC, Y NUMERIC - SIMPLE, SMALL = SCATTERPLOT
upd()
iNZightPlot(height, armspan, data = d1)
iNZightPlot(height, armspan, data = d1, colby = cellcost)
iNZightPlot(height, armspan, data = d1, colby = cellsource)
iNZightPlot(height, armspan, data = d1, sizeby = cellcost)
iNZightPlot(height, armspan, data = d1, sizeby = cellcost, colby = rightfoot)

upd()
iNZightPlot(height, armspan, data = d1, LOE = TRUE)
iNZightPlot(height, armspan, data = d1, trend = "linear")
iNZightPlot(height, armspan, data = d1, smooth = 0.7)
iNZightPlot(height, armspan, data = d1, quant.smooth = "default")
iNZightPlot(height, armspan, data = d1, colby = cellsource, trend = "linear", trend.by = TRUE)
iNZightPlot(height, armspan, data = d1, colby = cellcost, trend = "linear", trend.by = TRUE)

iNZightPlot(height, armspan, data = d1, alpha = 0.5)
iNZightPlot(height, armspan, data = d1, rugs = "xy")
iNZightPlot(height, armspan, data = d1, fill.pt = "blue")

## --- grouping 1
upd()
iNZightPlot(height, armspan, data = d1, g1 = gender)
iNZightPlot(height, armspan, data = d1, colby = cellcost, g1 = gender)
iNZightPlot(height, armspan, data = d1, colby = cellsource, g1 = gender)
iNZightPlot(height, armspan, data = d1, sizeby = cellcost, g1 = gender)
iNZightPlot(height, armspan, data = d1, sizeby = cellcost, colby = rightfoot, g1 = gender)

iNZightPlot(height, armspan, data = d1, LOE = TRUE, g1 = gender)
iNZightPlot(height, armspan, data = d1, trend = "linear", g1 = gender)
iNZightPlot(height, armspan, data = d1, smooth = 0.7, g1 = gender)
iNZightPlot(height, armspan, data = d1, quant.smooth = "default", g1 = gender)
iNZightPlot(height, armspan, data = d1, colby = cellsource, trend = "linear", trend.by = TRUE, g1 = gender)
iNZightPlot(height, armspan, data = d1, colby = cellcost, trend = "linear", trend.by = TRUE, g1 = gender)

iNZightPlot(height, armspan, data = d1, alpha = 0.5, g1 = gender)
iNZightPlot(height, armspan, data = d1, rugs = "xy", g1 = gender)
iNZightPlot(height, armspan, data = d1, fill.pt = "orange", g1 = gender, col.pt = "magenta")

## --- grouping 2
upd()
iNZightPlot(height, armspan, data = d1, g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d1, colby = cellcost, g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d1, colby = cellsource, g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d1, sizeby = cellcost, g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d1, sizeby = cellcost, colby = rightfoot, g1 = gender, g2 = getlunch, g2.level = "_MULTI")

iNZightPlot(height, armspan, data = d1, LOE = TRUE, g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d1, trend = "linear", g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d1, smooth = 0.7, g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d1, quant.smooth = "default", g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d1, colby = cellsource, trend = "linear", trend.by = TRUE,
            g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d1, colby = cellcost, trend = "linear", trend.by = TRUE,
            g1 = gender, g2 = getlunch, g2.level = "_MULTI")

iNZightPlot(height, armspan, data = d1, alpha = 0.5, g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d1, rugs = "xy", g1 = gender, g2 = getlunch, g2.level = "_MULTI")
iNZightPlot(height, armspan, data = d1, fill.pt = "orange", g1 = gender, col.pt = "magenta",
            g2 = getlunch, g2.level = "_MULTI")

##### X NUMERIC, Y NUMERIC - SIMPLE, LARGE = GRIDPLOT
upd()
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3)

upd()
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, LOE = TRUE)
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, trend = "linear")
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, smooth = 0.7)
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, quant.smooth = "default")

iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, alpha = 0.5)
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, scatter.grid.bins = 100)


## --- grouping 1
upd()
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, g1 = Region)

iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, LOE = TRUE, g1 = Region)
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, trend = "linear", g1 = Region)
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, smooth = 0.7, g1 = Region)
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, quant.smooth = "default", g1 = Region)

iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, alpha = 0.5, g1 = Region)

## --- grouping 2
upd()
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, g1 = Year, g2 = Region, g2.level = "_MULTI")

iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, LOE = TRUE, g1 = Year, g2 = Region, g2.level = "_MULTI")
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, trend = "linear", g1 = Year, g2 = Region, g2.level = "_MULTI")
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, smooth = 0.7, g1 = Year, g2 = Region, g2.level = "_MULTI")
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, quant.smooth = "default",
            g1 = Year, g2 = Region, g2.level = "_MULTI")

iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, alpha = 0.5, g1 = Year, g2 = Region, g2.level = "_MULTI")
iNZightPlot(Life.Expectancy, log10(GDP.per.Capita), data = d3, rugs = "xy", g1 = Year, g2 = Region, g2.level = "_MULTI")




##### X NUMERIC, Y NUMERIC - SIMPLE, SURVEY = GRIDPLOT
upd()
iNZightPlot(BPXSY1, BPXSAR, design = des2)

upd()
iNZightPlot(BPXSY1, BPXSAR, design = des2, LOE = TRUE)
iNZightPlot(RIDAGEYR, BPXSY1, design = des2, trend = c("linear", "quadratic", "cubic"))
iNZightPlot(BPXSY1, BPXSAR, design = des2, smooth = 0.7)
iNZightPlot(BPXSY1, BPXSAR, design = des2, quant.smooth = "default")

iNZightPlot(BPXSY1, BPXSAR, design = des2, alpha = 0.5)
iNZightPlot(BPXSY1, BPXSAR, design = des2, hex.bins = 50)


## --- grouping 1
upd()
iNZightPlot(BPXSY1, BPXSAR, design = des2, g1 = agegp)

iNZightPlot(BPXSY1, BPXSAR, design = des2, LOE = TRUE, g1 = agegp)
iNZightPlot(BPXSY1, BPXSAR, design = des2, trend = "linear", g1 = agegp)
iNZightPlot(BPXSY1, BPXSAR, design = des2, smooth = 0.7, g1 = agegp)
iNZightPlot(BPXSY1, BPXSAR, design = des2, quant.smooth = "default", g1 = agegp)

iNZightPlot(BPXSY1, BPXSAR, design = des2, alpha = 0.5, g1 = agegp)

## --- grouping 2
upd()
iNZightPlot(BPXSY1, BPXSAR, design = des2, g1 = Year, g2 = agegp, g2.level = "_MULTI")

iNZightPlot(BPXSY1, BPXSAR, design = des2, LOE = TRUE, g1 = Year, g2 = agegp, g2.level = "_MULTI")
iNZightPlot(BPXSY1, BPXSAR, design = des2, trend = "linear", g1 = Year, g2 = agegp, g2.level = "_MULTI")
iNZightPlot(BPXSY1, BPXSAR, design = des2, smooth = 0.7, g1 = Year, g2 = agegp, g2.level = "_MULTI")
iNZightPlot(BPXSY1, BPXSAR, design = des2, quant.smooth = "default",
            g1 = Year, g2 = agegp, g2.level = "_MULTI")

iNZightPlot(BPXSY1, BPXSAR, design = des2, alpha = 0.5, g1 = Year, g2 = agegp, g2.level = "_MULTI")
iNZightPlot(BPXSY1, BPXSAR, design = des2, rugs = "xy", g1 = Year, g2 = agegp, g2.level = "_MULTI")
