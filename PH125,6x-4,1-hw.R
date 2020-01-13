library(tidyverse)
library(dslabs)
library(lubridate)

#1

#2

#3
#data("brexit_polls")
#head(brexit_polls)

#brexit_polls%>%filter(month(startdate)==4)

#brexit_polls%>%
  #mutate(roundenddate=round_date(enddate,unit="week",week_start = 7))%>%
  #filter(roundenddate==ymd("2016-06-12"))

#4
#brexit_polls%>%
  #mutate(endweekday=weekdays(enddate,TRUE))%>%
  #ggplot(aes(endweekday))+
  #geom_bar()

#5
#data(movielens)
#head(movielens)

#movielens%>%mutate(reviewyear=year(as_datetime(timestamp)))%>%
  #ggplot(aes(reviewyear))+
  #geom_bar()

#movielens%>%mutate(reviewhour=hour(as_datetime(timestamp)))%>%
  #ggplot(aes(reviewhour))+
  #geom_bar()

#6
library(tidyverse)
library(gutenbergr)
library(tidytext)
library(dslabs)
options(digits = 3)

#str_detect(gutenberg_metadata$title,"Pride and Prejudice")%>%
  #table()

#7
#gutenberg_works(title=="Pride and Prejudice",languages = "en",distinct=FALSE)

#8
words<-gutenberg_download(1342)%>%unnest_tokens(word,text)
#count(words)

#test
#library(gutenbergr)
#library(tidytext)
#count((gutenberg_download(gutenberg_works(title=="Pride and Prejudice",languages = "en",distinct=TRUE)))%>%unnest_tokens(word,text))

#9
words<-words%>%filter(!word %in% stop_words$word)
#words
#! means negated

#10
words<-words%>%filter(!str_detect(word, "^\\d+"))
#words
#^ is start of string, \ to exit, \d for digit, + for any number

#11
#words%>% 
  #count(word)%>%
  #arrange(desc(n))%>%
  #filter(n>=100)

#12
afinn<-get_sentiments("afinn")
afinn_sentiments<-words%>%
  inner_join(afinn,by ="word")
afinn_sentiments

posafinn<-afinn_sentiments%>%
  filter(value>0)
count(posafinn)/count(afinn_sentiments)

afinn_sentiments%>%
  filter(value==4)

