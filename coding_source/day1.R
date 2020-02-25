v1 <- c(4, 1, 8, 6, 10)
print(v1)

# v1변수에 저장된 데이터셋에서 최대값
v2 <- max(v1)

# v1변수에 저장된 데이터셋에서 최소값
v3 <- min(v1)

# avg() : 평균, sd() : 표준편차
# seq(시작값, 종료값, 증가치)

# 함수명 <- function([매개변수...]) {
#   수행명령문장(들)
# }

# 예약어, 키워드: 이미 기능이 정해져 있는 워드

# r1 <- 10
# r1 <- 1:10
# r1 <- c(10, 20, 30)
# r1 <- NULL
# r1 <- TRUE
# r1 <- '가나다'
# r1 <- 'nums' # nums라는 데이터 값(그 값 자체)을 넣어라 / "nums"와 'nums'는 용도가 같다.
# r1 <- nums # nums 라는 변수가 갖고 있는 값을 넣어라, 이 때는 nums를 변수로 인식한다.
# r1 <- nums() # nums라는 함수를 호출하고 리턴 값을 r1에 넣어라, 이 때는 nums를 함수로 인식한다.

# 'nums' <- r1 # 오류
# nums <- r1   # 가능
# nums() <- r1 # 오류, 여기서 nums는 호출만 할 수 있다.

# l-value <- r-value
# 장소       값
# 변수       식(변수, 리터럴, 함수 호출식...)

c(10, 20, TRUE) # 수치형(numeric) > 논리형(logical)
# [1] 10 20  1
c(10, 20, "A")  # 문자형(character) > 수치형(numeric)
# [1] "10" "20" "A" 

?rep
rep(1, 100) # 그 행에서 ctrl+enter 하면 그 행 명령 바로 run
rep(1:3, times=5)
# [1] 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3
rep(1:3, each=5)
# [1] 1 1 1 1 1 2 2 2 2 2 3 3 3 3 3

# 미리 정의된 내장 상수 벡터들 : 
# LETTERS, letters, month.name, month.abb, pi
# > LETTERS
# [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q"
# [18] "R" "S" "T" "U" "V" "W" "X" "Y" "Z"
# > letters
# [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q"
# [18] "r" "s" "t" "u" "v" "w" "x" "y" "z" 

# LETTERS;letters;month.name;month.abb;pi # ;(semi colon)으로 하나의 행에 여러 명령을 구분하여 실행할 수 있다.
LETTERS[1]; LETTERS[3:5]
LETTERS[-1]; LETTERS[c(-2, -4)]

length(LETTERS) # 몇 개의 데이터로 구성되는지 알기 위해 length() 함수를 사용한다.
length(month.name)
length(pi)

x <- c(10,2,7,4,15)
x
# [1] 10  2  7  4 15
print(x)
# [1] 10  2  7  4 15
class(x)
# [1] "numeric"
rev(x)
# [1] 15  4  7  2 10
range(x)
# [1]  2 15
sort(x)
# [1]  2  4  7 10 15
sort(x, decreasing = TRUE)
# [1] 15 10  7  4  2
sort(x, decreasing = T)
# [1] 15 10  7  4  2
order(x) # 인덱스를 내보낸다. 
# 예를 들어 10이 네 번째로 높은 숫자인데 처음에 나오기 때문에, 결과에서 네 번째 값이 1이다.
# [1] 2 4 3 1 5
# 데이터 프레임을 sort할 때 중요한 함수

x[3] <- 20
x
x + 1
# x <- x + 1 방법도 사용 가능
max(x); min(x); mean(x); sum(x)
summary(x)

