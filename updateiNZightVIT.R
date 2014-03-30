updateDistribution <- function() {
    isOSX <- .Platform$OS.type != "windows" && Sys.info()["sysname"] == "Darwin"
    if (.Platform$OS.type == "windows") {
        Sys.setenv("R_HOME" = file.path(getwd(), "prog_files"))
        .libPaths(file.path(getwd(), "prog_files", "library"))
        isWindows <- TRUE
        isLinux <- FALSE
        OSstring <- "Windows"
        downloadMethod <- getOption("download.file.method", default = "auto")
        utils::setInternet2(TRUE)
        update.ext <- "-WIN"
    } else if (isOSX) {
        isWindows <- FALSE
        isLinux <- FALSE
        .libPaths(Sys.getenv("R_LIBRARIES"))
      # For some reason utils isn't being attached on load
      # so we need to do it explicitly
        library(utils)
        OSstring <- "OSX"
        downloadMethod <- "curl"
        setwd(strsplit(Sys.getenv("R_HOME"), "Library/Frameworks")[[1]][1])
        if (getRversion()$major == 2)
            update.ext <- "-MAC-sl"
        else
            update.ext <- "-MAC"
    } else {
        isWindows <- FALSE
        isLinux <- TRUE
        OSstring <- "Linux"
        downloadMethod <- "wget"
        stop("Updater not supported on this platform")
    }

    uoaCRAN <- structure("http://cran.stat.auckland.ac.nz", names = "CRAN")
    currCRAN <- getOption("repos")
    if (currCRAN["CRAN"] != uoaCRAN) {
        options(repos = uoaCRAN)
        on.exit(options(repos = currCRAN))
    }
    HOMEPAGE <- "https://www.stat.auckland.ac.nz/~wild/iNZight/"
    
  # Need the RCurl package installed (not included by default):
    success <- try(install.packages("RCurl", dependencies = TRUE), TRUE)
    if (inherits(success, "try-error")) {
        if (isOSX) {
            cat("An error has occurred, perhaps a new version of iNZightVIT",
                "is required. Visiting the website now.\n")
            browseURL(HOMEPAGE)
            return()
        }
        library(tcltk)
        retval <-
            tk_messageBox(type = "ok",
                          message =
                   paste0("An error has occurred updating iNZightVIT.\n\n",
                          "Click OK to visit the iNZightVIT website and download a new copy."),
                          caption = "Update iNZightVIT",
                          default = "ok",
                          icon = "error")
        if (retval == "ok")
            browseURL(HOMEPAGE)
        return()
    } else {
        cat(paste("Installed package: RCurl"), "\n")
    }


  # This is now to be used to update OLD updaters:
    updaterLoc <-
        if (isWindows)
            file.path(getwd(), "prog_files", "updateiNZightVIT.R")
        else
            Sys.getenv("R_PROFILE")

    web.updater.url <-
        paste("https://www.stat.auckland.ac.nz/~wild/downloads/iNZight/",
              "updateiNZightVIT", update.ext, ".R", sep = "")

    download.file(web.updater.url, updaterLoc, method = downloadMethod)

    if (isOSX) {
        hrl <- paste(rep("=", options()$width), collapse = "")
        cat(hrl, "\n\n")
        cat("  The latest version of the iNZightVIT updater has been downloaded.\n\n",
            "  You will need to run the updater one more time to complete\n  the necessary updates.\n\n",
            "  Close R and run the updater script again to use it.\n\n", sep = "")
        cat(hrl, "\n")
        return()
    }
    library(tcltk)
    retval <-
        tk_messageBox(type = "ok",
                      message =
                 paste0("A new version of the iNZightVIT updater has been downloaded.\n\n",
                        "You will need to run the updater one more time to complete\n the necessary updates.",
                        "Click OK to close R.\n\nRun the updater script once it has closed."),
                      caption = "Updated iNZightVIT Updater",
                      default = "ok",
                      icon = "info")
    if (retval == "ok")
        return()
}

updateDistribution()
