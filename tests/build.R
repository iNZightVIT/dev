q()
library(devtools)

pkg <- "~/iNZight/iNZightModules"
document(pkg)
check_doc(pkg)
check(pkg)
 

q()
library(devtools)

pkg <- "~/iNZight/iNZight"
document(pkg)
check_doc(pkg)
check(pkg)



## OLD NAMESPACE:

## export(modelFitting, plot3D, scatterPlotMatrix, allUniPlots, allBivarPlots,
##        iNZightMapMod, iNZightMultiRes)
## import(iNZightRegression, iNZightMR, iNZightTS, iNZightTools, mgcv, survey,
##        barcode, gpairs, iNZightMaps)
## #importMethodsFrom(iNZightMaps, plot)
## #importFrom(iNZightTools, fitModel, fitDesign)
## export(barcode)
