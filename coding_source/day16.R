library(Kormaps)
data(korpopmap2)
data(korpopmap3)
Encoding(korpopmap2@data$name)<-'UTF-8'
korpopmap2@data$code.data
korpopmap2@data$name
gucodename <- korpopmap2@data[,c("name", "code.data")]

names(gucodename)
Encoding(korpopmap3@data$name)<-'UTF-8'
korpopmap3@data$code.data
korpopmap3@data$name

guname <- '강남구'
gucode <- gucodename[gucodename$name == guname, "code.data"]
pattern <- paste0('^', gucode)
korpopmap3@data[grep(pattern, korpopmap3@data$code.data), 
                c("code.data", "name")]

# 정규표현식 보충
# \d / [0123456789] / [0-9] / [:digit:] 4가지 모두 동일

gsub("ABC", "***", "ABCabcABC")  #ABC를 *** 로 변환
gsub("ABC", "***", "ABCabcABC", ignore.case=T) # ignore.case=T는 대소문자 구별하지 말라는 의미
x<-c("ABCabcABC", "abcABCabc")
gsub("ABC", "***", x) 
gsub("b.n", "***", "i love banana") # b와 n, 그리고 그 사이에 오는 임의의 문자는 ***로 바꾼다
# [1] "i love ***ana"
gsub("b.*n", "***", "i love banana") # .(임의 문자)가 0번 이상 출현
# [1] "i love ***a"
gsub("[bn]a", "***", "i love banana") # ba 또는 na를 찾으라는 의미
# [1] "i love *********"
gsub("010-[0-9]{4}-[0-9]{4}", "010-****-****", "내 폰번호는 010-1234-6789") 
# [0-9]{4}는 0부터 9까지 중 반드시 4개의 숫자가 와야 한다는 의미
# [1] "내 폰번호는 010-****-****"
gsub("010-\\d{4}-\\d{4}", "010-****-****", "내 폰번호는 010-1234-6789") 
# [1] "내 폰번호는 010-****-****"
gsub(" +", " ", "i   love    banana") # blank가 한 번 이상 왔을 때 하나의 blank로 대체
# [1] "i love banana"

# apply() 계열의 함수들...
weight <- c(65.4, 55, 380, 72.2, 51, NA)
height <- c(170, 155, NA, 173, 161, 166)
gender <- c("M", "F", "M", "M", "F", "F")

df <- data.frame(w=weight, h=height)
df

apply(df, 1, sum, na.rm=TRUE) # 1이면 행 단위로 동작
# [1] 235.4 210.0 380.0 245.2 212.0 166.0
apply(df, 2, sum, na.rm=TRUE) # 2면 열 단위로 동작
#     w     h 
# 623.6 825.0 
lapply(df, sum, na.rm=TRUE)
# $w
# [1] 623.6

