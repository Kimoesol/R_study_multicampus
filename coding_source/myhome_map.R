homelonlat <- geocode(enc2utf8("서울특별시 중구 동호로25길 34"), source="google")
mk <- homelonlat
cen <- c(mk$lon, mk$lat)
library(stringr)
second <- as.numeric(str_sub(Sys.time(), start=-2, end=-1))
maptype_source <- ifelse(second>=45,"hybrid",
                         ifelse(second>=30,"roadmap",
                                ifelse(second>=15,"satellite","terrain")))
map <- get_googlemap(center=cen, maptype=maptype_source,zoom=16, marker=mk)
ggmap(map) + geom_text(aes(x=mk$lon, y=mk$lat), label="김외솔 동네") +
  labs(title="김외솔의 집", x="위도", y="경도")
ggsave("mymap.png")
