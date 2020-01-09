library(rvest)
library(dplyr)
library(tidyverse)
url <- "https://web.archive.org/web/20181024132313/http://www.stevetheump.com/Payrolls.htm"
h <- read_html(url)
nodes <- html_nodes(h, "table")
#html_text(nodes[[8]])
#problem 1
#tab1<-nodes[[1]]%>%html_table()
#tab1
#tab2<-nodes[[2]]%>%html_table()
#tab2
#tab3<-nodes[[3]]%>%html_table()
#tab3
#problem 2
#nodes #check result for qty of nodes
#nodes[[19]]%>%html_table()
#nodes[[20]]%>%html_table()
#nodes[[21]]%>%html_table()
#problem 3
tab_1<-nodes[[10]]%>%html_table()%>%select(-"X1")
tab_1<-tab_1[-1,]%>% setNames(c("Team", "Payroll", "Average"))
tab_1
tab_2<-nodes[[19]]%>%html_table()
tab_2<-tab_2[-1,]%>% setNames(c("Team", "Payroll", "Average"))
tab_2
full_join(tab_1,tab_2,"Team")