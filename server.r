# server.r

library(shiny)
library(ggplot2)
library(tidyverse)


load(file = "Data/HFbasic_for_shiny_app.Rdata")

# Define server logic required to draw a histogram
server <- function(input, output) {
  # Round age to accomodate not modelled values
     age_rounder <- reactive({
       if(input$age %in% c(43L, 48L, 53L, 58L, 61L, 81L, 86L)) input$age + 1L else input$age
     })
     
  # Select data based on age, deprivation and whether absolute or relative scale
     hf_smry_time <- reactive({
    if(input$myscale == "Absolute") {
       mydf <- data_for_plot_time_mod_time_s_absolute } else mydf <-  data_for_plot_time_mod_time_s_relative
    mydf %>% 
     filter(dep_two == input$deprivation & age_ten == age_rounder())
   })
   
     # Create plot
   output$TimePlot <- renderPlot({
      plot_time <- ggplot(hf_smry_time(),
                        aes(x = year, y = est, colour = type, group = interaction(type))) + 
      geom_line() +
      geom_ribbon(alpha = 0.1, mapping = aes(ymin = lower, ymax = upper, fill = type)) +
      facet_grid (~sex)  +
      scale_color_discrete("") + 
      scale_fill_discrete(("")) +
      scale_y_continuous("Rate per 1000 person-years", breaks = log(2^(-3:6)), labels = 2^(-3:6)) +
      scale_x_continuous("Calendar years") +
      scale_size(guide = FALSE) +
      scale_linetype(guide = FALSE)
    if (input$myscale == "Absolute") plot_time <- plot_time + 
      scale_y_continuous("Rate per 1000 person-years")
    
    
    plot_time
   })
}
