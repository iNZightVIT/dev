library(survey)
library(devtools)

upd <- function() load_all("~/iNZight/iNZightPlots")

### Survey designs
data(api)
dstrat <- svydesign(id = ~1, strat = ~stype, data = apistrat, fpc = ~fpc)
dclus1 <- svydesign(id = ~dnum, weights = ~pw, data = apiclus1, fpc = ~fpc)
dclus2 <- svydesign(id = ~dnum + snum, fpc = ~fpc1 + fpc2, data = apiclus2)
##write.csv(apiclus1, "~/Desktop/apiclus1.csv", quote=FALSE, row.names=FALSE)


############## SUMMARIES

#### X: NUM
##-- Y: NULL

upd()
test1 <- function(des)
    structure(cbind(rbind(svyquantile(~api00, des, c(0.25, 0.5, 0.75)),
                          SE(svyquantile(~api00, des, c(0.25, 0.5, 0.75), se = TRUE))),
                    mean = rbind(svymean(~api00, des), SE(svymean(~api00, des))),
                    var = rbind(svyvar(~api00, des), SE(svyvar(~api00, des))),
                    popsize = rbind(svytotal(matrix(rep(1, length(weights(des))), ncol=1), des),
                                    SE(svytotal(matrix(rep(1, length(weights(des))), ncol=1), des)))),
              .Dimnames = list(c("estimate", "se"), c("25%", "50%", "75%", "mean", "var", "popsize")))

upd()
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
                       var = coef(svyby(~api00, ~awards, des, svyvar)),
                       popsize = coef(svytotal(~awards, des))),
             se =
                 cbind(SE(svyby(~api00, ~awards, des, svyquantile, quantiles = c(0.25, 0.5, 0.75), ci = TRUE)),
                       mean = SE(svyby(~api00, ~awards, des, svymean)),
                       var = SE(svyby(~api00, ~awards, des, svyvar)),
                       popsize = SE(svytotal(~awards, des))))
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
getPlotSummary(awards, g1 = stype, g2 = sch.wide, design = dclus1, g2.level = "_MULTI")
getPlotSummary(awards, g1 = stype, g2 = sch.wide, design = dclus1, g1.level = "E", g2.level = "_MULTI")
test3(subset(dclus1, stype == "E" & sch.wide == "No"))
test3(subset(dclus1, stype == "E" & sch.wide == "Yes"))
getPlotSummary(awards, g1 = stype, g2 = sch.wide, design = dclus1, g1.level = "H", g2.level = "_MULTI")
test3(subset(dclus1, stype == "H" & sch.wide == "No"))
test3(subset(dclus1, stype == "H" & sch.wide == "Yes"))
getPlotSummary(awards, g1 = stype, g2 = sch.wide, design = dclus1, g1.level = "M", g2.level = "_MULTI")
test3(subset(dclus1, stype == "M" & sch.wide == "No"))
test3(subset(dclus1, stype == "M" & sch.wide == "Yes"))



#### X: CAT
##-- Y: CAT

upd()
test4 <- function(des)
    list(count = svytable(~convert.to.factor(meals)+awards, des),
         percent = svyby(~awards, ~convert.to.factor(meals), des, svymean)[, 2:3] * 100,
         se = SE(svyby(~awards, ~convert.to.factor(meals), des, svymean)) * 100)
        
upd()
getPlotSummary(awards, convert.to.factor(meals), design = dclus1)
test4(dclus1)

upd()
getPlotSummary(awards, stype, g1 = meals, design = dclus1)
getPlotSummary(awards, convert.to.factor(meals), g1 = stype, design = dclus1, g1.level = "E")
test4(subset(dclus1, stype == "E"))
getPlotSummary(awards, convert.to.factor(meals), g1 = stype, design = dclus1, g1.level = "H")
test4(subset(dclus1, stype == "H"))
getPlotSummary(awards, convert.to.factor(meals), g1 = stype, design = dclus1, g1.level = "M")
test4(subset(dclus1, stype == "M"))

