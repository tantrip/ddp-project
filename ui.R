shinyUI(fluidPage(
  fluidRow(
    column(12, '')
    ),
  fluidRow(
    column(12, wellPanel(
                          tags$h4("Map of major crimes across the United States by selected year")
                        )
                )
          ),
  fluidRow(
    column(3, wellPanel(
      sliderInput("year", tags$b("Select Year:"), min = 1969, max = 2010, value = 1995,
                  step = 1),
      tags$br(),
      tags$br(),
      selectInput("pal", tags$b('Select Color Palette'), c('Blues', 'Accent', 'PuRd', 'Purples', 'OrRd', 'Oranges', 'Greys')),
      tags$br(),
      tags$br(),
      sliderInput("ncuts", tags$b("Select Number of Breaks:"), min = 3, max = 8, value = 7,
                  step = 1),
      tags$br(),
      tags$br()
      )
    ),
    column(8,
      rCharts::chartOutput('myplot', 'datamaps')
  )
),
fluidRow(
  column(12, wellPanel(
    tags$h4("This Shiny and rCharts demo shows crime statistics for various US states from 1969 to 2010"),
    tags$h5("The map will change dynamically based on your selections as detailed below"),
    tags$ul(
      tags$li("Use the slider to select an year"),
      tags$li("Select a value from dropdown to change color palette for the map"),
      tags$li("Select number of breaks to increase or decrease the definition of color palette"),
      tags$li("Shiny server code will slice the crime dataset for selected year and show the chloropleth map"),
      tags$li("Hover on any state on the map to see the number of crimes in that state for the currently selected year")
    ),
    tags$h5("Please note: This demo has drawn from some of the examples from Ramnath (author of rCharts) with updates and additions")
  )
  )
)
)
)