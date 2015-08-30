library(survey)
library(devtools)
data(api)

## Variables:
### stype: Elementary / Middle / High School
### dnum: District number
### snum: School number

## Stratified sample:
dstrat <- svydesign(id = ~1, strata = ~stype, weights = ~pw, data = apistrat, fpc = ~fpc)

## One-stage cluster sample:
dclus1 <- svydesign(id = ~dnum, weights = ~pw, data = apiclus1, fpc = ~fpc)

## Two-stage cluster sample:
dclus2 <- svydesign(id = ~dnum + snum, fpc = ~fpc1 + fpc2, data = apiclus2)

load_all("~/iNZight/iNZightPlots")

iNZightPlot(api99, api00, data = apistrat, trend = "linear", bs.inference = TRUE)
iNZightPlot(api99, api00, design = dstrat, trend = "linear", bs.inference = TRUE)
iNZightPlot(api99, api00, design = dclus1, trend = "linear", bs.inference = TRUE)
iNZightPlot(api99, api00, design = dclus2, trend = "linear", bs.inference = TRUE)


iNZightPlot(api99, data = apistrat, inference.par = "mean", inference.type = "conf")
iNZightPlot(api99, design = dstrat, inference.par = "mean", inference.type = "conf")
iNZightPlot(api99, design = dclus1, inference.par = "mean", inference.type = "conf")
iNZightPlot(api99, design = dclus2, inference.par = "mean", inference.type = "conf")


load_all("~/iNZight/iNZightPlots")

iNZightPlot(yr.rnd, data = apistrat, inference.type = "conf")
iNZightPlot(yr.rnd, design = dstrat, inference.type = "conf")
iNZightPlot(yr.rnd, design = dclus1, inference.type = "conf")
iNZightPlot(yr.rnd, design = dclus2, inference.type = "conf")


iNZightPlot(stype, both, data = apistrat, inference.type = "conf")
iNZightPlot(stype, both, design = dstrat, inference.type = "conf")
iNZightPlot(yr.rnd, both, design = dclus1, inference.type = "conf")
iNZightPlot(yr.rnd, both, design = dclus2, inference.type = "conf")




load_all("~/iNZight/iNZight")

iNZight(apistrat)
iNZight(apiclus1)
iNZight(apiclus2)
