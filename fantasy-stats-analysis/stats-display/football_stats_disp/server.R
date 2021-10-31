library(shiny)
library(tidyverse)
library(shinythemes)
library(shinyalert)
library(shinyjs)
library(shinydashboard)
library(tidyverse)
library(ggrepel)
library(ggimage)
library(nflfastR)


# hard-coded
seasons <- 2017:2020
player_stats <- load_pbp(seasons)
player_list <- 


# server function
server <- function(input, output) {
    
    # player_name <- reactive(input$player_name, {
    #     
    # })
    
    output$player_data <- DT::renderDataTable({
        datatable(
            player_stats
        )
    })
    
}
