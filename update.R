updateDistribution <- function() {
    cat("==========================================================\n")
    cat("               Checking for updates ...\n")
    cat("==========================================================\n\n")

    if (.Platform$OS == "windows") {
        ## Checking if the updater is using the new structure ...
        if (tail(strsplit(getwd(), "/")[[1]], 1) != "prog_files") {
            cat("\n\n  You will need to download the latest version of iNZightVIT\n")
            cat("  from https://www.stat.auckland.ac.nz/~wild/iNZight/win.php\n\n")
            stop("iNZight has not been updated.", call. = FALSE)
        } 
    }

    # Set the CRAN to UoA for updating various packages:
    uoaCRAN <- structure("http://cran.stat.auckland.ac.nz", names = "CRAN")
    currCRAN <- getOption("repos")
    if (currCRAN["CRAN"] != uoaCRAN) {
        options(repos = uoaCRAN)
        on.exit(options(repos = currCRAN))
    }

    options(repos = c(options()$repos, inzight = "http://docker.stat.auckland.ac.nz/R"))

    update.packages(c("gWidgets2", "gWidgets2RGtk2", "vit", "iNZightVIT", "iNZightMR",
                      "iNZightRegression", "iNZightModules", "iNZightTS", "iNZightTools",
                      "iNZightPlots"), 
                    ask = FALSE)

    cat("==========================================================\n")
    cat("                    Updating complete.\n")
    cat("==========================================================\n\n")

    Sys.sleep(3)
    return(invisible(NULL))
}
