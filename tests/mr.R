library(devtools)

load_all("~/iNZight/iNZightMR")
data("census.at.school.5000")
census.at.school.5000$agegrp <- iNZightPlots::convert.to.factor(census.at.school.5000$age)

fit <- iNZightMR(tech ~ techinternet + techfacebook + techtwitter+ techskype + techtv,
                 data = census.at.school.5000)

barplotMR(mroPara(fit))

load_all("~/iNZight/iNZightMR")
f1 <- byMRO(fit, ~gender+age, mroPara)
f2 <- byMRO(fit, ~gender+agegrp, mroPara)

barplotMR(f1)
barplotMR(f2)
