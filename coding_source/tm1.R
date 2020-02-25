# 
library(tm)
library(proxy)
과일 <- c("사과 포도 망고",
        "포도 자몽 자두",
        "복숭아 사과 포도",
        "오렌지 바나나 복숭아",
        "포도 바나나 망고",
        "포도 귤 오렌지")
cps <-VCorpus(VectorSource(과일))
dtm <-DocumentTermMatrix(cps, 
                          control=list(wordLengths = c(1, Inf)))
dtm
m <- as.matrix(dtm)
rownames(m) <- c("듀크","둘리","또치","도우너","길동","희동")

# (1) 좋아하는 과일이 가장 유사한 친구들을 찾아본다.
com <- m %*% t(m)
com
dist(com, method="cosine")
library(qgraph)
qgraph(com, labels=rownames(com), diag=F,
       layout='spring',  edge.color='blue', 
       vsize=log(diag(com)*800))

# (2) 학생들에게 가장 많이 선택된 과일을 찾아본다.
head(sort(colSums(m), decreasing = T), 1)

# (3) 학생들에게 가장 적게 선택된 과일을 찾아본다.
tail(sort(colSums(m), decreasing = T), 3)
