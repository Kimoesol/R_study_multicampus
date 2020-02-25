# 문제1
library(ggplot2)
mpg <- ggplot2::mpg
ggplot(mpg, aes(x=cty, y=hwy)) + geom_point(color="blue") + theme_grey()
ggsave("result1.png")

# 문제2
library(dplyr)
str(mpg)
ggplot(data=mpg, aes(x=class, fill=drv)) + geom_bar()
ggsave("result2.png")

# 문제3
midwest <- ggplot2::midwest
str(midwest)
options(scipen = 99)
ggplot(midwest, aes(x=poptotal, y=popasian)) + geom_point() + coord_cartesian(xlim=c(0,500000), ylim=c(0,10000))
ggsave("result3.png")

# 문제4
mpg <- mpg %>% filter(class=="compact"|class=="subcompact"|class=="suv")
ggplot(mpg, aes(x=class, y=cty)) + geom_boxplot()
ggsave("result4.png")

# 문제5
click <- read.table("product_click.log")
click
click_count <- as.data.frame(table(click$V2))
click_count <- rename(click_count, V2=Var1, count=Freq)
ggplot(click_count, aes(x=V2, y=count)) + geom_bar(aes(fill=V2),stat="identity")
ggsave("result5.png")

# 문제6
click <- click %>% mutate(day=format(as.Date(as.character(click$V1),"%Y%m%d%H%M"),"%A"))
ggplot(click, aes(x=day, fill=day)) + geom_bar() + coord_cartesian(ylim=c(0,200)) + theme_light() + labs(x="요일", y="클릭수")
ggsave("result6.png")
