#To-Do:

## 1) give nice description
## 2) deploy on git
## 3) store quotes on a server as opposed to static CSV
## 4) credit image(s) and quotes

library(shiny)
library(tidyverse)
library(shinythemes)

# Define UI for application
fluidPage(#theme = shinytheme("sandstone"),
  includeCSS("www/styles.css"),
                #tags$
                  
                  verticalLayout(
                    
                    br(), br(), br(),
                    # Application Header
                    fluidRow(div(style = "font-size:60px;"),
                             column(8, align="center", offset = 2,
                                    titlePanel(div(HTML("<strong><big>EncourageMe</big></strong>")),
                                               windowTitle = "The EncourageMe App")
                                    )),
                    
                    # Explanation
                    
                    fluidRow("A Shiny app for when you need encouragement, inspiration,
                             or just to feel heard.",
                             style = "margin-left:auto;
                                      margin-right:auto;
                                      vertical-align: middle;
                                      text-align: center;
                                      font-size:110%"),
                    br(),
                    hr(),
                    br(),
                    # Button
                    fluidRow(column(8, align="center", offset = 2,
                                    actionButton(inputId = "go",
                                                 label = "I need encouragement!"))),
                    br(),
                    
                    # Quote output
                    fluidRow(style = "font-size:150%", div(style = "height:25px;"),
                             column(8, align="center", offset = 2,
                                    conditionalPanel(condition = "input.go > 0",
                                                     textOutput("encouragement"))
                                    )),
                    br(),
                    
                    # Source output
                    fluidRow(style = "font-size:110%;
                                      font-style: italic;",
                             column(6, align="right", offset = 4,
                                    conditionalPanel(condition = "input.go > 0",
                                                     textOutput("source")))),
                    
                    # a cute footer
                    div(class = "footer", 
                        includeHTML("www/footer.html"))
                    )
)