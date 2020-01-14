library(tidyverse)
library(pdftools)
library(stringr)
options(digits = 3)    # report 3 significant digits
#1
fn<-system.file("extdata", "RD-Mortality-Report_2015-18-180531.pdf", package="dslabs")
#system("cmd.exe", input = paste("start", fn))
#2
txt<-pdf_text(fn)
txt
#3
x<-str_split(txt[9],"\n")
#length(x)
#class(x)
#4
s<-x[[1]]
#class(s)
#length(s)
#s
#5
s<-str_trim(s,side = c("both", "left", "right"))
s
#6
header_index<-str_which(s,"2015")[1]
header_index
#7
header<-s[2]
header<-str_split(header,"\\s+")
header
month<-"SEP"
header<-c("2015","2016","2017","2018")
#month
#header
#8
tail_index<-str_which(s,"Total")
#tail_index
#9
n<-str_count(s,"^\\d+$")
#n
sum(n)
#10
tail_index-sum(n)-header_index-1
#11
#ss<-str_remove_all(s,"[^\\d]")
#ss
#ss<-str_remove_all(s,"[\\d\\s]")
#ss
s<-str_remove_all(s,"[^\\d\\s]")
s
#ss<-str_remove_all(s,"[\\d]") 
#ss
#12
s<-str_split_fixed(s,"\\s+",n=6)[,1:5]
class(s)<-"numeric"
s%>%setNames(colnames(c("day","2015","2016","2017","2018")))
tab<-
2258/30
olddata<-c(94,69,80,84,74,83,87,94,72,98,92,80,100,79,84,80,88,78,75)
sum(olddata)/19
newdata<-c(106,124,110,109,122,137,132,122,112,131,132)
sum(newdata)/11
#13
tab <- tab %>% _____(year, deaths, -day) %>%
  mutate(deaths = as.numeric(deaths))
tab
#14









