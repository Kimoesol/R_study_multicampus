# OPEN API 실습1
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- ""
Client_Secret <- ""
query <- URLencode(iconv("단풍","euc-kr","UTF-8"))
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <-GET(url, add_headers('Content-Type' = "application/xml",
                          'X-Naver-Client-Id' = Client_ID,'X-Naver-Client-Secret' = Client_Secret))
doc2 <- html_nodes(read_html(doc, encoding="UTF-8"), xpath='//item/description')
text2 <- html_text(doc2)
text2 <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]","",text2)
write(text2, "naverblog.txt")

# OPEN API 실습2
searchUrl<- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- ""
Client_Secret <- ""
query <- URLencode(iconv("빅데이터","euc-kr","UTF-8"))
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc<-GET(url, add_headers('Content-Type' = "application/xml",
                          'X-Naver-Client-Id' = Client_ID,
                          'X-Naver-Client-Secret' = Client_Secret))
paringData <- htmlParse(doc, encoding="UTF-8")
text<- xpathSApply(paringData, "//item/description", xmlValue) 
text

title <- xpathSApply(paringData, "//item/title", xmlValue)
title <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]","",title)
write(title, "navernews.txt")

# OPEN API 실습3
install.packages("twitteR")
library(twitteR) 
api_key <- ""
api_secret <- ""
access_token <- ""
access_token_secret <- ""
setup_twitter_oauth(api_key,api_secret, access_token,access_token_secret)

key <- "취업"
key <- enc2utf8(key)

result <- searchTwitter(key, n=100)
DF <- twListToDF(result)
content <- DF$text
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content)   
content
write(content, "twitter.txt")

# OPEN API 실습4
API_key  <- ""
bus_No <- "360"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url, encoding="UTF-8")
top <- xmlRoot(doc) # 한글이 더 잘 나오기 위해 xmlRoot 함수 사용
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df
str(df)

busRouteId <- as.character(df$busRouteId)
length <- as.character(df$length)
stStationNm <- as.character(df$stStationNm)
edStationNm <- as.character(df$edStationNm)
term <- as.character(df$term)

cat(" 노선ID:", busRouteId[1],"\n",
    "노선길이:", length[1],"\n",
    "기점:", stStationNm[1],"\n",
    "종점:", edStationNm[1],"\n",
    "배차간격:", term[1],"분")