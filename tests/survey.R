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

svymean(~yr.rnd, dstrat)
svyciprop(~yr.rnd, dstrat)


load_all("~/iNZight/iNZightPlots")
getPlotSummary(api99, data = apistrat)
getPlotSummary(api99, design = dstrat)
getPlotSummary(both, design = dstrat)
getPlotSummary(api99, design = dclus1)
getPlotSummary(api99, design = dclus2)


svyquantile(~api99, dstrat, c(0.25, 0.5, 0.75))
svymean(~api99, dstrat)
sqrt(svyvar(~api99, dstrat)[["api99"]])
svytotal(~api99, dstrat)
svyby(~api99, ~both, dclus2, svytotal)[, -1]
svyby(~api99, ~both, dclus2, svyquantile, quantile = c(0.25, 0.5, 0.75), keep.var= FALSE)



load_all("~/iNZight/iNZightPlots")
getPlotSummary(yr.rnd, data = apistrat)
getPlotSummary(yr.rnd, design = dstrat)
getPlotSummary(yr.rnd, both, design = dstrat)


svytotal(~both, design = dstrat)


load_all("~/iNZight/iNZightPlots")
getPlotSummary(api99, api00, g1=both, data = apistrat, trend = c("linear", "quadratic", "cubic"))
getPlotSummary(api99, api00,  g1=both, design = dstrat, trend = c("linear", "quadratic", "cubic"))
getPlotSummary(api99, api00, design = dclus1, trend = c("linear", "quadratic", "cubic"))
getPlotSummary(api99, api00, design = dclus2, trend = c("linear", "quadratic", "cubic"))





load_all("~/iNZight/iNZight")

iNZight(apistrat)
iNZight(apiclus1)
iNZight(apiclus2)
