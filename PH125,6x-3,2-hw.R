library(dslabs)
library(tidyverse)

##4
#s<-c("70","5 ft","4'11","",".","Six feet")
#pattern<-"\\d|ft"
#str_view_all(s,pattern)

##5
#animals <- c("cat", "puppy", "Moose", "MONKEY")
#pattern <- "[a-z]"
#str_detect(animals, pattern)

##6
#animals <- c("cat", "puppy", "Moose", "MONKEY")
#pattern <- "[A-Z]$"
#str_detect(animals, pattern)

##7
#animals <- c("cat", "puppy", "Moose", "MONKEY")
#pattern <- "[a-z]{4,5}"
#str_detect(animals, pattern)

##8
#animals<-c("moose","monkey","meerkat","mountain lion")
#pattern<-"mo*"
#str_detect(animals, pattern)
#pattern<-"mo?"
#str_detect(animals, pattern)
#pattern<-"mo+"
#str_detect(animals, pattern)
#pattern<-"moo*"
#str_detect(animals, pattern)

##9
#schools<-c("U. Kentucky","Univ New Hampshire","Univ. of Massachusetts","University Georgia","U California","California State University")
#final<-c("University of Kentucky","University of New Hampshire","University of Massachusetts","University of Georgia","University of California","California State University")
#schools %>%str_replace("Univ\\.?|U\\.?", "University ")%>%str_replace("^University of |^University ", "University of ")
#str_detect(schools,final)
#schools %>%str_replace("^Univ\\.?\\s|^U\\.?\\s", "University ")%>%str_replace("^University of |^University ", "University of ")
#identical(schools,final)
#schools %>%str_replace("^Univ\\.\\s|^U\\.\\s", "University")%>%str_replace("^University of |^University ", "University of ")
#identical(schools,final)
#schools %>%str_replace("^Univ\\.?\\s|^U\\.?\\s", "University")%>%str_replace("University ", "University of ")
#identical(schools,final)

##10
#problems<-c("5.3", "5,5", "6 1", "5 .11", "5, 12")
#pattern_with_groups<-"^([4-7])[,\\.](\\d*)$"
#str_replace(problems,pattern_with_groups,"\\1'\\2")

##11
#problems <- c("5.3", "5,5", "6 1", "5 .11", "5, 12")
#pattern_with_groups <- "^([4-7])[,\\.\\s](\\d*)$"
#str_replace(problems, pattern_with_groups, "\\1'\\2")

##12

##13
yes<-c("5 feet 7inches","5 7")
no<-c("5ft 9 inches", "5 ft 9 inches")
s<-c(yes, no)

converted <- s %>% 
  str_replace("feet|foot|ft", "'") %>% 
  str_replace("inches|in|''|\"", "") %>% 
  str_replace("^([4-7])\\s*[,\\.\\s+]\\s*(\\d*)$", "\\1'\\2")
pattern <- "^[4-7]\\s*'\\s*\\d{1,2}$"
str_detect(converted, pattern)
converted <- s %>% 
  str_replace("\\s*(feet|foot|ft)\\s*", "'") %>% 
  str_replace("\\s*(inches|in|''|\")\\s*", "") %>% 
  str_replace("^([4-7])\\s*[,\\.\\s+]\\s*(\\d*)$", "\\1'\\2")
pattern <- "^[4-7]\\s*'\\s*\\d{1,2}$"
str_detect(converted, pattern)
