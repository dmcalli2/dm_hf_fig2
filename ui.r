# ui.r

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Trends in heart failure hospitalisation"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         h4("Choose whether to plot the rate for different age and deprivation levels, and whether to view the rates
           on the absolute or relative (ie log) scale."),
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
         h4("Description of figure"),
                  p(
"This plot is an interactive version of Figure 2 in the manuscript XXX. 
Please see the original manuscript for details of the data and additional details of the analyses."),
p("
The lines represent the predicted rates obtained from generalized additive models of incident heart failure events.
The ribbons are 95% confidence intervals. Covariates included in the model were age, sex, deprivation, diabetes type 
and calendar-year, with interaction terms included where these improved model fit. The model was fit with a log-link and 
Poisson likelihood, with correction of the standard errors for overdispersion. Penalized thin plate regression splines were used 
to model non-linear associations for calendar-year by diagnosis type.")
      )
   )
)
