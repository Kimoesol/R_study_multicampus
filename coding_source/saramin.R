library("rvest")
library("httr")
http.standard = GET('http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=DATA%20SCIENTIST')
tech_name = html_nodes(read_html(http.standard),'label > span.txt')
tech_name = html_text(tech_name)
tech_name = gsub("#","",tech_name)
tech_name = tech_name[1:30]
tech_name

info_count = html_nodes(read_html(http.standard),'label > span.count')
info_count = html_text(info_count)
info_count = gsub("[()]","",info_count)
info_count = as.numeric(info_count)
info_count

page = data.frame(tech_name, info_count)
write.csv(page, 'saramin.csv')
