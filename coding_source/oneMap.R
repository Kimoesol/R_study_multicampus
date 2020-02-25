Dong <- read.csv('c:/RStudy/one.csv')
data(korpopmap3)
Encoding(names(korpopmap3))<-'UTF-8'
Encoding(korpopmap3@data$name_eng)<-'UTF-8'
Encoding(korpopmap3@data$name)<-'UTF-8'
Encoding(korpopmap3@data$행정구역별_읍면동)<-'UTF-8'
View(korpopmap3)

write.csv(korpopmap3@data, "korpopmap3_data.csv")
korpopmap3@data<-korpopmap3@data[c(82:95),] 
korpopmap3@polygons<-korpopmap3@polygons[c(82:95)] 

korpopmap3@data$name<-gsub('·','',korpopmap3@data$name) 
colnames(Dong)<-c('구별','name','일인가구')
View(Dong)
dong<- Dong %>% filter(구별=='동대문구')

korpopmap3@data<-merge(korpopmap3@data,dong,by.x='name',sort=FALSE)
mymap <- korpopmap3@data
mypalette <- colorNumeric(palette ='RdYlBu' , domain = mymap$'일인가구')
mypopup <- paste0(mymap$name,'<br> 1인가구: ',mymap$'일인가구')

map7 <- NULL
map7<-leaflet(korpopmap3) %>% 
  addTiles() %>% 
  setView(lat=37.52711, lng=126.987517, zoom=12) %>%
  addPolygons(stroke =FALSE,
              smoothFactor = 0.2,
              fillOpacity = .9,
              popup = mypopup,
              color = ~mypalette(mymap$일인가구)) %>% 
  addLegend(values = ~mymap$일인가구,
            pal =mypalette ,
            title = '인구수',
            opacity = 1)
map7

saveWidget(map7, file="oneMap.html")