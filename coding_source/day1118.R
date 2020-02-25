mtcars
names(mtcars)
str(mtcars)
summary(mtcars)
library(dplyr)
mtcars %>% group_by(am) %>% summarise(avg=mean(mpg))
t.test(mpg~am, mtcars)

library(readxl)
dustdata <- read_excel("dustdata.xlsx")
View(dustdata)
str(dustdata)
dustdata_anal <- dustdata %>% filter(area %in% c("성북구", "중구"))
View(dustdata_anal)
count(dustdata_anal, yyyymmdd) %>% arrange(desc(n))
count(dustdata_anal, area) %>% arrange(desc(n))
dust_anal_area_sb <- subset(dustdata_anal, area=="성북구")
dust_anal_area_jg <- subset(dustdata_anal, area=="중구")

install.packages("psych")
library(psych)
describe(dust_anal_area_sb$finedust)
describe(dust_anal_area_jg$finedust)

boxplot(dust_anal_area_sb$finedust, dust_anal_area_jg$finedust,
        main="finedust_compare", xlab="AREA", names=c("성북구","중구"),
        ylab="FINEDUST_PM", col=c("blue","green"))
t.test(data=dustdata_anal, finedust~area, var.equal=T)

mid = c(16,20,21,22,23,22,27,25,27,28)
final = c(19,22,24,24,25,25,26,26,28,32)
t.test(mid,final,paired=T)
book = read.csv('survey.csv')
head(book)
names(book) = c('position','ans6','ans7')


names(book)
r1 = table(book$position, book$ans6) # position과 ans6 교차표
chisq.test(r1)
library(ggplot2)
book_df = as.data.frame(r1)
book_df
names(book_df) = c('position','ans6','freq')
names(book_df)
ggplot(book_df,aes(position,freq,fill=ans6)) +
  geom_bar(stat='identity', position='fill')

# 일원 분산
iris
names(iris)

result = aov(iris$Sepal.Width~iris$Species, iris) 
# iris의 종에 따른 꽃 넓이 차이가 유의미한지 확인
summary(result) # Pr(>F) 값을 통해 차이가 있는 것을 확인할 수 있다


# 이원 분산
score = read.csv('./score.csv')
score = score[-1]
head(score)
attach(score)
r = aov(score_stats~gender.fac+class.fac)
# score_stats가 남녀 차이에 의해서, 그리고 클래스 차이에 의해서 구분이 되는지 확인
summary(r)
# Pr(>F) 값을 통해 남녀 차이에에 의해서는 유의미한 차이가 없다는 것을 확인할 수 있고,
# 클래스 차이에 의해서는 유의미한 차이가 있다는 것을 확인할 수 있다.

r = aov(score_stats~gender.fac*class.fac)
summary(r)

df = read.csv('http://goo.gl/HKnl74')
names(df)
head(df)
dim(df)
attach(df)
plot(overall~rides)
cor(overall,rides)
# [1] 0.5859863 , 이 정도 수치면 보통의 상관관계
cor.test(overall,rides)
# 여기서 검정하는 통계량: 상관계수

plot(df[,4:8])
x = cor(df[,4:8])
install.packages("corrplot")
library(corrplot)
corrplot(x)