upd()
getPlotSummary(awards, convert.to.factor(meals), g1 = stype, g2 = sch.wide, design = dclus1, g2.level = "_MULTI")
getPlotSummary(awards, convert.to.factor(meals), g1 = stype, g2 = sch.wide, design = dclus1,
               g1.level = "E", g2.level = "_MULTI")
test4(subset(dclus1, stype == "E" & sch.wide == "No"))
test4(subset(dclus1, stype == "E" & sch.wide == "Yes"))
getPlotSummary(awards, convert.to.factor(meals), g1 = stype, g2 = sch.wide, design = dclus1,
               g1.level = "H", g2.level = "_MULTI")
test4(subset(dclus1, stype == "H" & sch.wide == "No"))
test4(subset(dclus1, stype == "H" & sch.wide == "Yes"))
getPlotSummary(awards, convert.to.factor(meals), g1 = stype, g2 = sch.wide, design = dclus1,
               g1.level = "M", g2.level = "_MULTI")
test4(subset(dclus1, stype == "M" & sch.wide == "No"))
test4(subset(dclus1, stype == "M" & sch.wide == "Yes"))




#### X: NUM
##-- Y: NUM

upd()
des <- dclus1
test5 <- function(des)
    list(linear = signif(coef(svyglm(meals ~ api00, des)), 4),
         lincorr = cov2cor(coef(svyvar(meals ~ api00, design = des)))[1,2],
         quadratic = signif(coef(svyglm(meals ~ api00 + I(api00^2), des)), 4),
         cubiv = signif(coef(svyglm(meals ~ api00 + I(api00^2) + I(api00^3), des)), 4),
         rankcorr = cov2cor(coef(svyvar(rank(meals) ~ rank(api00), design = des)))[1,2])
TRENDS <- c("linear", "quadratic", "cubic")

upd()
getPlotSummary(api00, meals, design = dclus1, trend = TRENDS)
test5(dclus1)

upd()
getPlotSummary(api00, meals, g1 = stype, design = dclus1, g1.level = "E", trend = TRENDS)
test5(subset(dclus1, stype == "E"))
getPlotSummary(api00, meals, g1 = stype, design = dclus1, g1.level = "H", trend = TRENDS)
test5(subset(dclus1, stype == "H"))
getPlotSummary(api00, meals, g1 = stype, design = dclus1, g1.level = "M", trend = TRENDS)
test5(subset(dclus1, stype == "M"))

upd()
getPlotSummary(api00, meals, g1 = stype, g2 = sch.wide, design = dclus1, g2.level = "_MULTI", trend = TRENDS)
getPlotSummary(api00, meals, g1 = stype, g2 = sch.wide, design = dclus1,
               g1.level = "E", g2.level = "_MULTI", trend = TRENDS)
test5(subset(dclus1, stype == "E" & sch.wide == "No"))
test5(subset(dclus1, stype == "E" & sch.wide == "Yes"))
getPlotSummary(api00, meals, g1 = stype, g2 = sch.wide, design = dclus1,
               g1.level = "H", g2.level = "_MULTI", trend = TRENDS)
test5(subset(dclus1, stype == "H" & sch.wide == "No"))
test5(subset(dclus1, stype == "H" & sch.wide == "Yes"))
getPlotSummary(api00, meals, g1 = stype, g2 = sch.wide, design = dclus1,
               g1.level = "M", g2.level = "_MULTI", trend = TRENDS)
test5(subset(dclus1, stype == "M" & sch.wide == "No"))
test5(subset(dclus1, stype == "M" & sch.wide == "Yes"))




############## INFERENCE
infpar <- inzpar(summary.type = "inference", inference.type = "conf")

#### X: NUM
##-- Y: NULL

