# matrix에서 byrow의 디폴트 값은 false이다.
# apply(매트릭스, 1 또는 2, 함수)

getwd()

# matrix 실습
x1 <- matrix(1:8, nrow = 2) 
# 열 우선으로 채워지는 것이 디폴트, 행 우선으로 채우려면 byrow=T를 입력해야 한다.
x1 <- x1*3
x1

sum(x1); min(x1); max(x1); mean(x1)

x2 <- matrix(1:8, nrow = 3)
x2
#     [,1] [,2] [,3]
# [1,]    1    4    7
# [2,]    2    5    8
# [3,]    3    6    1

(chars <- letters[1:10])
# 어떻게 담겼는지 확인하려면 소괄호()에 묶어서 대입 식을 구현하면 된다.
# [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j"
mat1 <- matrix(chars) # matrix는 열부터 채운다. 열 갯수 설정 안하면 1개의 열로 줄 세운다.
mat1; dim(mat1)
matrix(chars, nrow=1)
matrix(chars, nrow=5)
matrix(chars, nrow=5, byrow=T)
matrix(chars, ncol=5)
matrix(chars, ncol=5, byrow=T)
matrix(chars, nrow=3, ncol=5)
matrix(chars, nrow=3)

vec1 <- c(1,2,3)
vec2 <- c(4,5,6)
vec3 <- c(7,8,9)
mat1 <- rbind(vec1, vec2, vec3); mat1
#        [,1] [,2] [,3]
# vec1    1    2    3
# vec2    4    5    6
# vec3    7    8    9
mat2 <- cbind(vec1, vec2, vec3); mat2
#        vec1 vec2 vec3
# [1,]    1    4    7
# [2,]    2    5    8
# [3,]    3    6    9
mat1[1,1]
# vec1 
# 1 
mat1[2,];mat1[,3]
# [1] 4 5 6
# vec1 vec2 vec3 
# 3    6    9 
mat1[1,1,drop=F]
#      [,1]
# vec1    1
mat1[2,,drop=F];mat1[,3,drop=F]
#      [,1] [,2] [,3]
# vec2    4    5    6
# [,1]
# vec1    3
# vec2    6
# vec3    9

rownames(mat1) <- NULL
colnames(mat2) <- NULL
mat1; mat2
rownames(mat1) <- c("row1","row2","row3")
colnames(mat1) <- c("col1","col2","col3")
mat1
ls() # 지금까지 만들어진 객체 확인
mean(x2)
sum(x2)
min(x2)
max(x2)
summary(x2) # 열 단위로 summary한다.

mean(x2[2,])
sum(x2[2,])
rowSums(x2); colSums(x2)
# [1] 12 15 10
# [1]  6 15 16

apply(x2, 1, sum); apply(x2, 2, sum)
# apply에서 1은 열 단위로 수행, 2는 행 단위로 수행을 의미
# [1] 12 15 10
# [1]  6 15 16
?apply
apply(x2, 1, max)
apply(x2, 1, min)
apply(x2, 1, mean)

apply(x2, 2, max)
apply(x2, 2, min)
apply(x2, 2, mean)

# Array 실습
a1 <- array(1:30, dim=c(2,3,5)) # 2행 3열 5층
a1
# , , 1
# 
#       [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6

# , , 2
# 
#       [,1] [,2] [,3]
# [1,]    7    9   11
# [2,]    8   10   12

# , , 3
# 
#       [,1] [,2] [,3]
# [1,]   13   15   17
# [2,]   14   16   18

# , , 4
# 
#       [,1] [,2] [,3]
# [1,]   19   21   23
# [2,]   20   22   24

# , , 5
# 
#       [,1] [,2] [,3]
# [1,]   25   27   29
# [2,]   26   28   30

a1[1,3,4]
a1[,,3]
a1[,2,]
a1[1,,]

# factor : 범주형 데이터 처리
score <- c(1,3,2,4,2,1,3,5,1,3,3,3)
class(score)
summary(score)

f_score <- factor(score)
class(f_score)
f_score
summary(f_score)
levels(f_score) # levels 함수는 어떤 범주를 가질 수 있는지 보여줌

plot(score)
plot(f_score)

data1 <- c("월","수","토","월","목","화")
data1
class(data1)
summary(data1)
day1 <- factor(data1)
day1
# [1] 월 수 토 월 목 화
# Levels: 목 수 월 토 화
class(day1)
summary(day1)
levels(day1)

week.korabbname <- c("일","월","화",
                     "수","목","금","토")
day2 <- factor(data1, levels=week.korabbname)
day2
# [1] 월 수 토 월 목 화
# Levels: 일 월 화 수 목 금 토
summary(day2)
levels(day2)

btype <- factor(
  c("A", "O", "AB", "B", "O", "A"),
  levels=c("A","B","O"))
btype
# [1] A    O    <NA> B    O    A   
# Levels: A B O
summary(btype)
#    A    B    O NA's 
#    2    1    2    1 
levels(btype)
# [1] "A" "B" "O"

gender <- factor(c(1,2,1,1,1,2,1,2),
                 levels=c(1,2),
                 labels=c("남성","여성"))
gender
summary(gender)
# 남성 여성 
#  5    3 
levels(gender)
# [1] "남성" "여성"

# 문자열을 팩터로 만들겠다: stringsAsFactors
# 내장 데이터셋
data()
iris; head(iris) # head는 앞에서부터 6개만 출력하라는 의미
tail(iris) # tail은 뒤에서부터 6개만 출력
View(iris)
str(iris)
# 인덱스에서 'df$컬럼이름'을 제일 많이 사용한다.
# 원하는 행과 열 추출:
# subset(df, select=컬럼명들, subset=(조건))

