# Prepare and Process

library(tidyverse)

# read 2000 data
data <- read_csv("pathname\atp_matches_2000.csv")
dir <- "pathname"
files <- list.files(path=dir, pattern='.csv', full.names = TRUE)

# add 2001-2017 data so it is one dataframe
for (file in files){
  data2 <- read_csv(file)
  data2 <- mutate(data2, across(match_num, as.character)) # somehow match_num was not the same datatype over the different datasets
  data2 <- mutate(data2, across(l_bpFaced, as.integer))   # same for l_bpFaced
  data <- bind_rows(data, data2)
}

# shorten match data to yyyy
data$tourney_date <- substr(data$tourney_date,1,4)

# replace shorts for tournament level with real name
data["tourney_level"][data["tourney_level"] =="F"] <- "ATP Finals"
data["tourney_level"][data["tourney_level"] =="A"] <- "Other"
data["tourney_level"][data["tourney_level"] =="G"] <- "Grand Slam"
data["tourney_level"][data["tourney_level"] =="M"] <- "Master 1000"


# keep only necessary columns
data <- select(data, c(tourney_name, tourney_level, tourney_date, winner_name, loser_name, round))

# for introductory visualizations
data3 <- data

# delete rows where neither the winner was one of the Big 3 nor the loser
data <- subset(data, data$winner_name == "Roger Federer" | data$winner_name == "Rafael Nadal" | data$winner_name == "Novak Djokovic" | data$loser_name == "Roger Federer" | data$loser_name == "Rafael Nadal" | data$loser_name == "Novak Djokovic")

# safe df and write to csv
write.csv(data,"pathname\tennis_data.csv", row.names = FALSE)
write.csv(data3,"pathname\tennis_data_all_players.csv", row.names = FALSE)
