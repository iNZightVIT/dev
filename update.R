## UPDATE VERSION NUMBERS AS REQUIRED
if (!exists("OS")) OS <- ifelse(.Platform$OS == "windows", "windows", "osx")
LATEST <- switch(OS,
                 "windows" = 1.2,
                 "osx" = 2.0)
if (!exists("VERSION")) VERSION <- 0

updateDistribution <- function() {
  if (utils::packageVersion("iNZight") < 3) {
      conf <-
          tcltk::tk_messageBox(message = paste("iNZight 3 is now available for download from our website.",
                                               "\n\nThere have been a lot of big changes, so you'll need",
                                               "to install iNZight again to get them.",
                                               "\n\nDo you want to go to the website now?"),
                               title = "iNZight 3.0 Released!", icon = "info", type = "okcancel")
      if (conf == "ok")
          utils::browseURL("https://www.stat.auckland.ac.nz/~wild/iNZight/getinzight.php")
      q("no")
      return(invisible(NULL))
  }

  if (VERSION < LATEST) {
      if (OS == "osx") {
        if (VERSION >= 2.0 && LATEST < 3.0) {
          ## only need to update .Rprofile until a big update occurs
        } else {
          conf <-
            tcltk::tk_messageBox(message = paste("A new Mac installer has been released.",
                                                 "\nTo update, you'll need to download it and re-install",
                                                 "iNZight. Click OK to go to the website now."),
                                 title = "New iNZight for Mac Installer", icon = "info", type = "okcancel")
          if (conf == "ok")
            utils::browseURL("https://www.stat.auckland.ac.nz/~wild/iNZight/getinzight.php")
          q("no")
          return(invisible(NULL))
        }
      } else {
        utils::download.file(
          "https://raw.githubusercontent.com/iNZightVIT/iNZightVIT-WIN/master/assets/.Rprofile",
          ".Rprofile"
        )
      }

      tcltk::tkmessageBox(title = "Rerun Updater", message = "Update script updated - please run the Updater again.",
                          type = "ok", icon = "info")
      return(invisible(NULL))
  }

  cat("==========================================================\n")
  cat("               Checking for updates ...\n")
  cat("==========================================================\n\n")

  if ("@CRAN@" %in% getOption('repos'))
    options(repos = c(CRAN = "https://cran.rstudio.com"))
  try({
    cat("Updating iNZightVIT for", switch(OS, "windows" = "Windows", "osx" = "Mac"), "\n")
    cat(" * Current version:", as.character(utils::packageVersion("iNZight")), "\n")
    cat(" * Running on", R.version.string, "\n")
    cat(" * Updating packages located in:\n", paste("    -", .libPaths(), collapse = "\n "), "\n")
    cat(" * Update source:\n", paste("    -", getOption("repos"), collapse = "\n "), "\n")
  }, silent = TRUE)


  ## Fetch a list of package versions that are required:
  if (OS == "windows") {
    libz <- .libPaths()
    instlib <- libz[!grepl("modules", libz)][1]
    modlib <- libz[grepl("modules", )][1]

    branch <- "master"
    if ("iNZightMaps" %in% list.files(instlib)) {
      branch <- "master-maps"
    }

    pkgsf <- tempfile()
    utils::download.file(
      sprintf(
        "https://raw.githubusercontent.com/iNZightVIT/iNZightVIT-WIN/%s/packages.txt",
        branch
      ),
      pkgsf
    )
    pkgs <- readLines(pkgsf)
    unlink(pkgsf)

    if (as.numeric(file.access(instlib, mode = 2)) == -1) {
      tcltk::tkmessageBox(title = "Run as admin",
        message = "The updater is unable to write to the package library. Please try running as admin (by right-clicking the updater).",
        type = "ok",
        icon = "error"
      )
      return(invisible(NULL))
    } else {
      # compare versions of these packages:
      ap <- utils::available.packages()
      latestVersions <- ap[pkgs, "Version"]
      currentVersions <- sapply(pkgs, function(pkg) {
        if (!requireNamespace(pkg, quietly = TRUE)) return(NA)
        as.character(utils::packageVersion(pkg))
      })

      pkgs <- cbind(currentVersions, latestVersions)
      pkgs[, "update"] <- apply(pkgs, 1, function(x) {
        !is.na(x[1]) && numeric_version(x[1]) < numeric_version(x[2])
      })
      utils::install.packages(
        rownames(pkgs)[pkgs[, "update"]],
        lib = instlib
      )
    }

    ## update modules directory
    utils::update.packages(
      lib.loc = modlib,
      ask = FALSE
    )

    ## end new windows updater
  } else {

    ## List any packages added to iNZight after the release
    pkgs <- c("RColorBrewer", "hexbin",
              "gridSVG", "jsonlite", "xtable",
              "readr", "readxl", "tibble", "tidyr")
    if (OS == "windows") {
      if (!requireNamespace("hms", quietly = TRUE))
        utils::install.packages('hms', type = 'binary')
      pkgs <- c(pkgs, "RODBC")
    }
    if (OS == "osx") {
      try({
        if (!"Acinonyx" %in% rownames(utils::installed.packages()))
            utils::install.packages("Acinonyx", repos = c("http://rforge.net", "https://cran.rstudio.com"))
      }, TRUE)
    }

    ## --- Update iNZight packages:
    utils::update.packages(repos = "https://r.docker.stat.auckland.ac.nz", ask = FALSE)

    if (!requireNamespace('Rcpp', quietly = TRUE)) {
      utils::install.packages('Rcpp', type = "binary")
      if (!requireNamespace('Rcpp', quietly = TRUE)) {
         tcltk::tkmessageBox(title = "Unable to install dependencies",
                             message = "Unfortunately one of the dependencies could not be installed.\n\nPlease contact inzight_support@stat.auckland.ac.nz",
                             icon = "info", type = "ok")
         stop()
      }
      cat('Successfully installed Rcpp...\n')
    }

    if (OS == "windows") {
      libz <- .libPaths()
      libz <- libz[!grepl("modules", libz)]
      instlib <- libz[1]
      if (as.numeric(file.access(instlib, mode = 2)) == -1) {
        warning("Unable to write to the main package library - will attempt installing additional dependencies elsewhere.\nIf you are unable to run iNZight, you may need to run the installer as Admin.")
        instlib <- .libPaths()[1]
      }
    } else {
      instlib <- .libPaths()[1]
    }

    # pkg versions
    cat(" * checking versions of dependencies\n")
    try({

      pkgdep_v <- list(
        dplyr = "0.8.0"
      )

      for (pkg in names(pkgdep_v)) {
        pv <- utils::packageVersion(pkg)
        cat("   - ", pkg, as.character(pv))
        if ( pv < numeric_version(pkgdep_v[[pkg]]) ) {
          cat(" -> updating to", pkgdep_v[[pkg]])
          utils::install.packages(pkg, repos = "https://cran.rstudio.com", lib = instlib)
        }
        cat("\n")
      }

    }, silent = TRUE)

    ## A list of packages we NEED to have installed (since older versions anyway...)
    pkgs <- pkgs[!pkgs %in% rownames(utils::installed.packages())]
    if (length(pkgs) > 0)
        tryCatch(utils::install.packages(pkgs, repos = "https://cran.rstudio.com", lib = instlib),
                 error = function(e) {
                     cat("Something went wrong trying to install additional dependencies.",
                         "\nTry the updater again, and if the problem continues,",
                         "\n  contact inzight_support@stat.auckland.ac.nz\n\n")
                     cat("The following messages were received: \n", e)
                 },
                 finally = cat("Additional dependencies installed.\n"))
    if (! "FutureLearnData" %in% rownames(utils::installed.packages()) )
        utils::install.packages("FutureLearnData", repos = "https://r.docker.stat.auckland.ac.nz")

    try({
      if (packageVersion('iNZight') == numeric_version(3.2) &&
          grepl("2018-01-24", packageDescription('iNZight')$Built)) {
        install.packages('iNZight', repos = 'https://r.docker.stat.auckland.ac.nz')
      }
    }, silent = TRUE)
  }

  ## success message
  cat("\n==========================================================\n")
  cat("               Updating complete!!\n")
  cat("==========================================================\n\n")

  tcltk::tkmessageBox(title = "Update Complete", message = "iNZight is now up to date!",
                      icon = "info", type = "ok")

  q("no")

  return(invisible(NULL))
}



updateDistribution()
