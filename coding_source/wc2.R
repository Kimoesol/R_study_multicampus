# 1
yes24 <- readLines("yes24.txt")
yes24 <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]","",yes24)
library(KoNLP)
yes24_data <- extractNoun(yes24)
undata <- unlist(yes24_data)
undata
undata2 <- Filter(function(x) {nchar(x) >= 2}, undata)
yes24_table <- table(undata2)
yes24_table
final <- sort(yes24_table, decreasing = T)
final <- as.data.frame(final)
head(final,10)

# 2
library(wordcloud2)
library(RColorBrewer)
Set1 <- brewer.pal(9, 'Set1')
windowsFonts(lett=windowsFont("휴먼옛체"))
result <- wordcloud2(final, size=0.8,col=Set1)
result

# 3
library("htmlwidgets")
saveWidget(result, "wc.html", title="WORDCLOUD2 실습", selfcontained= F)
