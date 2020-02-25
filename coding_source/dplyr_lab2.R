library(dplyr)
install.packages("ggplot2")
library(ggplot2)
str(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)
# 1-1 mpg 의 행의 개수와 열의 개수를 출력한다.
nrow(mpg)
ncol(mpg)
# 1-2 mpg의 데이터를 앞에서 10개 출력한다.
head(mpg, 10)
# 1-3 mpg의 데이터를 뒤에서 10개 출력한다.
tail(mpg, 10)
# 1-4. mpg의 데이터를 GUI(Graphic User Interface) 환경으로 출력한다.
View(mpg)
# 1-5 mpg를 열 단위로 요약한다.
summary(mpg)
# 1-6 mpg의 구조를 확인한다.
str(mpg)

# 2-1
mpg <- rename(mpg, city = cty)
mpg <- rename(mpg, highway = hwy)

# 2-2
head(mpg)

# 3-1
midwest <- as.data.frame(midwest)
str(midwest)

# 3-2
midwest <- rename(midwest, total=poptotal, asian=popasian)
head(midwest)

# 3-3
midwest %>% 
  mutate(ratioasiantototal = asian/total)

  
# 3-4
midwest %>% 
  mutate(ratioasiantototal = asian/total) %>%
  mutate(size=ifelse(ratioasiantototal>=mean(ratioasiantototal),"large","small"))

# 4-1 
displunder4 <- mpg %>% filter(displ<=4)  
displover5 <- mpg %>% filter(displ>=5)  
mean(displunder4$hwy)                      
mean(displover5$hwy)   

mpg %>% 
  filter(displ<=4|displ>=5) %>% 
  mutate(g = ifelse(displ>=5,"5이상","4이하")) %>% 
  group_by(g) %>% 
  summarise(mean_hwy=mean(hwy))
  
# 4-2
mpg %>% 
  filter(manufacturer=="audi"|manufacturer=="toyota") %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty = mean(cty))

# 4-3
mpg %>% 
  filter(manufacturer=="chevrolet"|manufacturer=="ford"|manufacturer=="honda") %>% 
  summarise(mean_hwy=mean(hwy))

# 5-1
mpg1 <- mpg %>% 
  select(class, cty)
head(mpg1)  

# 5-2
suv <- mpg1 %>% filter(class=="suv")
compact <- mpg1 %>% filter(class=="compact")
mean(suv$cty)
mean(compact$cty)

# 6-1
mpg %>% 
  filter(manufacturer=="audi") %>% 
  arrange(desc(hwy)) %>% 
  head(5)