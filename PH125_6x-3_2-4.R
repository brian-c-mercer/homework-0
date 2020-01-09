library(dslabs)
library(tidyverse)
s<-c("70","5 ft","4'11","",".","Six feet")
pattern<-"\\d|ft"
str_view_all(s,pattern)