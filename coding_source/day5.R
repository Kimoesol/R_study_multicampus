myFunction <- function(){
  print(LETTERS[1])
  print(LETTERS[2])
  print(LETTERS[3])
  print(LETTERS[4])
  return("END")
}
print(1)
myFunction()
# [1] "A"
# [1] "B"
# [1] "C"
# [1] "D"
# [1] "END"
print(2)

myFunction <- function(){
  print(LETTERS[1])
  print(LETTERS[2])
  today <- weekdays(Sys.Date())
  if(today == "금요일")
    return()
  print(LETTERS[3])
  print(LETTERS[4])
  return("END")
}
print(1)
myFunction()
# [1] "A"
# [1] "B"
# NULL
print(2)

myFunction <- function(){
  print(LETTERS[1])
  print(LETTERS[2])
  today <- weekdays(Sys.Date())
  if(today == "토요일")
    return()
  print(LETTERS[3])
  print(LETTERS[4])
  return("END")
}
print(1)
myFunction()
# [1] "A"
# [1] "B"
# [1] "C"
# [1] "D"
# [1] "END"
print(2)

myFunction <- function(){
  print(LETTERS[1])
  print(LETTERS[2])
  today <- weekdays(Sys.Date())
  if(today == "금요일")
    return()
  print(LETTERS[3])
  print(LETTERS[4])
  return("END")
}
r <- myFunction()
# [1] "A"
# [1] "B"

myFunction <- function(p="ㅋ"){
  print(LETTERS[1])
  print(LETTERS[2])
  print(LETTERS[3])
  print(LETTERS[4])
  return("END")
}

sum(LETTERS)
# Error in sum(LETTERS) : invalid 'type' (character) of argument
matrix(1:7, nrow=3)

# stop() 함수
testError <- function(x){
  if(x<=0)
    stop("양의 값만 전달 하숑!! 더 이상 수행 안할거임..")
  return(rep("테스트",x))
}
testError(5)
# [1] "테스트" "테스트" "테스트" "테스트" "테스트"
testError(0)
# Error in testError(0) : 양의 값만 전달 하숑!! 더 이상 수행 안할거임..

# warning() 함수
testWarn <- function(x){
  if(x<=0)
    stop("양의 값만 전달 하숑!! 더 이상 수행 안할거임..")
  if(x>5) {
    x <- 5
    warning("5보다 크면 안됨!! 하여 5로 처리했삼...!!")
  }
  return(rep("테스트",x))
}
testWarn(3)
# [1] "테스트" "테스트" "테스트"
testWarn(10)
# [1] "테스트" "테스트" "테스트" "테스트" "테스트"
# Warning message:
# In testWarn(10) : 5보다 크면 안됨!! 하여 5로 처리했삼...!!

test1 <- function(){
  cat("난 수행함 \n")
  testError(-1) # testError 함수가 이미 만들어져 있어야 testError가 뜸
  cat("나 수행할 까요? \n") # 이 행의 결과가 출력되지 않는 경우
}
test1()
# 난 수행함
# Error in testError(-1) : 양의 값만 전달 하숑!! 더 이상 수행 안할거임..\
# 실행오류 발생하면 그 지점에서 끝나버림

test1 <- function(){
  cat("난 수행함 \n")
  testError(1) # 함수 안에서는 print를 따로 안 해줌
  # "테스트"가 출력되기 위해서는 print(testError(1))이라고 설정해야 함
  cat("나 수행할 까요? \n")
}
test1()
# 난 수행함 
# 나 수행할 까요? 
testError(1)

# try()
test2 <- function(){
  cat("난 수행함 \n")
  try(testError(-1)) # try()를 사용하면 에러 제외하고 다음으로 진행함
  cat("나 수행할 까요? \n") 
}
test2()
# 난 수행함 
# Error in testError(-1) : 양의 값만 전달 하숑!! 더 이상 수행 안할거임..
# 나 수행할 까요? 

testAll <- function(p){
  tryCatch({
    if(p=="오류테스트"){
      testError(-1)
    }else if(p=="경고테스트"){
      testWarn(6)
    }else{
      cat("정상 수행..\n")
      print(testError(2))
      print(testWarn(3))
    }
  },warning=function(w){ # warning이 발생하면 수행하는 함수
    print(w)
    cat("-.-;;\n")
  },error=function(e){   # error가 발생하면 수행하는 함수
    print(e)
    cat("ㅠㅠ\n")
  },finally={            # finally는 마지막에 반드시 수행하는 함수
    cat("반드시 수행되는 부분입니다요..\n")
  })
}
testAll("오류테스트")
# <simpleError in testError(-1): 양의 값만 전달 하숑!! 더 이상 수행 안할거임..>
#   ㅠㅠ
# 오류,경고 발생 여부를 따라서 반드시 수행되는 부분입니다요..
testAll("경고테스트")
# <simpleWarning in testWarn(6): 5보다 크면 안됨!! 하여 5로 처리했삼...!!>
#   -.-;;
# 반드시 수행되는 부분입니다요..
testAll("아무거나")
# 정상 수행..
# [1] "테스트" "테스트"
# [1] "테스트" "테스트" "테스트"
# 반드시 수행되는 부분입니다요..

# tryCatch(코드블럭, warning=함수, error=함수, finally=코드블럭)

f.case1 <- function(x){
  if(is.na(x))
    return("NA가 있슈")
  else
    return("NA가 없슈")
}
f.case1(100)
f.case1(NA)
f.case1(1:6)
f.case1(c(10,20,30))
f.case1(c(NA,20))
f.case1(c(10,NA,20))

f.case2 <- function(x){
  if(any(is.na(x)))          # any() 함수
    return("NA가 있슈")
  else
    return("NA가 없슈")
}
f.case2(100)
f.case2(NA)
f.case2(1:6)
f.case2(c(10,20,30))
f.case2(c(NA,20))
f.case2(c(10,NA,20))

f.case3 <- function(x){
  if(all(is.na(x)))          # all() 함수
    return("모두 NA임")
  else
    return("모두 NA인 것은 아님")
}
f.case3(100)
f.case3(LETTERS)
f.case3(NA)
f.case3(c(NA, NA, NA))
f.case3(c(NA, NA, 10))
# [1] "모두 NA인 것은 아님"

# Sys.sleep(초시간) 함수
testSleep <- function(x){
  for(data in 6:10){
    cat(data,"\n")
    if(x)            # x가 TRUE일 때 Sys.sleep() 함수가 작동
      Sys.sleep(1)
  }
  return()
}
testSleep(FALSE)
testSleep(TRUE)