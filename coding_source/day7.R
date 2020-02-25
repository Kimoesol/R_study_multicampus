# 블럭스타일 태그
# 인라인스타일 태그

# 1. 웹페이지의 URL 문자열을 파악해야 한다.(Query 문자열을 포함)
# 2. 웹 페이지의 컨텐츠가 어떤 문자셋으로 작성되었는지 파악한다. <meta>
# 3. 추출하려는 컨텐츠를 포함하고 있는 태그를 찾는다.
# 4. 찾은 태그의 CSS Selector 또는 Xpath를 판단한다.

# rvest 라는 패키지를 사용
install.packages("rvest")
library(rvest)

url <- "http://unico2013.dothome.co.kr/crawling/tagstyle.html"
text <- read_html(url)
text

nodes <- html_nodes(text, "div") # div 선택자에 해당하는 nodes를 추출
nodes
title <- html_text(nodes)
title

node1 <- html_nodes(text, "div:nth-of-type(1)")
node1
html_text(node1)
html_attr(node1, "style")
# [1] "background-color:yellow"

node2 <- html_nodes(text, "div:nth-of-type(2)")
node2
html_text(node2)
html_attr(node2, "style")
# [1] NA

# 컨텐츠를 나타내는 함수가 html_text
# 속성값을 나타내는 함수는 html_attr

# 태그명[속성명]            *[속성명] [속성명]
# 태그명[속성명=속성값]
# 태그명[속성명^=속성값]  : 이 속성으로부터 시작하는
# 태그명[속성명$=속성값]  : 이 속성으로 끝나는

# 태그명
# .클래스명
# #아이디명
# 태그명.클래스명
# 상위태그명 > 자식태그명 > 손자태그명
# 상위태그명.클래스명 > 자식태그명.클래스명
# 상위태그명.클래스명 자손태그명
# 상위태그명 > 자식태그명 자손태그명
# #아이디명 > 태그명.클래스명
# 태그명[속성]
# 태그명[속성=값]
# 태그명[속성$=값]
# 태그명[속성^=값]
# 태그명:nth-of-type(3)

url <- "https://movie.naver.com/movie/point/af/list.nhn"
text <- read_html(url)
text
nodes_movie <- html_nodes(text, "#old_content > table > tbody > tr:nth-child(4) > td.title > a.movie")
html_text(nodes_movie)

url <- "https://movie.naver.com/movie/point/af/list.nhn"
text <- read_html(url, encoding="CP949")
text
# 영화제목
nodes <- html_nodes(text,".movie")
title <- html_text(nodes)
title
# 영화리뷰
nodes <- html_nodes(text,".title")
review <- html_text(nodes, trim=TRUE)
review
review <- gsub("\t","",review)    # gsub 함수를 이용해 필요 없는 부분을 지운다.
review <- gsub("\r\n","",review)
review <- gsub("\n","",review)
review <- gsub("신고","",review)

page <- data.frame(title, review)
write.csv(page, "movie_reviews.csv")


# 여러 페이지
site <- "https://movie.naver.com/movie/point/af/list.nhn?page="
movie.review <-NULL
for(i in 1:100){
  url <- paste(site,i,sep="")
  text <- read_html(url, encoding="CP949")
  nodes <- html_nodes(text,".movie")
  title <- html_text(nodes)
  nodes <- html_nodes(text,".title")
  review <- html_text(nodes, trim=TRUE)
  review <- gsub("\t","",review)
  review <- gsub("[\r\n]","",review)
  review <- gsub("신고","",review)
  page <- data.frame(title, review)
  movie.review <- rbind(movie.review,page)
}
write.csv(movie.review, "movie_reviews2.csv")