upd()
test1 <- function(des)
    list(mean = cbind(mean = svymean(~api00, des), confint(svymean(~api00, des))),
         ttest1 = svyttest(api00 ~ 0, des))

upd()
getPlotSummary(api00, design = dclus1, summary.type = "inference", inference.type = "conf")
test1(dclus1)


getPlotSummary(api00, g1 = stype, design = dclus1, summary.type = "inference", inference.type = "conf")
getPlotSummary(api00, g1 = stype, design = dclus1, g1.level = "E", summary.type = "inference", inference.type = "conf")
test1(subset(dclus1, stype == "E"))
getPlotSummary(api00, g1 = stype, design = dclus1, g1.level = "H", summary.type = "inference", inference.type = "conf")
test1(subset(dclus1, stype == "H"))
getPlotSummary(api00, g1 = stype, design = dclus1, g1.level = "M", summary.type = "inference", inference.type = "conf")
test1(subset(dclus1, stype == "M"))

upd()
getPlotSummary(api00, g1 = stype, g2 = awards, design = dclus1, g2.level = "_MULTI",
               summary.type = "inference", inference.type = "conf")
getPlotSummary(api00, g1 = stype, g2 = awards, design = dclus1, g1.level = "E", g2.level = "_MULTI",
               summary.type = "inference", inference.type = "conf")
test1(subset(dclus1, stype == "E" & awards == "No"))
test1(subset(dclus1, stype == "E" & awards == "Yes"))
getPlotSummary(api00, g1 = stype, g2 = awards, design = dclus1, g1.level = "H", g2.level = "_MULTI",
               summary.type = "inference", inference.type = "conf")
test1(subset(dclus1, stype == "H" & awards == "No"))
test1(subset(dclus1, stype == "H" & awards == "Yes"))
getPlotSummary(api00, g1 = stype, g2 = awards, design = dclus1, g1.level = "M", g2.level = "_MULTI",
               summary.type = "inference", inference.type = "conf")
test1(subset(dclus1, stype == "M" & awards == "No"))
test1(subset(dclus1, stype == "M" & awards == "Yes"))



#### X: NUM
##-- Y: CAT

upd()
test2 <- function(des)
    list(means = cbind(mean = coef(svyby(~api00, ~awards, des, svymean)),
                          confint(svyby(~api00, ~awards, des, svymean))),
         difference = c(mean = coef(svyglm(api00 ~ awards, des))[2],
                        confint(svyglm(api00 ~ awards, des))[2, ]),
         ttest = svyttest(api00 ~ awards, des))

names(svyglm(api00 ~ stype, des))

upd()
getPlotSummary(api00, stype, design = dclus1, summary.type = "inference", inference.type = "conf")
test2(dclus1)

getPlotSummary(api00, awards, g1 = stype, design = dclus1, summary.type = "inference", inference.type = "conf")
getPlotSummary(api00, awards, g1 = stype, design = dclus1, g1.level = "E",
               summary.type = "inference", inference.type = "conf")
test2(subset(dclus1, stype == "E"))
getPlotSummary(api00, awards, stype, g1 = stype, design = dclus1, g1.level = "H",
               summary.type = "inference", inference.type = "conf")
test2(subset(dclus1, stype == "H"))
getPlotSummary(api00, awards, stype, g1 = stype, design = dclus1, g1.level = "M",
               summary.type = "inference", inference.type = "conf")
test2(subset(dclus1, stype == "M"))

upd()
getPlotSummary(api00, awards, g1 = stype, g2 = sch.wide, design = dclus1, g2.level = "_MULTI",
               summary.type = "inference", inference.type = "conf")
getPlotSummary(api00, awards, g1 = stype, g2 = sch.wide, design = dclus1, g1.level = "E", g2.level = "_MULTI",
               summary.type = "inference", inference.type = "conf")
