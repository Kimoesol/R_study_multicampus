# 서울 지도
map_seoul <- get_map(location="seoul", zoom=11, maptype="roadmap")

# 지역별 장애인 도서관 위치
df <- read.csv("지역별장애인도서관정보.csv")
ggmap(map_seoul) + geom_point(data=df,aes(x=df$LON, y=df$LAT), alpha=0.8, size=5, color="red") +
  geom_text(data=df, aes(x=df$LON, y=df$LAT), label=df$도서관명)
ggsave("library.png")
