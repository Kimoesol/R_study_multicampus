site <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
navercomic <- NULL
i <- 0
repeat{
  i <- i + 1
  url <- paste(site,i,sep="")
  text <- read_html(url)
  nodes <- html_nodes(text, "div.challengeInfo > h6 > a")
  comicName <- html_text(nodes,trim=T)
  nodes <- html_nodes(text, "div.challengeInfo > div.summary")
  comicSummary <- html_text(nodes, trim=T)
  nodes <- html_nodes(text, "div.challengeInfo > div.rating_type > strong")
  comicGrade <- html_text(nodes, trim=T)
  comic <- data.frame(comicName, comicSummary, comicGrade)
  navercomic <- rbind(navercomic,comic)
  if(length(comicName)<24){break}
}
write.csv(navercomic, "navercomic.csv")