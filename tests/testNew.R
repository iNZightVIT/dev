library(devtools)

## Install the new versions:
install_git("~/iNZight/iNZight/", branch = "new2")

install_git("~/iNZight/iNZightPlots", branch = "new3")
q()

library(iNZight)
iNZight(read.csv("~/iNZight/data/Census at School-500.csv", header = TRUE, comment.char = "#"))


## Reset to old versons
install_git("~/iNZight/iNZight/")
install_git("~/iNZight/iNZightPlots")
