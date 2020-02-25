# 문제1
library(ggplot2)
mpg <- ggplot2::mpg
str(mpg)
도시연비 <- mpg$cty
고속도로연비 <- mpg$hwy
plot(도시연비, 고속도로연비, xlab="도시연비", ylab="고속도로연비",pch=3)

# 문제2
N <- mpg %>% group_by(drv) %>% summarise(n=n())
barplot(N$n, col=rainbow(3), names.arg=N$drv)

# 문제3
par(xpd=T)
boxplot(hwy~manufacturer, data=mpg, las=2,
        main="*제조사별 고속도로 연비*", col.main="deep pink",
        xlab="",ylab="고속도로 연비", col=heat.colors(15),
        ylim=c(5,40))
        