updateDistribution <- function() {
  # Set the CRAN to UoA for updating various packages:
    uoaCRAN <- structure("http://cran.stat.auckland.ac.nz", names = "CRAN")
    currCRAN <- getOption("repos")
    if (currCRAN["CRAN"] != uoaCRAN) {
        options(repos = uoaCRAN)
        on.exit(options(repos = currCRAN))
    }

    wd <- options()$width
    hrl <- paste(rep("=", wd), collapse = "")

  # Mac version is a bit uncooperative:
    if (isOSX) {
        cat("==========================================================\n\n")
        cat("   iNZight will now attempt to update itself.\n\n",
            "  If you do not see an \"Updating complete\" message,\n",
            "  please retry the update. It may take several attempts\n",
            "  on Mac computers, so please be patient.\n\n")
        cat("==========================================================\n\n")
    }

  # Download the versions.csv file from the server:
  # Will use a different versions file for both Mac and Windows so we can explicitely
  # track the version of all packages!
    versionsURL <-
        paste0("https://www.stat.auckland.ac.nz/~wild/downloads/iNZight/versions",
               update.ext, ".txt")
    vertmp <- tempfile()
    con <- file(vertmp, open = "w")
    writeLines(getURL(versionsURL, ssl.verifypeer = FALSE), con)
    close(con)
    #vertmp <- file.choose()  # this is for debugging
    v <- read.csv(vertmp, header = TRUE, stringsAsFactors = FALSE)
    
  # Fix an issue when none of the platforms are specified (will be redundant soon anyway)
    v$Platform <- as.character(v$Platform) 
 	  v$Platform[is.na(v$Platform)] <- "" 

  # Set some other variables:
    HOMEPAGE <- "https://www.stat.auckland.ac.nz/~wild/iNZight/"
    FILE_EXT <- ".zip"
    FILE_TYPE <- "win.binary"

  # -------------------------------------------------------------------------------- #
  # UPDATE UPDATER
  # Now check if the updater is old --- if it is, try to update it:
    newest.updater <- numeric_version(v[1, "Version"])
    if (UPDATER_VERSION < newest.updater) {
      # Using an old updater --- need to attempt to re-download it:
        web.updater.url <-
            paste("https://www.stat.auckland.ac.nz/~wild/downloads/iNZight/",
                  "updateiNZightVIT", update.ext, ".R", sep = "")
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
  # CHECK R VERSION
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
  # UPDATE PACKAGES
  # Now update the necessary packages
  # NOTE: Used to use update.packages() to attempt updating everything, but this
  # was vulnerable to non-compatible releases (e.g., RGtk2 issue with Windows).

    for (i in 1:nrow(v)) {
        r <- v[i, ]
        
      # Fix a bug when package versions are simply "1" or "2" ...
      if (nchar(r$Version) == 1)
        r$Version <- paste0(r$Version, ".0")

      # Check to see if the package is specific to another platform:
        if (OSstring != r$Platform & r$Platform != "")
            next

      # Now see if package needs updating:
        getNewPackage <-
            if (r$Name %in% rownames(installed.packages()))
                package_version(r$Version) > packageVersion(r$Name)
            else
                TRUE

      # If we do need to get an updated package, download it:
        if (getNewPackage) {
          # Only the snow-leopard build can use Acinonyx from rforge.
          # Mavericks must download from iNZight server:
            if (r$Name == "Acinonyx" & !useOldR)
                r$Repository <- "inzight"

            ## ---------------------------------------------------------- CRAN
            if (r$Repository == "cran" | r$Repository == "") {
              # Download the updated package from CRAN
                success <- try(install.packages(r$Name, dependencies = TRUE), TRUE)
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
                    cat(paste("Installed package:", r$Name), "\n")
                }

                ## ---------------------------------------------------------- R-FORGE
            } else if (r$Repository == "rforge") {
              # This is essentially only Acinonyx
                success <- try(install.packages(r$Name, repos = "http://rforge.net"))
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
                    cat(paste("Installed package:", r$Name), "\n")
                }

                ## ---------------------------------------------------------- iNZight
            } else if (r$Repository == "inzight") {
                urlprefix <-
                    sprintf("https://www.stat.auckland.ac.nz/~wild/downloads/iNZight/%s.%s/",
                            getRversion()$major, getRversion()$minor)
                fn <- paste(r$Name, FILE_EXT, sep = "")

              # If OSX, we need to be able to install from zip.
              # Just means we don't verify on install, just unzip to
              # the right directory.
              # **Must have $R_LIBRARIES set in the .command file**
                if (isOSX) {
                    success <- try(installMac(urlprefix, fn))
                    if (inherits(success, "try-error")) {
                        cat("An error has occurred, perhaps a new version of iNZightVIT",
                            "is required, visiting the website now.\n")
                        browseURL(HOMEPAGE)
                        return()
                    } else {
                        cat(paste("Installed package:", r$Name), "\n")
                    }
                } else {
                  # Must be windows:
                    tmploc <- file.path(tempdir(), fn)
                    download.file(paste(urlprefix, fn, sep = ""),
                                  destfile = tmploc, method = downloadMethod)
                    success <- try(install.packages(tmploc, repos = NULL,
                                                    type = FILE_TYPE), TRUE)
                    if (inherits(success, "try-error")) {
                        library(tcltk)
                        retval <- tk_messageBox(type = "ok",
                                                message =
                        paste0("An error has occurred updating iNZightVIT.\n\n",
                               "Click OK to visit the iNZightVIT website and download",
                               "a new copy."),
                                                caption = "Update iNZightVIT",
                                                default = "ok",
                                                icon = "error")
                    if (retval == "ok")
                        browseURL(HOMEPAGE)
                    file.remove(tmploc)
                    return()
                    } else {
                        cat(paste("Installed package:", r$Name), "\n")
                    }
                }
            } else {
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
            }
        }
    }


    cat("==========================================================\n\n")
    cat("                    Updating complete.\n\n")
    cat("==========================================================\n\n")

    Sys.sleep(3)
}

installMac <- function(urlprefix, fn) {
    fileurl <- paste(urlprefix, fn, sep = "")
    filepath <- file.path(getwd(), fn)
  # Download
    download.file(fileurl, filepath, method = downloadMethod)
  # "Install" -- just unzipping a precompiled binary
    system(sprintf("unzip -oq %s -d %s", filepath, Sys.getenv("R_LIBRARIES")))
  # Remove
    file.remove(filepath)

    return(invisible(NULL))
}
