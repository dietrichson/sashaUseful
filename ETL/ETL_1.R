# Fetch and format states by population
library(tidyverse)
myData <- read.csv("data/states by population.csv",stringsAsFactors = FALSE)


tmp <- myData %>% select(State,year10) %>%
  rename(Population=year10)

myStates <- data.frame(State=state.name,abb=state.abb )
tmp <- tmp %>%
  left_join(myStates)
tmp$abb <- tmp$abb %>% as.character()
##Add back PR and DC
tmp[which(tmp$State=="District of Columbia"),"abb"] <- "DC"
tmp[which(tmp$State=="Puerto Rico"),"abb"] <- "PR"

states_by_population <- tmp
save(states_by_population,file = 'data/states_by_population.RData')
