# 1
gonggu <- readLines("공구.txt", encoding="UTF-8")
gonggu <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]","",gonggu)
gonggu <- trimws(gonggu)
library(KoNLP)
gonggu_data <- extractNoun(gonggu)
undata <- unlist(gonggu_data)
undata
undata2 <- Filter(function(x) {nchar(x) >= 2}, undata)
gonggu_table <- table(undata2)
gonggu_table
final <- sort(gonggu_table, decreasing = T)
final <- as.data.frame(final)
final <- final[-c(1:2),]
head(final, 10)

# 2
library(wordcloud)
library(RColorBrewer)
Set1 <- brewer.pal(9, 'Set1')
png("wc.png", width=480, height=480)
windowsFonts(lett=windowsFont("휴먼옛체"))
wordcloud(final$undata2, final$Freq, family="lett",
          min.freq = 2,
          random.order = FALSE, 
          rot.per = 0, scale = c(4, 1),
          color=Set1)

# 저장
dev.off()