test2(subset(dclus1, stype == "E" & sch.wide == "No"))
test2(subset(dclus1, stype == "E" & sch.wide == "Yes"))
getPlotSummary(api00, awards, g1 = stype, g2 = sch.wide, design = dclus1, g1.level = "H", g2.level = "_MULTI",
               summary.type = "inference", inference.type = "conf")
test2(subset(dclus1, stype == "H" & sch.wide == "No"))
test2(subset(dclus1, stype == "H" & sch.wide == "Yes"))
getPlotSummary(api00, awards, g1 = stype, g2 = sch.wide, design = dclus1, g1.level = "M", g2.level = "_MULTI",
               summary.type = "inference", inference.type = "conf")
test2(subset(dclus1, stype == "M" & sch.wide == "No"))
test2(subset(dclus1, stype == "M" & sch.wide == "Yes"))



#### X: CAT
##-- Y: NULL

upd()
test3 <- function(des)
    list(estimates = cbind(mean = coef(svymean(~awards, des)),
                           confint(svymean(~awards, des))))
        
upd()
getPlotSummary(awards, design = dclus1, summary.type = "inference", inference.type = "conf")
test3(dclus1)

getPlotSummary(awards, g1 = stype, design = dclus1, summary.type = "inference", inference.type = "conf")
getPlotSummary(awards, g1 = stype, design = dclus1, g1.level = "E",
               summary.type = "inference", inference.type = "conf")
test3(subset(dclus1, stype == "E"))
getPlotSummary(awards, g1 = stype, design = dclus1, g1.level = "H",
               summary.type = "inference", inference.type = "conf")
test3(subset(dclus1, stype == "H"))
getPlotSummary(awards, g1 = stype, design = dclus1, g1.level = "M",
               summary.type = "inference", inference.type = "conf")
test3(subset(dclus1, stype == "M"))

upd()
getPlotSummary(awards, g1 = stype, g2 = sch.wide, design = dclus1, g2.level = "_MULTI",
               summary.type = "inference", inference.type = "conf")
getPlotSummary(awards, g1 = stype, g2 = sch.wide, design = dclus1, g1.level = "E", g2.level = "_MULTI",
               summary.type = "inference", inference.type = "conf")
test3(subset(dclus1, stype == "E" & sch.wide == "No"))
test3(subset(dclus1, stype == "E" & sch.wide == "Yes"))
getPlotSummary(awards, g1 = stype, g2 = sch.wide, design = dclus1, g1.level = "H", g2.level = "_MULTI",
               summary.type = "inference", inference.type = "conf")
test3(subset(dclus1, stype == "H" & sch.wide == "No"))
test3(subset(dclus1, stype == "H" & sch.wide == "Yes"))
getPlotSummary(awards, g1 = stype, g2 = sch.wide, design = dclus1, g1.level = "M", g2.level = "_MULTI",
               summary.type = "inference", inference.type = "conf")
test3(subset(dclus1, stype == "M" & sch.wide == "No"))
test3(subset(dclus1, stype == "M" & sch.wide == "Yes"))



#### X: CAT
##-- Y: CAT

upd()
test4 <- function(des)
    list()

svychisq(~stype+awards, dclus1)$observed
        
upd()
iNZightPlot(awards, convert.to.factor(meals), design = dclus1, summary.type = "inference", inference.type = "conf")
getPlotSummary(awards, convert.to.factor(meals), design = dclus1, summary.type = "inference", inference.type = "conf")
test4(dclus1)

upd()
getPlotSummary(awards, stype, g1 = meals, design = dclus1, summary.type = "inference", inference.type = "conf")
getPlotSummary(awards, convert.to.factor(meals), g1 = stype, design = dclus1, g1.level = "E",
               summary.type = "inference", inference.type = "conf")
test4(subset(dclus1, stype == "E"))
getPlotSummary(awards, convert.to.factor(meals), g1 = stype, design = dclus1, g1.level = "H",
               summary.type = "inference", inference.type = "conf")
