library(devtools)
data(api, package='survey')

try(dispose(KK$win), TRUE)
load_all("~/iNZight/iNZightModules")
if (! "package:iNZight" %in% search())
    load_all("~/iNZight/iNZight", export_all = FALSE)

KK <- iNZGUI$new()
KK$initializeGui(apiclus1)
KK$getActiveDoc()$dataModel$setDesign(clus1="dnum",wt="pw",fpc="fpc")
iNZightModules::iNZightRegMod$new(KK)
