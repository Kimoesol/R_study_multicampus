# 문제1
exam5 <- function(x,y="#") {
  if(x>='0') print(rep(y,x))
  else print()
  return()
}
exam5(10,"@")

# 문제2
# 처리해야 할 데이터가 여러 개이므로 반복문 사용해야 한다
exam6 <- function(vec){
 for (i in 1:length(vec)){                        # length 개념 활용!
   if(is.na(vec[i])){
     print(paste(vec[i],"는 처리불가"))
   }else if(vec[i]>=85){
     print(paste(vec[i],"점은 상등급입니다."))
   }else if(vec[i]>=70){
     print(paste(vec[i],"점은 중등급입니다."))
   }else print(paste(vec[i],"점은 하등급입니다."))
 }
  return()
}
exam6(c(10, NA))

exam6 <- function(vec){
  for (d in vec){                        # length 개념 활용!
    if(is.na(d)){
      print(paste(d,"는 처리불가"))
    }else if(d>=85){
      print(paste(d,"점은 상등급입니다."))
    }else if(d>=70){
      print(paste(d,"점은 중등급입니다."))
    }else print(paste(d,"점은 하등급입니다."))
  }
  return()
}

# 문제3
countEvenOdd <- function(vec){
  if(is.numeric(vec)!=T){
    return()
  }
  even=0
  odd=0
  for(i in vec){    # 벡터 갯수만큼 반복하기 위해 어떻게 표현하는지 확인하기
    if(i%%2==0){
      even=even+1
    }else{
      odd=odd+1
    }
  }
  list=list(even=even,odd=odd)
  return(list)
}
countEvenOdd(c(10,15,30))

# 문제4
vmSum <- function(x){
 if(is.vector(x)!=T|is.list(x)==T){
   print("벡터만 전달하숑!")
   return()
 }else if(is.numeric(x)!=T){
   print("숫자 벡터를 전달하숑!")
   return(0)
 }else
    return(sum(x))
}
vmSum(list())
# [1] "벡터만 전달하숑!"
# NULL

# 문제5
vmSum2 <- function(x){
  if((is.vector(x)!=T)|(is.list(x)==T)){
    stop("벡터만 전달하숑!")
  }else if(is.numeric(x)!=T){
      warning("숫자 벡터를 전달하숑!")
      return(0)
  }else
    return(sum(x))
}