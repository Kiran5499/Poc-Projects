require(devtools)
install_github('ramnathv/rCharts@dev')
install_github('ramnathv/rMaps')


library(rMaps)


map <- Leaflet$new()
map$setView(c(17.38, 78.49), zoom = 16)
map$tileLayer( provider = 'Esri.WorldStreetMap')
map$marker(
  c(17.38, 78.49),
  bindPopup = 'Hi. I am a popup'
)
map

# provider = 'Stamen.Watercolor'

# Esri.WorldStreetMap

# OpenStreetMap.India

ichoropleth(Crime ~ State, data = subset(violent_crime, Year == 2010))
ichoropleth(Crime ~ State, data = violent_crime, animate = "Year")
ichoropleth(Crime ~ State, data = violent_crime, animate = "Year", play = TRUE) 

crosslet(
  x = "country", 
  y = c("web_index", "universal_access", "impact_empowerment", "freedom_openness"),
  data = web_index
)