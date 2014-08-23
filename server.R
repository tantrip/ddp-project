require(rCharts)
require(rMaps)

shinyServer(function(input, output, session){
  
  output$myplot = rCharts::renderChart2({ichoropleth(
    Crime ~ State, 
    data = subset(violent_crime, Year == input$year),
    pal = input$pal,
    ncuts = input$ncuts,
    geographyConfig=list(popupTemplate="#!function(geo, data) {
                                                              return '<div class=\"hoverinfo\"><strong>'+
                                                                        geo.properties.name +
                                                                        '<br>' + 
                                                                        'Total violent crimes: ' + 
                                                                        data.Crime +
                                                                        '</strong></div>';
                                                              }!#")
  )})
}
)