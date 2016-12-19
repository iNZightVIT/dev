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


## 3. simple summaries
upd()
svymean(~api00, dclus1)
svyvar(~api00, dclus1)
t(SE(svyquantile(~api00, dclus1, c(0.25, 0.5, 0.75), se = TRUE)))
upd()
getPlotSummary(api00, des = dclus1)
getPlotSummary(api00, stype, des = dclus1)


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
getPlotSummary(api00, sch.wide, design = dclus1, summary.type = "inference", inference.type = "conf")

upd()
getPlotSummary(api00, design = dclus1, summary.type = "inference", inference.type = "conf")

svyttest(api00 ~ sch.wide, dclus1
getPlotSummary(api00, sch.wide, design = dclus1, summary.type = "inference", inference.type = "conf")

summary(svyglm(api00 ~ stype, dclus1))
getPlotSummary(api00, stype, design = dclus1, summary.type = "inference", inference.type = "conf")



#### X: NUM
##-- Y: NULL

upd()
test1 <- function(des)
    structure(cbind(rbind(svyquantile(~api00, des, c(0.25, 0.5, 0.75)),
                          SE(svyquantile(~api00, des, c(0.25, 0.5, 0.75), se = TRUE))),
                    mean = rbind(svymean(~api00, des), SE(svymean(~api00, des))),
                    var = rbind(svyvar(~api00, des), SE(svyvar(~api00, des)))),
              .Dimnames = list(c("estimate", "se"), c("25%", "50%", "75%", "mean", "var")))

upd()
getPlotSummary(api00, data = apipop)
getPlotSummary(api00, design = dclus1)
test1(dclus1)



getPlotSummary(api00, g1 = stype, design = dclus1)
getPlotSummary(api00, g1 = stype, design = dclus1, g1.level = "E")
test1(subset(dclus1, stype == "E"))
getPlotSummary(api00, g1 = stype, design = dclus1, g1.level = "H")
test1(subset(dclus1, stype == "H"))
getPlotSummary(api00, g1 = stype, design = dclus1, g1.level = "M")
test1(subset(dclus1, stype == "M"))

upd()
getPlotSummary(api00, g1 = stype, g2 = awards, design = dclus1, g2.level = "_MULTI")
getPlotSummary(api00, g1 = stype, g2 = awards, design = dclus1, g1.level = "E", g2.level = "_MULTI")
test1(subset(dclus1, stype == "E" & awards == "No"))
test1(subset(dclus1, stype == "E" & awards == "Yes"))
getPlotSummary(api00, g1 = stype, g2 = awards, design = dclus1, g1.level = "H", g2.level = "_MULTI")
test1(subset(dclus1, stype == "H" & awards == "No"))
test1(subset(dclus1, stype == "H" & awards == "Yes"))
getPlotSummary(api00, g1 = stype, g2 = awards, design = dclus1, g1.level = "M", g2.level = "_MULTI")
test1(subset(dclus1, stype == "M" & awards == "No"))
test1(subset(dclus1, stype == "M" & awards == "Yes"))



#### X: NUM
##-- Y: CAT

upd()
test2 <- function(des)
    suppressWarnings({
        list(estimate =
                 cbind(svyby(~api00, ~awards, des, svyquantile, quantiles = c(0.25, 0.5, 0.75), ci = TRUE)[,2:4],
                       mean = coef(svyby(~api00, ~awards, des, svymean)),
                       var = coef(svyby(~api00, ~awards, des, svyvar))),
             se =
                 cbind(SE(svyby(~api00, ~awards, des, svyquantile, quantiles = c(0.25, 0.5, 0.75), ci = TRUE)),
                       mean = SE(svyby(~api00, ~awards, des, svymean)),
                       var = SE(svyby(~api00, ~awards, des, svyvar))))
    })


upd()
getPlotSummary(api00, awards, design = dclus1)
test2(dclus1)


getPlotSummary(api00, awards, g1 = stype, design = dclus1)
getPlotSummary(api00, awards, g1 = stype, design = dclus1, g1.level = "E")
test2(subset(dclus1, stype == "E"))
getPlotSummary(api00, awards, stype, g1 = stype, design = dclus1, g1.level = "H")
test2(subset(dclus1, stype == "H"))
getPlotSummary(api00, awards, stype, g1 = stype, design = dclus1, g1.level = "M")
test2(subset(dclus1, stype == "M"))

upd()
getPlotSummary(api00, awards, g1 = stype, g2 = sch.wide, design = dclus1, g2.level = "_MULTI")
getPlotSummary(api00, awards, g1 = stype, g2 = sch.wide, design = dclus1, g1.level = "E", g2.level = "_MULTI")
test2(subset(dclus1, stype == "E" & sch.wide == "No"))
test2(subset(dclus1, stype == "E" & sch.wide == "Yes"))
getPlotSummary(api00, awards, g1 = stype, g2 = sch.wide, design = dclus1, g1.level = "H", g2.level = "_MULTI")
test2(subset(dclus1, stype == "H" & sch.wide == "No"))
test2(subset(dclus1, stype == "H" & sch.wide == "Yes"))
getPlotSummary(api00, awards, g1 = stype, g2 = sch.wide, design = dclus1, g1.level = "M", g2.level = "_MULTI")
test2(subset(dclus1, stype == "M" & sch.wide == "No"))
test2(subset(dclus1, stype == "M" & sch.wide == "Yes"))



#### X: CAT
##-- Y: NULL

upd()
test3 <- function(des)
    rbind(svytable(~awards, des),
          coef(svymean(~awards, des)) * 100,
          SE(svymean(~awards, des)) * 100)
        
upd()
table(apipop$awards)
iNZightPlot(awards, design = dclus1)
getPlotSummary(awards, design = dclus1)
test3(dclus1)

getPlotSummary(awards, g1 = stype, design = dclus1)
getPlotSummary(awards, g1 = stype, design = dclus1, g1.level = "E")
test3(subset(dclus1, stype == "E"))
getPlotSummary(awards, g1 = stype, design = dclus1, g1.level = "H")
test3(subset(dclus1, stype == "H"))
getPlotSummary(awards, g1 = stype, design = dclus1, g1.level = "M")
test3(subset(dclus1, stype == "M"))

upd()
getPlotSummary(api00, awards, g1 = stype, g2 = sch.wide, design = dclus1, g2.level = "_MULTI")
getPlotSummary(api00, awards, g1 = stype, g2 = sch.wide, design = dclus1, g1.level = "E", g2.level = "_MULTI")
test2(subset(dclus1, stype == "E" & sch.wide == "No"))
test2(subset(dclus1, stype == "E" & sch.wide == "Yes"))
getPlotSummary(api00, awards, g1 = stype, g2 = sch.wide, design = dclus1, g1.level = "H", g2.level = "_MULTI")
test2(subset(dclus1, stype == "H" & sch.wide == "No"))
test2(subset(dclus1, stype == "H" & sch.wide == "Yes"))
getPlotSummary(api00, awards, g1 = stype, g2 = sch.wide, design = dclus1, g1.level = "M", g2.level = "_MULTI")
test2(subset(dclus1, stype == "M" & sch.wide == "No"))
test2(subset(dclus1, stype == "M" & sch.wide == "Yes"))









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
