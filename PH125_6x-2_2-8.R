library(Lahman)
compare_awards<-AwardsPlayers%>%filter(yearID == 2016)
top <- Batting %>% 
  filter(yearID == 2016) %>%
  arrange(desc(HR)) %>%    # arrange by descending HR count
  slice(1:10)    # take entries 1-10
semi_join(top,compare_awards)
short_list<-anti_join(compare_awards,top)
short_list
intersect(short_list$playerID,Master$playerID)