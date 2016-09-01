updateDistribution <- function() {

  if (!exists("OS")) OS <- ifelse(.Platform$OS == "windows", "windows", "osx")

  ## UPDATE VERSION NUMBERS AS REQUIRED
  LATEST <- switch(OS,
                   "windows" = 1.0,
                   "osx" = 1.0)

  if (!exists("VERSION")) VERSION <- 0
  if (VERSION < LATEST) {
      utils::download.file(
        sprintf("https://raw.githubusercontent.com/iNZightVIT/dev/master/updateProfile-%s.R", OS),
        ".Rprofile"
      )

      tcltk::tkmessageBox(title = "Rerun Updater", message = "Update script updated - please run the Updater again.",
                          type = "ok", icon = "info")
      return(invisible(NULL))
  }

  if (utils::packageVersion("iNZight") < 3) {
      tcltk::tkmessageBox(message = paste("iNZight 3 is now available for download from",
                                          "\n\nhttps://www.stat.auckland.ac.nz/~wild/iNZight/",
                                          "\n\nThere have been a lot of big changes, so you'll need",
                                          "to redownload iNZight to get it."),
                          title = "iNZight 3.0 Released!", icon = "info", type = "ok")
      return(invisible(NULL))
  }

  cat("==========================================================\n")
  cat("               Checking for updates ...\n")
  cat("==========================================================\n\n")

  ## List any packages added to iNZight after the release
  pkgs <- c("")

  ## --- Update iNZight packages:
  utils::update.packages(repos = "http://r.docker.stat.auckland.ac.nz/R", ask = FALSE)

  ## A list of packages we NEED to have installed (since older versions anyway...)
  pkgs <- pkgs[!pkgs %in% rownames(utils::installed.packages())]
  if (length(pkgs) > 0)
      utils::install.packages(pkgs, repos = "http://cran.stat.auckland.ac.nz")

  ## success message
  cat("==========================================================\n")
  cat("               Updating complete!!\n")
  cat("==========================================================\n\n")
  
  tcltk::tkmessageBox(title = "Update Complete", message = "iNZight is now up to date!", 
                      icon = "info", type = "ok")

  q("no")

  return(invisible(NULL))
}



updateDistribution()
