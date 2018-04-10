packages <- c("shiny", "shinythemes", "DT", "data.table")

pkgs_check <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

pkgs_check(packages)

options(shiny.maxRequestSize=30*1024^2) 