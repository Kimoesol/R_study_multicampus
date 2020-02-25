# 문제1
exam1 <- function(){
  return(paste(LETTERS, letters, sep=""))
}
exam1()

# 문제2
exam2 <- function(x){
  xx <- x
  return(sum(1:xx))
}

# 문제3
exam3 <- function(x,y){
  xx <- x
  yy <- y
  if(xx>=yy){return(xx-yy)}
  else{return(yy-xx)}
}

# 문제4 # 수업시간에 언급하신 소스 paste했습니다.
exam4 <- function(x,y,z){
  if(y=="+"){
    g <- x+z
  }else if(y=="-"){
    g <- x-z
  }else if(y=="*"){
    g <- x*z
  }else if(y=="%/%"){
    if(x==0)
      g <- "오류1"
    else if(z==0)
      g <- "오류2"
    else
      g <- x%/%z
  }else if(y=="%%"){
    if(x==0)
      g <- "오류1"
    else if(z==0)
      g <- "오류2"
    else
      g <- x%%z
  }else {g <- "규격의 연산자만 전달하세요"
}
  return(g)
}
exam4(0,"%/%",10)
# [1] "오류1"
exam4(10,"%%",0)
# [1] "오류2"
exam4(5,"#",10)
# [1] "규격의 연산자만 전달하세요"