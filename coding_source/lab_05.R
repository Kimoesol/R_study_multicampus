# 문제1
grade <- sample(1:6, 1)
if(grade==1|grade==2|grade==3){
  cat(grade,"학년은","저학년입니다.")
}else{
  cat(grade,"학년은","고학년입니다.")
}

# 문제2
choice <- sample(1:5, 1)
if(choice==1){cat("결과값 :",300+50)
}else if(choice==2){cat("결과값 :",300-50)
}else if(choice==3){cat("결과값 :",300*50)
}else if(choice==4){cat("결과값 :",300/50)
}else{cat("결과값 :",300%%50)
}

# 문제3
# 1번 방법
count <- sample(3:10, 1)
deco <- sample(1:3, 1)
if(deco==1){
  for(i in 1:count)cat("*")
}else if(deco==2){
 for(j in 1:count)cat("$")
}else{for(k in 1:count)cat("#")
}

# 2번 방법
# for(i in count){
#   if(deco==1){
#     cat("*")
#   }else if(deco==2){
#     cat("$")
#   }else if(deco==3){
#     cat("#")
#   }
# }
# 이 방법이 비교식을 더 많이 수행하기 때문에 오래 걸림

# 문제4
score <- sample(1:100, 1)
score1 <- as.character(score%/%10)
level <- switch(EXPR=score1, '9'=,'10'="A 등급",
                '8'="B 등급",
                '7'= "c 등급",
                '6'= "D 등급",
                "F 등급"
)
cat(score,"점은",level,"입니다.")

# 문제5
alpha <- paste(LETTERS, letters, sep="")
alpha
