q()
library(devtools)

pkg <- "~/iNZight/iNZightModules"
document(pkg)
## check(pkg)  ### -- no longer works
 

q()
library(devtools)

pkg <- "~/iNZight/iNZight"
document(pkg)
check_doc(pkg)
check(pkg)

q()
library(devtools)

pkg <- "~/iNZight/iNZightMaps"
document(pkg)
check_doc(pkg)
check(pkg)


q()
library(devtools)

pkg <- "~/iNZight/iNZightMR"
document(pkg)
check_doc(pkg)
check(pkg)



q()
library(devtools)

pkg <- "~/iNZight/iNZightTS"
document(pkg)
load_all(pkg)
check(pkg)


q()
library(devtools)

pkg <- "~/iNZight/iNZightTools"
document(pkg)
check(pkg)
load_all(pkg)








## OLD NAMESPACE:

## export(modelFitting, plot3D, scatterPlotMatrix, allUniPlots, allBivarPlots,
##        iNZightMapMod, iNZightMultiRes)
## import(iNZightRegression, iNZightMR, iNZightTS, iNZightTools, mgcv, survey,
##        barcode, gpairs, iNZightMaps)
## #importMethodsFrom(iNZightMaps, plot)
## #importFrom(iNZightTools, fitModel, fitDesign)
## export(barcode)
