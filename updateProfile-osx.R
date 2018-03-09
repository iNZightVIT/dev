## Version of this .Rprofile
VERSION <- 2.0

width <-getOption('width')
center <- function(...) {
    msg <- paste(...)

    paste0(paste0(rep(" ", floor(0.5 * (width - nchar(msg)))), collapse = ""), msg)
}
rule <- function() cat(rep("=", width), "\n\n", sep = "")

## set library path
LIB <- file.path(Sys.getenv('APPDIR'), ".library")
.libPaths(LIB)
repo <- c("http://r.docker.stat.auckland.ac.nz/R",
          "https://cran.rstudio.com")
options(repos = repo)

## Don't ask user to compile from source .. just do it!
options(install.packages.compile.from.source = 'always')
## to ensure we can build packages correctly ...
Sys.setenv(PKG_CONFIG = 
    file.path("/Applications", "iNZightVIT", "Update.app",
              "Contents", "Resources", "pkg-config"))

installPkgs <- function(...) {
    cat(" * checking for installed dependencies \n")
    pkgs <- unlist(list(...))
    to.install <- suppressWarnings(
        !sapply(pkgs, requireNamespace, quietly = TRUE, character.only = TRUE)
    )
    if (any(to.install)) {
        x <- system("osascript -e 'tell app \"System Events\" to display dialog \"Please wait while iNZight installs dependencies. This may take a few minutes.\" buttons [\"OK\"]'", wait = FALSE)
        rule()
        cat("Kia ora!\n\nIt looks like this is your first time using ", 
            Sys.getenv('INZAPP'), ".\n",
            "Please wait while I install some things ... \n\n",
            sep = "")

        inst <- pkgs[to.install]
        utils::install.packages(inst, type = "both", dependencies = TRUE)
        cat("\n\nThat's it, everything is installed!\n")
        rule()
    }
}

## Add a 'capture.output' to require(RGtk2)
# grep for GTK+ is headerless
checkGTK <- function() {
    rgtk <- capture.output(require(RGtk2))
    if (any(grepl('headless', rgtk)))
        stop(" * ERROR: you either haven't installed RGtk2, or you need to restart your Mac")
}

.First <- function() {
    app <- Sys.getenv('INZAPP')
    rule()
    appt <- switch(app, 'Update' = 'the iNZight Updater', app)
    cat(center(" *** Welcome to", appt, "*** \n\n"))

    switch(app,
        "iNZight" = {
            installPkgs("iNZight", "iNZightPlots", "iNZightMR",
                        "iNZightModules", "iNZightRegression", "iNZightTS",
                        "iNZightTools")
            cat(" * loading iNZight \n")
            checkGTK()
            suppressMessages(suppressPackageStartupMessages(library(iNZight)))
            cat(" * launching iNZight \n")
            suppressMessages(iNZight(disposeR = TRUE))
        },
        "VIT" = {
            installPkgs("vit")
            cat(" * loading VIT \n")
            checkGTK()
            suppressMessages(suppressPackageStartupMessages(library(vit)))
            cat(" * launching VIT \n")
            suppressMessages(iNZightVIT(disposeR = TRUE))
        },
        "Update" = {
            cat(" * updating iNZightVIT \n")
            OS <- "osx"
            source("https://raw.githubusercontent.com/iNZightVIT/dev/master/update.R")
            if (VERSION == LATEST)
                cat(" * iNZight is up to date! \n")
        })

    # Only want to hide iNZight and VIT 
    if (app != "Update")
        system("osascript -e 'tell application \"System Events\" to set visible of application process \"R\" to false'")
}

setwd("~")