x[c(2,4)] # x[2], x[4]
# [1] 2 4
x[c(F,T,F,T,F)]
# [1] 2 4
# 만약, x[c(T,F)]로 수행하면 값이 어떻게 될까?
# 알아서 반복 적용해서, c(T,F,T,F,T) 결과 값을 도출함
#  A  C  E 
# 10 20 15 
x > 5
# [1]  TRUE FALSE  TRUE FALSE  TRUE
x[x > 5]
# [1] 10 20 15
x[x > 5 & x < 15]
# [1] 10
x[x > 5 | x < 15] # or는 'shift + \' 사용
# [1] 10  2 20  4 15

names(x)
# NULL
names(x) <- LETTERS[1:5] # 각각의 원소마다 이름 벡터 소유하게 됨
# 이후에 names(x) 값:
# [1] "A" "B" "C" "D" "E"
x[2]
# B 
# 2
x["B"]
# B 
# 2
# 만약, names(x) <- LETTERS[1:4]로 설정하면 어떻게 될까?
# [1] "A" "B" "C" "D" NA 

c(T, T, F, F) & c(T, F, T, F)  # 원소마다 연산이 일어남 # && 보다는 &를 더 많이 사용함
# [1]  TRUE FALSE FALSE FALSE
c(T, T, F, F) | c(T, F, T, F)  # 원소마다 연산이 일어남 # || 보다는 |를 더 많이 사용함
# [1]  TRUE  TRUE  TRUE FALSE
c(T, T, F, F) && c(T, F, T, F) # 첫 번째 원소끼리만 연산하고 끝나버림
# [1] TRUE
c(T, T, F, F) || c(T, F, T, F) # 첫 번째 원소끼리만 연산하고 끝나버림
# [1] TRUE

ls()
# [1] "v1" "x" 
rm(v1) # v1 변수 제거
x
#    A    B    C    D <NA> 
#   10    2   20    4   15 
class(x)
# [1] "numeric"

rainfall <- c(21.6, 23.6, 45.8, 77.8,
              102.2, 133.3, 327.9, 348.0,
              137.6, 49.3, 53.0, 24.9)
rainfall > 100
#  [1] FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
# [12] FALSE
rainfall[rainfall > 100]
# [1] 102.2 133.3 327.9 348.0 137.6
which(rainfall > 100)
# [1] 5 6 7 8 9
month.name[which(rainfall > 100)]
# [1] "May"       "June"      "July"      "August"    "September"
month.abb[which(rainfall > 100)]
# [1] "May" "Jun" "Jul" "Aug" "Sep"
month.korname <- c("1월", "2월", "3월",
                   "4월", "5월", "6월",
                   "7월", "8월", "9월",
                   "10월", "11월", "12월")
month.korname[which(rainfall > 100)]
# [1] "5월" "6월" "7월" "8월" "9월"
which.max(rainfall)
# [1] 8
which.min(rainfall)
# [1] 1
month.korname[which.max(rainfall)]
# [1] "8월"
month.korname[which.min(rainfall)]
# [1] "1월"

paste("I'm","Duli","!!")
# [1] "I'm Duli !!"
paste("I'm","Duli","!!", sep="") # sep은 각각의 원소끼리 영향 준다
# [1] "I'mDuli!!"
paste0("I'm","Duli","!!")
# [1] "I'mDuli!!"
fruit <- c("Apple", "Banana", "Strawberry")
food <- c("Pie","Juice","Cake")
paste(fruit, food)
# [1] "Apple Pie"       "Banana Juice"    "Strawberry Cake"
paste(fruit, food, sep="")
# [1] "ApplePie"       "BananaJuice"    "StrawberryCake"
paste(fruit, food, sep=":::")
# [1] "Apple:::Pie"       "Banana:::Juice"    "Strawberry:::Cake"
paste(fruit, food, sep="", collapse="-") # collapse는 sep으로 결합된 원소들을 또 하나의 원소로 결합시킴
# [1] "ApplePie-BananaJuice-StrawberryCake"
paste(fruit, food, sep="", collapse="")
# [1] "ApplePieBananaJuiceStrawberryCake"
paste(fruit, food, collapse=" ")
# [1] "Apple Pie Banana Juice Strawberry Cake"