test4(subset(dclus1, stype == "H"))
getPlotSummary(awards, convert.to.factor(meals), g1 = stype, design = dclus1, g1.level = "M",
               summary.type = "inference", inference.type = "conf")
test4(subset(dclus1, stype == "M"))

upd()
getPlotSummary(awards, convert.to.factor(meals), g1 = stype, g2 = sch.wide, design = dclus1, g2.level = "_MULTI",
               summary.type = "inference", inference.type = "conf")
getPlotSummary(awards, convert.to.factor(meals), g1 = stype, g2 = sch.wide, design = dclus1,
               g1.level = "E", g2.level = "_MULTI", summary.type = "inference", inference.type = "conf")
test4(subset(dclus1, stype == "E" & sch.wide == "No"))
test4(subset(dclus1, stype == "E" & sch.wide == "Yes"))
getPlotSummary(awards, convert.to.factor(meals), g1 = stype, g2 = sch.wide, design = dclus1,
               g1.level = "H", g2.level = "_MULTI", summary.type = "inference", inference.type = "conf")
test4(subset(dclus1, stype == "H" & sch.wide == "No"))
test4(subset(dclus1, stype == "H" & sch.wide == "Yes"))
getPlotSummary(awards, convert.to.factor(meals), g1 = stype, g2 = sch.wide, design = dclus1,
               g1.level = "M", g2.level = "_MULTI", summary.type = "inference", inference.type = "conf")
test4(subset(dclus1, stype == "M" & sch.wide == "No"))
test4(subset(dclus1, stype == "M" & sch.wide == "Yes"))




#### X: NUM
##-- Y: NUM

upd()
des <- dclus1
test5 <- function(des)
    list()
TRENDS <- c("linear", "quadratic", "cubic")

upd()
getPlotSummary(api00, meals, design = dclus1, trend = TRENDS, summary.type = "inference", inference.type = "conf")
test5(dclus1)

upd()
getPlotSummary(api00, meals, g1 = stype, design = dclus1, g1.level = "E", trend = TRENDS,
               summary.type = "inference", inference.type = "conf")
test5(subset(dclus1, stype == "E"))
getPlotSummary(api00, meals, g1 = stype, design = dclus1, g1.level = "H", trend = TRENDS,
               summary.type = "inference", inference.type = "conf")
test5(subset(dclus1, stype == "H"))
getPlotSummary(api00, meals, g1 = stype, design = dclus1, g1.level = "M", trend = TRENDS,
               summary.type = "inference", inference.type = "conf")
test5(subset(dclus1, stype == "M"))

upd()
getPlotSummary(api00, meals, g1 = stype, g2 = sch.wide, design = dclus1, g2.level = "_MULTI", trend = TRENDS,
               summary.type = "inference", inference.type = "conf")
getPlotSummary(api00, meals, g1 = stype, g2 = sch.wide, design = dclus1,
               g1.level = "E", g2.level = "_MULTI", trend = TRENDS, summary.type = "inference", inference.type = "conf")
test5(subset(dclus1, stype == "E" & sch.wide == "No"))
test5(subset(dclus1, stype == "E" & sch.wide == "Yes"))
getPlotSummary(api00, meals, g1 = stype, g2 = sch.wide, design = dclus1,
               g1.level = "H", g2.level = "_MULTI", trend = TRENDS, summary.type = "inference", inference.type = "conf")
test5(subset(dclus1, stype == "H" & sch.wide == "No"))
test5(subset(dclus1, stype == "H" & sch.wide == "Yes"))
getPlotSummary(api00, meals, g1 = stype, g2 = sch.wide, design = dclus1,
               g1.level = "M", g2.level = "_MULTI", trend = TRENDS, summary.type = "inference", inference.type = "conf")
test5(subset(dclus1, stype == "M" & sch.wide == "No"))
test5(subset(dclus1, stype == "M" & sch.wide == "Yes"))





