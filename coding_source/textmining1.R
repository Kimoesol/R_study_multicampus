memo <- readLines("data/memo.txt",encoding="UTF-8")
memo <- memo[nchar(memo)>0]
memo[1] <- gsub("[&$!#@%]","",memo[1])  
# 여기서 '\\$'라고 사용하면 정규표현식 $로 인식x, $를 일반 문자화함
memo[2] <- gsub("e","E",memo[2])
memo[3] <- gsub("[12]","",memo[3])
memo[4] <- gsub("R ","",memo[4])
memo[4] <- gsub("[Analysis,Big,Data]","",memo[4])
memo[5] <- gsub("[!12345678<>]","",memo[5])
memo[6] <- gsub(" ","",memo[6])
memo[7] <- gsub("YOU","you",memo[7])
memo[7] <- gsub(" OK","ok",memo[7])
memo
write(memo, "memo_new.txt")