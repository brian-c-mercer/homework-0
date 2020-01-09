library(rvest)
library(tidyverse)
library(stringr)

##1
# <- c("5'10", "6'1\"", "5'8inches", "5'7.5")
#extract(data = tab, col = x, into = c("feet", "inches", "decimal"), regex = "(\\d)'(\\d{1,2})(\\.\\d+)?")   

##2
#day<-c("Monday","Tuesday")
#staff<-c("Mandy, Chris and Laura","Steve, Ruth and Frank")
#schedule<-data.frame(day,staff)
#str_split(schedule$staff, ",|and")
#str_split(schedule$staff, ", | and ")
#str_split(schedule$staff, ",\\s|\\sand\\s")
#str_split(schedule$staff, "\\s?(,|and)\\s?") 

##3
#tidy <- schedule %>% 
#  mutate(staff = str_split(staff, ", | and ")) %>% 
#  unnest()
#tidy

##4
#head(gapminder)
#dat <- gapminder %>% filter(region == "Middle Africa") %>% 
#mutate(country_short = recode(country, "Central African Republic" = "CAR","Congo, Dem. Rep." = "DRC","Equatorial Guinea" = "Eq. Guinea"))
#dat

##5
url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"
tab <- read_html(url) %>% html_nodes("table")
polls <- tab[[5]] %>% html_table(fill = TRUE)
col_names<-c("dates","remain","leave","undecided","lead","samplesize","pollster","poll_type","notes")
polls<-polls%>%setNames(col_names)%>%filter(str_detect(remain,"%",FALSE))

##6
#wrong test6<-as.numeric(str_remove(polls$remain, "%"))
#test6
#wrong test6<-as.numeric(polls$remain)/100
#test6
#wrong test6<-parse_number(polls$remain)
#test6
#wrong test6<-str_remove(polls$remain, "%")/100
#test6
#test6<-as.numeric(str_replace(polls$remain, "%", ""))/100
#test6
#test6<-parse_number(polls$remain)/100
#test6

##7
#function_name(polls$undecided, "arg1", "arg2")
str_replace(polls$undecided,"N/A","0")

##8
#wrong
test8<-"\\d?\\s[a-zA-Z]?"
temp<-str_extract_all(polls$dates,test8)
end_date<-sapply(temp, function(x) x[length(x)]) # take last element (handles polls that cross month boundaries)
head(end_date)

test8<-"\\d+\\s[a-zA-Z]+"
temp<-str_extract_all(polls$dates,test8)
end_date<-sapply(temp, function(x) x[length(x)]) # take last element (handles polls that cross month boundaries)
head(end_date)

#wrong
test8<-"\\d+\\s[A-Z]+"
temp<-str_extract_all(polls$dates,test8)
end_date<-sapply(temp, function(x) x[length(x)]) # take last element (handles polls that cross month boundaries)
head(end_date)

test8<-"[0-9]+\\s[a-zA-Z]+"
temp<-str_extract_all(polls$dates,test8)
end_date<-sapply(temp, function(x) x[length(x)]) # take last element (handles polls that cross month boundaries)
head(end_date)

test8<-"\\d{1,2}\\s[a-zA-Z]+"
temp<-str_extract_all(polls$dates,test8)
end_date<-sapply(temp, function(x) x[length(x)]) # take last element (handles polls that cross month boundaries)
head(end_date)

#wrong
test8<-"\\d{1,2}[a-zA-Z]+"
temp<-str_extract_all(polls$dates,test8)
end_date<-sapply(temp, function(x) x[length(x)]) # take last element (handles polls that cross month boundaries)
head(end_date)

test8<-"\\d+\\s[a-zA-Z]{3,5}" 
temp<-str_extract_all(polls$dates,test8)
end_date<-sapply(temp, function(x) x[length(x)]) # take last element (handles polls that cross month boundaries)
head(end_date)
