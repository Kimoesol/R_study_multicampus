# 문제1
clicklog <- read.table("product_click.log")
table(clicklog$V2)
barplot(table(clicklog$V2), main = "세로바 그래프 실습", xlab="상품ID", ylab="클릭수", col=terrain.colors(10))     

# 문제2
clicklog <- read.table("product_click.log")
library(stringr)
time <- table(str_sub(clicklog$V1,start=-4,end=-3))
time1 <- as.numeric(time)
str(time)