# $h
# [1] 825
sapply(df, sum, na.rm=TRUE)
#     w     h 
# 623.6 825.0 
tapply(df$w, gender, mean, na.rm=TRUE)
# F        M 
# 53.0000 172.5333
tapply(1:6, gender, sum, na.rm=TRUE)
# F  M 
# 13  8 
mapply(paste, 1:5, LETTERS[1:5], month.abb[1:5])
# 첫 번째 아규먼트가 함수
# [1] "1 A Jan" "2 B Feb" "3 C Mar" "4 D Apr" "5 E May"
# 각 원소끼리 대응
count <- 1
myf <- function(x, wt=T){
  print(paste(x,"(",count,")"))
  Sys.sleep(5)
  if(wt) 
    r <- paste("*", x, "*")
  else
    r <- paste("#", x, "#")
  count <<- count + 1;
  return(r)
}
sapply(df$w, myf)
# [1] "65.4 ( 1 )"
# [1] "55 ( 2 )"
# [1] "380 ( 3 )"
# [1] "72.2 ( 4 )"
# [1] "51 ( 5 )"
# [1] "NA ( 6 )"
# [1] "* 65.4 *" "* 55 *"   "* 380 *"  "* 72.2 *" "* 51 *"   "* NA *" 
sapply(df$w, myf, F)
# [1] "65.4 ( 7 )"
# [1] "55 ( 8 )"
# [1] "380 ( 9 )"
# [1] "72.2 ( 10 )"
# [1] "51 ( 11 )"
# [1] "NA ( 12 )"
# [1] "# 65.4 #" "# 55 #"   "# 380 #"  "# 72.2 #" "# 51 #"   "# NA #" 
sapply(df$w, myf, wt=F)
rr1 <- sapply(df$w, myf, wt=F)
str(rr1)
count <- 1
sapply(df, myf)
# [1] "65.4 ( 1 )" "55 ( 1 )"   "380 ( 1 )"  "72.2 ( 1 )" "51 ( 1 )"  
# [6] "NA ( 1 )"  
# [1] "170 ( 2 )" "155 ( 2 )" "NA ( 2 )"  "173 ( 2 )" "161 ( 2 )"
# [6] "166 ( 2 )"
# w          h        
# [1,] "* 65.4 *" "* 170 *"
# [2,] "* 55 *"   "* 155 *"
# [3,] "* 380 *"  "* NA *" 
# [4,] "* 72.2 *" "* 173 *"
# [5,] "* 51 *"   "* 161 *"
# [6,] "* NA *"   "* 166 *"
rr2 <- sapply(df, myf)
str(rr2)
rr2[1,1]
#          w 
# "* 65.4 *" 
rr2[1,"w"]
#          w 
# "* 65.4 *"

r <- sapply(df, myf)
str(r)



library(KoNLP)
library(wordcloud)
library(RColorBrewer)
library(stringr)
useSejongDic()
install.packages("tm")
library(tm)

lunch <- c("커피 파스타 치킨 샐러드 아이스크림",
           "커피 우동 소고기김밥 귤",
           "참치김밥 커피 오뎅",
           "샐러드 피자 파스타 콜라",
           "티라무슈 햄버거 콜라",
           "파스타 샐러드 커피"
)

cps <- VCorpus(VectorSource(lunch))
tdm <- TermDocumentMatrix(cps) # 3글자 이상만
# TDM(가로가 단어, 세로가 document), DTM(가로가 document, 세로가 단어)
tdm
as.matrix(tdm)

cps <- VCorpus(VectorSource(lunch))
tdm <- TermDocumentMatrix(cps, 
                          control=list(wordLengths = c(1, Inf)))
tdm
(m <- as.matrix(tdm))

colnames(m) <- c("doc1", "doc2", "doc3", "doc4", "doc5", "doc6")
rowSums(m)
colSums(m)


com <- m %*% t(m) 
# 행렬곱 # t()는 행을 열로, 열을 행으로 바꿈
# 여기서 대각선 값은 의미 없음
com 


install.packages("qgraph")
library(qgraph)

qgraph(com, labels=rownames(com), diag=F,    # diag=F: 자기 자신과의 관계는 생략하라는 의미
       layout='spring',  edge.color='blue', 
       vsize=log(diag(com)*800))




install.packages("proxy")
library(proxy)
dd <- NULL
d1 <- c("aaa bbb ccc")
d2 <- c("aaa bbb ddd")
d3 <- c("aaa bbb ccc")
d4 <- c("xxx yyy zzz")
dd <- c(d1, d2, d3, d4)
cps <- Corpus(VectorSource(dd))
dtm <- DocumentTermMatrix(cps)
# DTM은 가로가 Document, 세로가 단어
as.matrix(dtm)
inspect(dtm)
m <- as.matrix(dtm)
com <- m %*% t(m)
com
dist(com, method = "cosine")
#           1          2          3
# 2 0.06924216                      
# 3 0.00000000 0.06924216           
# 4 1.00000000 1.00000000 1.00000000
dist(com, method = "Euclidean")
#          1        2        3
# 2 1.732051                  
# 3 0.000000 1.732051         
# 4 5.567764 5.099020 5.567764


