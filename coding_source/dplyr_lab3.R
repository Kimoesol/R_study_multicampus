# 7-1
mpg1 <- mpg
mpg1 <- mpg1 %>% 
  mutate(ctyplushwy=cty+hwy)

# 7-2
mpg1 <- mpg1 %>% 
  mutate(avg_cph=ctyplushwy/2)

# 7-3
mpg1 %>% 
  arrange(desc(avg_cph)) %>% 
  head(3)

# 7-4
mpg %>% 
  mutate(ctyplushwy=cty+hwy) %>% 
  mutate(avg_cph=ctyplushwy/2) %>% 
  arrange(desc(avg_cph)) %>% 
  head(3)

# 8-1
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty=mean(cty))

# 8-2
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty))

# 8-3
mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mean_hwy=mean(hwy)) %>%
  arrange(desc(mean_hwy)) %>% 
  head(3)

# 8-4
mpg %>% 
  filter(class=="compact") %>% 
  group_by(manufacturer) %>%
  select(class) %>% 
  summarise(n=n())

# 9-1
fuel <- data.frame(fl=c("c","d","e","p","r"),
                   price_fl=c(2.35,2.38,2.11,2.76,2.22),
                   stringsAsFactors = F)
fuel
mpg <- full_join(mpg, fuel, by="fl")

# 9-2
mpg %>% 
  select(model,fl,price_fl) %>% 
  head(5)

# 10-1
library(ggplot2)
midwest <- as.data.frame(midwest)
midwest <- midwest %>% 
  mutate(ratioadultstototal=popadults/poptotal*100)

# 10-2
midwest %>% 
  group_by(county) %>% 
  arrange(desc(ratioadultstototal)) %>% 
  select(ratioadultstototal) %>% 
  head(5)

# 10-3 # ifelse구문 중첩하여 사용가능
midwest %>% 
  mutate(grade=ifelse(ratioadultstototal>=40,"large",ifelse(ratioadultstototal>=30,"middle","small")))

# 10-4
midwest <- midwest %>% 
  mutate(ratioasiantototal=popasian/poptotal*100)
midwest %>% 
  arrange(ratioasiantototal) %>% 
  select(state,county,ratioasiantototal) %>% 
  head(10)

# 11-1
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212),"hwy"] <- NA
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

# 11-2
mpg %>% 
  filter(!is.na(hwy)) %>% 
  group_by(drv) %>% 
  summarise(mean_hwy=mean(hwy))

# 12-1
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93),"drv"]<-"k"
mpg[c(29,43,129,203),"cty"]<-c(3,4,39,42)
mpg$drv <- ifelse(mpg$drv%in%c('4','f','r'),mpg$drv,NA)
table(mpg$drv)

# 12-2
boxplot(mpg$cty)
boxplot(mpg$cty)$stat
mpg$cty <- ifelse(mpg$cty < 9 | mpg$cty > 26, NA, mpg$cty)
boxplot(mpg$cty)

# 12-3
mpg %>% 
  filter(!is.na(drv)) %>%
  group_by(drv) %>% 
  summarise(mean_cty=mean(cty,na.rm=T))