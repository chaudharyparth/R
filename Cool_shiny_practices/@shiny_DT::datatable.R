# datatable customization
https://rstudio.github.io/DT/options.html


# add link within datatable
library("shiny")
library("shinydashboard")
library("datasets")
library("DT")
library("shinyBS")

header <- dashboardHeader()

sidebar <- dashboardSidebar()

body <- dashboardBody(
  DT::dataTableOutput("mtcarsTable"),
  bsModal("mtCarsModal", "My Modal", "",tags$p("Hello World"), size = "small")
)

shinyApp(
  ui = dashboardPage(header, sidebar, body),
  server = function(input, output, session) {
    
    mtcarsLinked <- reactive({   
      mtcars$mpg <- sapply(datasets::mtcars$mpg, function(x) {as.character(tags$a(href = "#", onclick = "$('#mtCarsModal').modal('show')", x))})
      return(mtcars)
    })
    
    output$mtcarsTable <- DT::renderDataTable({
      DT::datatable(mtcarsLinked(), 
                    class = 'compact',
                    escape = FALSE
      )
    })
  }
)
