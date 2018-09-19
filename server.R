library(shiny)
library(tidyverse)
library(shinythemes)

# Define server logic
function(input, output) {
  
  #get the quotes from the dataset/database
  source = "www/Quotes.csv"
  
  if(file.exists(source)){
    quotes = read.csv(source, stringsAsFactors = F)
    #print("found source file")
  }
  
  #setup list
  myQuote = reactiveValues(Quote=NULL, Author=NULL)
  
  #pick a quote
  observeEvent(input$go > 0, ignoreInit = TRUE, {
    
    temp = quotes%>%
      sample_n(1)
    
    #assign vals to list
    myQuote$Quote = paste0("\"", temp$Quote, "\"")
    myQuote$Author = paste0("- ", temp$Author)
    
  })
  
  #output the quote here 
  output$encouragement <- renderText({
    myQuote$Quote
  })
  
  #output the quote here 
  output$source = renderText({
    myQuote$Author
  })
  
  
}

