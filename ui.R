library("dplyr")
library("shiny")
library("ggplot2")
library("lintr")
library("ggthemes")

# source in the data
source("script/chart_one_data.R")
source("processData.R")

# choices assign for y_var widget in chart-two (histogram)
# select_value_x <- unique(data[, "offence_type"])
select_value <- unique(chart_one_data[, "Year"])

shinyUI(navbarPage("Crime by Year",
                   # first page: Intro
                   tabPanel("Introduction"),
                   # second page: chart one 
                   tabPanel("Crime occurance from 2010 to 2018",
                            # Add a select input for the y variable
                            selectInput(
                              "year_choice",
                              label = "Year",
                              choices = select_value,
                              selected = "2018"
                            ),
                            # Plot the output with the name "hist"
                            mainPanel(
                              tags$link(rel = "stylesheet",
                                        type = "text/css",
                                        href = "style.css"),
                              tags$h1("Offense Type by Year"),
                              plotOutput("hist")
                            )
                            ),
                   # third page
                   tabPanel("Chart Two"), 
                   # fourth page
                   tabPanel("Chart Three"),
                   # fifth page: Team info
                   tabPanel("About")  
))