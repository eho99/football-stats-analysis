library(shiny)
library(tidyverse)
library(shinythemes)
library(shinyalert)
library(shinyjs)
library(shinydashboard)
library(DT)
library(tidyverse)
library(ggrepel)
library(ggimage)
library(nflfastR)


# hard-coded
seasons <- 2017:2020
player_stats <- load_pbp(seasons)


# ui function
ui <- fluidPage(
    
    # set theme
    theme = shinytheme("yeti"),
    
    # use shiny alert
    useShinyalert(),
    
    # use navbar format
    navbarPage(
        title = "NFL Stats Viewer",
        
        # headlines panel
        tabPanel(title= "Home",
                 
                 sidebarLayout(
                     
                     # add side bar
                     sidebarPanel(
                         p("Search for an NFL player"),
                         
                         # player input
                         textInput(inputId = "player_name", 
                                   label = h4("Enter a player name:")),
                         
                         # date input
                         selectInput(
                             inputId =  "playing_year", 
                             label = "Select playing year:", 
                             choices = 2017:as.numeric(format(Sys.Date(),"%Y"))
                         ),
                         
                         div(align = "right",
                             actionButton(
                                 inputId = "search",
                                 label   = strong("Go!"),
                                 class = "btn btn-primary"
                            )
                         ),

                     ),
                    
                     mainPanel(
                         title = "Data", 
                         value = "data", 
                         DT::dataTableOutput(outputId = "player_data")
                     )
                     
                     
                 )
                 )
    )
    
)
