updateDistribution <- function() {
  # Set the CRAN to UoA for updating various packages:
    uoaCRAN <- structure("http://cran.stat.auckland.ac.nz", names = "CRAN")
    currCRAN <- getOption("repos")
    if (currCRAN["CRAN"] != uoaCRAN) {
        options(repos = uoaCRAN)
        on.exit(options(repos = currCRAN))
    }

  # Download the versions.csv file from the server:
    versionsURL <- "https://www.stat.auckland.ac.nz/~wild/downloads/iNZight/versions.txt"
    vertmp <- tempfile()
    con <- file(vertmp, open = "w")
    writeLines(getURL(versionsURL, ssl.verifypeer = FALSE), con)
    close(con)
    v <- read.csv(vertmp, header = TRUE, stringsAsFactors = FALSE)

    print(v)
    return()

  # Set some other variables:
    HOMEPAGE <- "https://www.stat.auckland.ac.nz/~wild/iNZight/"
    FILE_EXT <- ".zip"
    FILE_TYPE <- "win.binary"

  # -------------------------------------------------------------------------------- #
  #                                                                   UPDATE UPDATER
  # Now check if the updater is old --- if it is, try to update it:
    newest.updater <- numeric_version(v[1, "Version"])
    if (UPDATER_VERSION < newest.updater) {
      # Using an old updater --- need to attempt to re-download it:
        web.updater.url <-
            paste("https://www.stat.auckland.ac.nz/~wild/downloads/iNZight/",
                  v[1, "Name"], "update.ext", ".R", sep = "")
        download.file(web.updater.url, updater.location, method = downloadMethod)

        if (isOSX) {
            cat("A new version of the iNZightVIT updater has been downloaded.\n\n",
                "Close R and run the updater script again to use it.\n")
            return()
        }
        library(tcltk)
        retval <-
            tk_messageBox(type = "ok",
                          message =
              paste0("A new version of the iNZightVIT updater has been downloaded\n\n",
                     "Click OK to close R.\n\nRun the updater script once it has closed."),
                          caption = "Updated iNZightVIT Updater",
                          default = "ok",
                          icon = "info")
        if (retval == "ok")
            return()
    }

  # Remove the updater check row from versions file:
    v <- v[-1, ]

  # -------------------------------------------------------------------------------- #
  #                                                                  CHECK R VERSION
    R.rowv <- v$Version[v$Name == "R"]
    if (getRversion() < R.rowv & !useOldR) {
      # Need to download the latest version of iNZightVIT with a new version of R
        if (isOSX) {
            cat("A new release of iNZightVIT is required, visiting the website now.\n")
            browseURL(HOMEPAGE)
            return()
        }
        library(tcltk)
        retval <-
            tk_messageBox(type = "ok",
                          message =
                paste0("A new release of iNZightVIT is required.\n\n",
                       "Click OK to visit the iNZightVIT website and download a new copy."),
                          caption = "Update iNZightVIT",
                          default = "ok",
                          icon = "info")
        if (retval == "ok")
            browseURL(HOMEPAGE)
        return()
    }

  # Remove R versions from versions
    v <- v[v$Name != "R", ]


  # -------------------------------------------------------------------------------- #
  #                                                                  UPDATE PACKAGES
  # Now update the necessary packages
  # NOTE: Used to use update.packages() to attempt updating everything, but this
  #       was vulnerable to non-compatible releases (e.g., RGtk2 issue with Windows).

    for (i in 1:nrow(v)) {
        r <- v[i, ]
    }
}
