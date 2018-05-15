# ui.r

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Figure 2"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("age",
                     "Age (years):",
                     min = 20,
                     max = 90,
                     value = 30,
                     round = TRUE),
         sliderInput("deprivation",
                     "Deprivation (deciles, least to most):",
                     min = 1,
                     max = 10,
                     value = TRUE),
         selectInput("myscale", "Choose a scale:",
         choices = c("Absolute", "Relative"),
         selected = "Absolute")
      ),
      
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("TimePlot"),
         h1("Instructions"),
         p("This interactive plot corresponds to Figure 2 in the manuscript.
           We will add an informative heading as well as text explaining the figure when the findings have been published.
           At present this information has been withheld to preserve the novelty of the publication.
           Choose whether to plot the rate for different age and deprivation levels, and whether to view the rates
           on the absolute or relative (ie log) scale.")
      )
   )
)