install.packages("lsa")
library(lsa)
cosine(com)
#           1         2         3 4
# 1 1.0000000 0.9307578 1.0000000 0
# 2 0.9307578 1.0000000 0.9307578 0
# 3 1.0000000 0.9307578 1.0000000 0
# 4 0.0000000 0.0000000 0.0000000 1


# Install
install.packages("tm")  # 텍스트 마이닝을 위한 패키지
install.packages("SnowballC") # 어간추출을 위한 패키지
install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer") # color palettes
# Load
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")


filePath <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt"
text <- readLines(filePath)

# VectorSource () 함수는 문자형 벡터 모음을 만듭니다.
docs <- Corpus(VectorSource(text))
# 텍스트의 특수 문자 등을 대체하기 위해 tm_map () 함수를 사용하여 변환이 수행됩니다.
# “/”,“@”및“|”을 공백으로 바꿉니다.
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")


# 소문자로 변환
docs <- tm_map(docs, content_transformer(tolower))
# 수치 데이터 제거
docs <- tm_map(docs, removeNumbers)
# 영어 불용어 제거 # 불용어: 문서에서 의미 없다고 판단되는 word
docs <- tm_map(docs, removeWords, stopwords("english"))

# 벡터 구조로 사용자가 직접 불용어  설정 , 제거
docs <- tm_map(docs, removeWords, c("blabla1", "blabla2")) 

# 문장 부호 punctuations
docs <- tm_map(docs, removePunctuation)

# 공백 제거
docs <- tm_map(docs, stripWhitespace)

# 텍스트 형태소 분석
# docs <- tm_map(docs, stemDocument) # stemDocument: 어간 분석

dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))



install.packages("reshape2")
library(reshape2)

head(french_fries)
# time : 몇 주차 실험인가
# treatment : 사용한 식용유의 종류
# subject : 실험 대상자
# rep : 이 측정이 몇 번째 반복인가
# potato : 감자 맛
# buttery : 버터 맛
# grassy : 풀맛
# rancid : 신맛
# painty : 안 좋은 냄새

# 문제 : potato 열의 평균, buttery 열의 평균, grassy 열의 평균, 
# rancid 의 평균, painty 의 평균을 구하시오.


m <- melt(french_fries, id.vars=1:4) # 4열까지는 id로 쓰겠다는 의미
head(m)
library(dplyr)
m %>% group_by(variable) %>% summarize(평균=mean(value, na.rm=T))
m2 <- melt(french_fries, id.vars=1:4, na.rm=T)
dim(m2)
dim(m)
m2 %>% group_by(variable) %>% summarize(평균=mean(value))

r <- dcast(m, time+treatment+subject + rep ~ ...)
# dcast: melt 한 것을 다시 원래대로 돌려놓기 위해 사용
# time, treatment,subject,rep는 키로 사용하겠다는 의미
head(r)

rownames(r) <- NULL
rownames(french_fries) <- NULL

identical(r, french_fries) # r과 french_fries가 동일한지 확인

# 책에 있는 예제들

str(airquality)
dim(airquality)
View(airquality)
names(airquality)

names(airquality) <- tolower(names(airquality))
head(airquality)
names(airquality)

melt_test <- melt(airquality)
dim(melt_test)
melt_test2 <- melt(airquality, id.vars=c("month", "wind"), measure.vars="ozone")
head(melt_test2)
dim(melt_test2)

melt_test3 <- melt(airquality, id.vars=c("month", "wind"))
head(melt_test3)
dim(melt_test3)

aq_melt <- melt(airquality, id.vars=c("month", "day"), na.rm=T)
dim(aq_melt)
aq_dcast <- dcast(aq_melt, month+day ~ variable)
View(airquality); 
View(aq_melt); 
View(aq_dcast); 
dcast(aq_melt, month~variable, mean)