# Dataframe 실습
no <- c(1,2,3,4)
name <- c('Apple','Banana','Peach','Berry')
qty <- c(5,2,7,9)
price <- c(500,200,200,500)
fruit <- data.frame(no, name, qty, price)
str(fruit)
View(fruit)

fruit[1,]
fruit[-1,]
fruit[,2] # factor라서 levels까지 같이 출력
fruit[,3] # fruit[,3, drop=F]
fruit[, c(3,4)]
fruit[3,2]
fruit[3,1]

fruit[,3]
fruit$qty
fruit[[3]]
# [1] 5 2 7 9
fruit[3]  # 데이터프레임 형식 유지
# qty
# 1   5
# 2   2
# 3   7
# 4   9

str(fruit$qty)
# num [1:4] 5 2 7 9
str(fruit[3])
# 'data.frame':	4 obs. of  1 variable:
# $ qty: num  5 2 7 9

# dataframe exam1
english <- c(90, 80, 60, 70)
math <- c(50, 60, 100, 20)
classnum <- c(1,1,2,2)
df_midterm <- data.frame(
  english, math, classnum)
df_midterm
str(df_midterm)
colnames(df_midterm)
rownames(df_midterm)
names(df_midterm) 
# dataframe에 names() 함수를 사용하면 colnames가 나옴/ 따라서 names()를 사용하나, colnames()를 사용하나 값이 같다.
mean(df_midterm$english)
mean(df_midterm$math)

df_midterm2 <- data.frame(
  c(90, 80, 60, 70), 
  c(50, 60, 100, 20), 
  c(1,1,2,2))
colnames(df_midterm2) # 따로 colnames가 없어서 사용불가한 colnames가 나옴
rownames(df_midterm2)
names(df_midterm2)
df_midterm2
df_midterm2 <- data.frame(
  영어=c(90, 80, 60, 70), 
  수학=c(50, 60, 100, 20), 
  클래스=c(1,1,2,2))
df_midterm2
df_midterm2$영어

df <- data.frame(var1=c(4,3,8), 
                 var2=c(2,6)) # 오류(데이터프레임을 구성하는 벡터들의 observation 갯수가 다르기 때문에 오류발생)
df <- data.frame(var1=c(4,3,8), 
                 var2=c(2,6,1))
str(df)
df$var_sum <- df$var1 + df$var2 # 파생변수를 만든다
df$var_mean <- df$var_sum/2
df$result <- ifelse(df$var1>df$var2, 
                    "var1이 크다", "var1이 작다")

getwd() # setwd('xxx')

# csv파일열기
score <- read.csv("c:/Rstudy/data/score.csv") # '절대패스' 방법
# read: 첫번째는 이름, 두번째부터는 데이터로 인식
score
str(score)
score$sum <- 
  score$math+score$english+score$science
score$result <- ifelse(score$sum >= 200, 
                       "pass", "fail")
score

summary(score$result)
#    Length     Class      Mode 
#      20     character  character 
table(score$result) # 집계 만들어주는 함수 table: factor형 아니어도 갯수 세줌
# fail pass 
#  9   11
summary(factor(score$result))
# fail pass 
#  9   11
score$result = factor(score$result) 
str(score)
summary(score)
score$id = as.character(score$id) # 현재 numeric타입인데, character로 바꿈
score$class = factor(score$class)

score$grade<-ifelse(score$sum >= 230,"A",
                    ifelse(score$sum >= 215,"B", 
                           ifelse(score$sum >=200,"C","D")))
score

# order() 와 sort()
v <- c(10,3,7,4,8)
sort(v)
order(v)

emp <- read.csv(file.choose(),
                stringsAsFactors = F) # stringsAsFactors: 문자열을 팩터로 바꾸지 말라는 의미
emp
str(emp)

# 1. emp에서 직원 이름
emp$ename
emp[,2]
emp[,"ename"] 
emp[,2, drop=FALSE] 
emp[,"ename",drop=F] 
emp[2]
emp["ename"] 

# 2. emp에서 직원이름, 잡, 샐러리
emp[,c(2,3,6)]
emp[,c("ename","job","sal")] # 변수 명을 알고 있는 경우
subset(emp,select = c(ename, job, sal)) # 변수명 지정할때 인용부호 생략가능
# 위에서 subset(emp, c(ename, job, sal))은 왜 안되는가?, select=를 꼭 줘야 하는 이유: 두번째 매개변수가 subset이기 때문에
?subset
# 3. emp에서 1,2,3 행 들만
emp[1:3,]
emp[c(1,2,3),]

# 4. ename이 "KING"인 직원의 모든 정보
emp[9,] 
emp$ename=="KING"
#  [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
# [12] FALSE FALSE FALSE
emp[c(F,F,F,F,F,F,F,F,T,F,F,F,
      F,F,F,F,F,F,F,F),]
subset(emp,subset= emp$ename=="KING")
subset(emp,emp$ename=="KING") 

emp[emp$ename=="KING",] # 바로 위와 결과값 동일
#    empno ename      job mgr hiredate    sal comm deptno
# 9  7839  KING PRESIDENT  NA 1981-11-17 5000   NA     10


# 5. select ename,sal from emp where sal>=2000
subset(emp, select=c("ename","sal"), subset= emp$sal>= 2000)
subset(emp, emp$sal>= 2000, c("ename","sal"))
emp[emp$sal>=2000,c("ename","sal")]

# 6. select ename,sal from emp where sal between 2000 and 3000
subset(emp, select=c("ename","sal"), subset=(sal>=2000 & sal<=3000))
emp[emp$sal>=2000 & emp$sal <=3000, c("ename","sal")]


emp[!is.na(emp$comm), c("ename", "comm")] #'!'는 부정 연산자
# !is.na(emp$comm): comm이 na가 아닌 것만 뽑아내라는 의미