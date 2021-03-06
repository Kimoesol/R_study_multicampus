library(httr)
library(XML)
library(rvest)
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- ""
Client_Secret <- ""
# URLencode("여름추천요리")
query <- URLencode(iconv("여름추천요리","euc-kr","UTF-8"))
query
url<- paste(searchUrl, "?query=", query, "&display=20", sep="")
doc<-GET(url, add_headers('Content-Type' = "application/xml",
                          'X-Naver-Client-Id' = Client_ID,'X-Naver-Client-Secret' = Client_Secret))
doc1 <- htmlParse(doc, encoding="UTF-8")
text1<- xpathSApply(doc1, "//item/description", xmlValue)
text1

doc2 <- html_nodes(read_html(doc, encoding="UTF-8"), xpath='//item/description')
text2 <- html_text(doc2)
text2

doc3 <- html_nodes(content(doc, encoding="UTF-8"), xpath='//item/description')
text3 <- html_text(doc3)
text3




searchUrl<- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- ""
Client_Secret <- ""
query <- URLencode(iconv("검찰","euc-kr","UTF-8"))
url<- paste(searchUrl, "?query=", query, "&display=20", sep="")
doc<-GET(url, add_headers('Content-Type' = "application/xml",
                          'X-Naver-Client-Id' = Client_ID,
                          'X-Naver-Client-Secret' = Client_Secret))
		
paringData <- htmlParse(doc, encoding="UTF-8")
text<- xpathSApply(paringData, "//item/description", xmlValue); 
text

xpathSApply(paringData, "//item/title", xmlValue)

# 트위터 글 읽어오기
install.packages("twitteR")
library(twitteR) 
api_key <- ""
api_secret <- ""
access_token <- ""
access_token_secret <- ""
setup_twitter_oauth(api_key,api_secret, access_token,access_token_secret)
# oauth 정보 저장 확인
key <- "단풍"
key <- enc2utf8(key)

result <- searchTwitter(key, n=100)
DF <- twListToDF(result)
str(DF)
content <- DF$text
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content)   
content


library(XML)
API_key  <- ""
bus_No <- "402"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url, encoding="UTF-8")
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df
str(df)

busRouteId <- df$busRouteId
busRouteId
url <- paste("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?ServiceKey=", API_key, "&busRouteId=", busRouteId, sep="")
doc <- xmlParse(url, encoding="UTF-8")
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df


# 동적 스크래핑

install.packages("RSelenium")
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("http://www.google.com/ncr")

webElem <- remDr$findElement(using = "css", "[name = 'q']")
webElem$sendKeysToElement(list("JAVA", key = "enter"))


remDr$navigate("http://www.naver.com/")

webElem <- remDr$findElement(using = "css", "#query")
webElem$sendKeysToElement(list("JAVA", key = "enter"))



url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate(url)
#복수형으로 노드 추출
more<-remDr$findElements(using='css','span.u_cbox_in_view_comment')
sapply(more,function(x){x$clickElement()})
#단수형으로 노드 추출
more<-remDr$findElement(using='css','span.u_cbox_in_view_comment')
more$clickElement()


for (i in 4:12) {
  nextCss <- paste0("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span")
  nextPage<-remDr$findElement(using='css',nextCss)
  nextPage$clickElement()
  Sys.sleep(3)
}


