url <- "https://media.daum.net/ranking/popular/"
text <- read_html(url)
text

# 뉴스제목
nodes <- html_nodes(text,"#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > a")
newstitle <- html_text(nodes)
newstitle
newstitle <- gsub("\t","",newstitle)

# 신문사명칭
nodes <- html_nodes(text, "#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > span")
newspapername <- html_text(nodes)
newspapername

page <- data.frame(newstitle, newspapername)
write.csv(page, "daumnews.csv")
