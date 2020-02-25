# httr 패키지의 post 방식 사용해야 함(반드시 form태그를 써야 함)
library(rvest)
library(httr)
unico2013 = POST('http://unico2013.dothome.co.kr/crawling/post.php',
            encode='form', body=list(name="R", age="27"))
# 전달하고자 하는 것을 name = value 형식으로

unico2013_1 = html_nodes(read_html(unico2013), 'h1')
unico2013_2 = html_text(unico2013_1)
unico2013_2