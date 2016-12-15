library(survey)
library(devtools)

upd <- function() load_all("~/iNZight/iNZightPlots")

### Start again! Working through http://r-survey.r-forge.r-project.org/survey/example-design.html

## 1. Survey designs
upd()
data(api)
dstrat <- svydesign(id = ~1, strat = ~stype, data = apistrat, fpc = ~fpc)
dclus1 <- svydesign(id = ~dnum, weights = ~pw, data = apiclus1, fpc = ~fpc)
dclus2 <- svydesign(id = ~dnum + snum, fpc = ~fpc1 + fpc2, data = apiclus2)

## 2. Replicate weights
rclus1<-as.svrepdesign(dclus1)

## 3. simple summaries
svymean(~api00, dclus1)
svyvar(~api00, dclus1)
svyquantile(~api00, dclus1, c(0.25, 0.5, 0.75))
getPlotSummary(api00, des = dclus1)


## 4. Subsets
svytotal(~enroll, subset(dclus1, sch.wide == "Yes" & comp.imp == "Yes"))
getPlotSummary(enroll, des = dclus1, g1 = sch.wide, g1.level = "Yes", g2 = comp.imp, g2.level = "Yes")
svyby(~api99, ~stype, dclus1, svymean)
svyby(~api99, ~stype, dclus1, svytotal)
svyby(~api99, ~stype, dclus1, svyvar)
getPlotSummary(api99, stype, des = dclus1)
getPlotSummary(api99, g1 = stype, des = dclus1)


upd()
summary(svyglm(api00 ~ ell, design = dclus2))
getPlotSummary(ell, api00, design = dclus2, trend = "linear", summary.type = "inference")

summary(svyglm(api00 ~ ell, design = subset(dclus2, stype == "E")))
getPlotSummary(ell, api00, design = dclus2, trend = "linear", summary.type = "inference", g1 = stype, g1.level = "E")

upd()
svyttest(api00 ~ sch.wide, dclus1)
svyby(~api00, ~sch.wide, dclus1, svymean, vartype = "ci")

upd()
getPlotSummary(api00, design = dclus1, summary.type = "inference", inference.type = "conf")

svyttest(api00 ~ sch.wide, dclus1)
getPlotSummary(api00, sch.wide, design = dclus1, summary.type = "inference", inference.type = "conf")

summary(svyglm(api00 ~ stype, dclus1))
getPlotSummary(api00, stype, design = dclus1, summary.type = "inference", inference.type = "conf")



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



dclus1 <- svydesign(id = ~dnum, weights = ~pw, data = apiclus1, fpc = ~fpc)
dclus2 <- svydesign(id = ~dnum + snum, fpc = ~fpc1 + fpc2, data = apiclus2)

load_all("~/iNZight/iNZightPlots")
pl <- iNZightPlot(api99, api00, des = dclus1, g1 = awards)

summary(svyglm(api00 ~ api99, des = pl$all$Yes$svy))

getPlotSummary(api99, api00, des = dclus1, g1 = awards, trend = "linear", summary.type = "inference", inference.type = "conf")

des2 <- subset(dstrat, awards == "No")
des3 <- subset(dstrat, awards == "Yes")

summary(svyglm(api00 ~ api99, des = des2))
summary(svyglm(api00 ~ api99, des = des3))


## From here:
library(survey)
library(devtools)
data(api)
dclus1 <- svydesign(id = ~dnum, weights = ~pw, data = apiclus1, fpc = ~fpc)
dstrat <- svydesign(id=~1,strata=~stype, weights=~pw, data=apistrat, fpc=~fpc)

load_all("~/iNZight/iNZightPlots")
iNZightPlot(api99, api00, data = apistrat)
iNZightPlot(api99, api00, des = dstrat)


pl <- iNZightPlot(api99, api00, des = dstrat, g1 = awards)

summary(svyglm(y ~ x, pl$all[[1]]$svy))
summary(svyglm(y ~ x, pl$all[[2]]$svy))


load_all("~/iNZight/iNZightPlots")
iNZightPlot(api99, awards, des = dstrat, hist.bins = 20)
iNZightPlot(api99, des = dstrat, hist.bins = 20, g1 = awards)
