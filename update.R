updateDistribution <- function() {

  if (!exists("OS")) OS <- ifelse(.Platform$OS == "windows", "windows", "osx")

  LATEST <- switch(OS,
                   "windows" = 1.0,
                   "osx" = 1.0)

  if (!exists("VERSION")) VERSION <- 0

  cat(sprintf("You currently have version %s of the updater. The latest version is %s.\n\n", VERSION, LATEST))

  if (package.version("iNZight") < 3) {
      gWidgets2::gmessage(paste("iNZight 3 is now available for download from",
                                "\n\nhttps://www.stat.auckland.ac.nz/~wild/iNZight/",
                                "\n\nThere have been a lot of big changes, so you'll need",
                                "to redownload iNZight to get it."),
                          title = "iNZight 3.0 Released!")
      return(invisible(NULL))
  }

  cat("==========================================================\n")
  cat("               Checking for updates ...\n")
  cat("==========================================================\n\n")

  ## List any packages added to iNZight after the release
  pkgs <- c("")

  ## --- Update iNZight packages:
  update.packages(repos = "http://r.docker.stat.auckland.ac.nz/R", ask = FALSE)

  ## A list of packages we NEED to have installed (since older versions anyway...)
  pkgs <- pkgs[!pkgs %in% rownames(installed.packages())]
  if (length(pkgs) > 0)
      install.packages(pkgs, repos = "http://cran.stat.auckland.ac.nz")

  ## success message
  cat("==========================================================\n")
  cat("               Updating complete!!\n")
  cat("==========================================================\n\n")

  gWidgets2::gmessage("iNZight has finished updating!", title = "Update Complete")

  q("no")

  return(invisible(NULL))
}



updateDistribution()
