library(leaflet)
library(ggmap)
register_google(key='')
homelonlat <- geocode(enc2utf8("서울특별시 중구 동호로25길 34"), source="google")
mk <- homelonlat
lan <- mk$lon
lat <- mk$lat
msg <- '<strong><a>유니코의 집</a></strong><hr>백도(말티즈, 13살)가 살고 있는 곳'
map2 <- leaflet() %>% setView(lng = mk$lon, lat = mk$lat, zoom = 16) %>% addTiles() %>% addCircles(lng = lan, lat = lat, color='deeppink', popup = msg )
map2

install.packages("htmlwidgets")
library(htmlwidgets)
saveWidget(map2, file="mymap.html")
