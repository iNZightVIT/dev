## UPDATE VERSION NUMBERS AS REQUIRED
if (!exists("OS")) OS <- ifelse(.Platform$OS == "windows", "windows", "osx")
LATEST <- switch(OS,
                 "windows" = 1.2,
                 "osx" = 2.0)
if (!exists("VERSION")) VERSION <- 0

updateDistribution <- function() {
  # deprecating this updater
  if (OS == "windows") {
    conf <- tcltk::tk_messageBox(
      message = paste(sep = "\n",
        "We've made changes to the way iNZight is updated,",
        "so you'll need to download a copy of the new installer.",
        "",
        "Click OK to go to the website, or cancel to continue using",
        "your current version of iNZight."
      ),
      title = "iNZight Updated",
      icon = "info", 
      type = "okcancel"
    )
    if (conf == "ok") {
      utils::browseURL("https://www.stat.auckland.ac.nz/~wild/iNZight/getinzight.php")
    }
  } else {
    tcltk::tk_messageBox(
      message = paste(sep = "\n",
        "Due to changes to the macOS, we are unable to provide updates for iNZight."
      ),
      title = "iNZight for Mac",
      icon = "info", 
      type = "ok"
    )
  }
  
  invisible(NULL)
}



updateDistribution()
