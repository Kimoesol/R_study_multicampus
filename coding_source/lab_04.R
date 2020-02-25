# 문제1
L1 <- list("scott", 3000)
names(L1) <- c("name", "sal")
L1
result <- L1$sal*2

# 문제2
L2 <- list("scott", c(100,200,300))

# 문제3
L3 <- list(c(3,5,7), c("A","B","C"))
L3[[2]][1] <- "Alpha"

# 문제4
L4 <- list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
L4[[1]]+10

# 문제5
L5 <- list(math=list(95,90), writing=list(90,85), reading=list(85,80))
mean(unlist(L5))

# 문제6
time <- 32150
time1 <- c(32150%/%(60*60), 
          (32150%%(60*60))%/%60,
          ((32150%%(60*60))%%60))
name_time <- c("시간","분","초")
paste(time1,name_time, sep="", collapse=" ")