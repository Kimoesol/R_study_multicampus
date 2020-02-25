# 문제1
v1 <- seq(10, 38, by=2)
m1 <- matrix(v1, nrow=3, ncol=5, byrow=T)
m2 <- m1 + 100
m_max_v <- max(m1)
m_min_v <- min(m1)
row_max <- apply(m1,1,max)
col_max <- apply(m1,2,max)
m1;m2;m_max_v;m_min_v;row_max;col_max

# 문제2
n1 <- c(1,2,3)
n2 <- c(4,5,6)
n3 <- c(7,8,9)
m1 <- cbind(n1, n2, n3)
colnames(m1) <- NULL
m1

# 문제3
m2 <- rbind(n1, n2, n3)
rownames(m2) <- NULL
m2

# 문제4
m3 <- m2
rownames(m3) <- c("row1","row2","row3")
colnames(m3) <- c("col1","col2","col3")
m3

# 문제5
chars <- letters[1:6]
alpha <- matrix(chars, nrow=2, ncol=3)
alpha2 <- rbind(alpha, c('x','y','z'))
alpha3 <- cbind(alpha, c('s','p'))
alpha2;alpha3