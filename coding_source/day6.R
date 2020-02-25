# 웹 기술의 개요: HTML, CSS Selector, Xpath, JavaScript
# 정적 컨텐츠의 크롤링 & 스크래핑
# 동적 컨텐츠의 크롤링 & 스크래핑
# 크롤링 & 스크래핑 실습
# 공공DB, SNS의 Open API를 활용한 데이터 수집

?read.csv
search()
installed.packages()
read_excel()
?read_excel
??read_excel
install.packages("readxl")
library(readxl) # require(readxl)
excel_data_ex <- read_excel("10.28/book/data_ex.xls")
getwd() # working directory 확인
View(excel_data_ex)

ID <- c(1,2,3,4,5)
SEX <- c("F","M","F","M","F")
data_ex <- data.frame(ID=ID, SEX=SEX)
save(data_ex, file="data_ex.rda")
load("C:/Rstudy/data_ex.rda")
View(data_ex)

write.csv(data_ex, file="c:/Rstudy/data_ex.csv")
write.table(data_ex, file="C:/Rstudy/data_ex.txt")

# URL: Uniform Resource Locator

# 웹 클라이언트(브라우저)에서 웹 서버에게 요청할 때 
# 함께 전달하는 name과 value로 구성된 문자열을 Query 문자열이라고 한다.
# 이 때 Query 문자열을 서버에게 전달하는 방식은 두 가지가 있다.
# 1. GET 방식: 요청 문자열 뒤에 ? 기호와 함께 추가하여 전달
# 2. POST 방식: 요청 바디안에 들어가며 외부에 공개되지 않는다.