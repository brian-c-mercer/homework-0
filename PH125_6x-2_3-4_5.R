library(rvest)
library(dplyr)
library(tidyverse)
url<-"https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"
h<-read_html(url)
tab<-html_nodes(h, "table")
#problem 1
tab
tab[[1]]%>%html_table(fill=TRUE)%>%as_tibble()
tab[[2]]%>%html_table(fill=TRUE)%>%as_tibble()
tab[[3]]%>%html_table(fill=TRUE)%>%as_tibble()
tab[[4]]%>%html_table(fill=TRUE)%>%as_tibble()
tab[[5]]%>%html_table(fill=TRUE)%>%as_tibble()
tab[[6]]%>%html_table(fill=TRUE)%>%as_tibble()
tab[[7]]%>%html_table(fill=TRUE)%>%as_tibble()
tab[[8]]%>%html_table(fill=TRUE)%>%as_tibble()