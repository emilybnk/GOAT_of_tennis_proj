# Analysis
# import data
data <- read_csv("pathname\tennis_data.csv")
data3 <- read_csv("pathname\tennis_data_all_players.csv")

# 1. Illustration why Roger, Rafa and Novak are considered to be the Big 3
count_by_player <- data3%>%
  count(winner_name)

Player <- c("Others", "Big 3")
num_player <- c(nrow(count_by_player)-3, 3)
prop_player <- data.frame(Player, num_player)

count_by_wins <- data3%>%
  count(winner_name=="Roger Federer" | winner_name == "Rafael Nadal" | winner_name == "Novak Djokovic")
prop_wins <- data.frame(Player, count_by_wins$n)

# pie chart proportion player
ggplot(data=prop_player, aes(x="", y=num_player, fill=Player))+
  geom_bar(stat="identity", width=1)+
  coord_polar(theta="y")+
  theme(axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid  = element_blank(),
        axis.title = element_blank()) 

# pie chart proportion wins
ggplot(data=prop_wins, aes(x="", y=count_by_wins.n, fill=Player))+
  geom_bar(stat="identity", width=1)+
  coord_polar(theta="y")+
  theme(axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid  = element_blank(),
        axis.title = element_blank()) 

#------------------------------------------------------------------------------------------------------------------------------
# 2. tournament and GS championships

# df for tournament championships
roger_cc_t <- data$winner_name =="Roger Federer" & data$round =="F"
df_roger_cc_t <- subset(data, roger_cc_t)
rafa_cc_t <- data$winner_name =="Rafael Nadal" & data$round =="F"
df_rafa_cc_t <- subset(data, rafa_cc_t)
novak_cc_t <- data$winner_name =="Novak Djokovic"  & data$round =="F"
df_novak_cc_t <- subset(data, novak_cc_t)
tourn <- subset(data, roger_cc_t | rafa_cc_t | novak_cc_t)
tourn$round <- 1

# df for Grand Slam championship
roger_cc_g <- data$winner_name =="Roger Federer" & data$tourney_level =="Grand Slam" & data$round =="F"
rafa_cc_g <- data$winner_name =="Rafael Nadal" & data$tourney_level =="Grand Slam" & data$round =="F"
novak_cc_g <- data$winner_name =="Novak Djokovic" & data$tourney_level =="Grand Slam" & data$round =="F"
gs <- subset(data,roger_cc_g | rafa_cc_g | novak_cc_g)
gs$round <- 1


# bar plot tournament wins
ggplot(data = tourn, aes(x=winner_name, y=round, fill=tourney_level, label=round)) +
  geom_bar(stat="identity")+
  labs(fill="tournament", y="number of championchips won", x="winner name")

#bar plot GS wins
ggplot(data = gs, aes(x=winner_name, y=round, fill=tourney_name, label=round)) +
  geom_bar(stat="identity")+
  scale_fill_manual(values=c("#00BFC4","#F8766D","#C77CFF","#7CAE00"))+
  labs(fill="tournament", y="number of Grand Slams won", x="winner name")

#------------------------------------------------------------------------------------------------------------------------------
# 3. wins per year
#overall wins
wins_rf <- subset(data, data$winner_name == "Roger Federer")
wins_rn <- subset(data, data$winner_name == "Rafael Nadal")
wins_nd <- subset(data, data$winner_name == "Novak Djokovic")


# create df for the count of wins RF had in each year
by_year_rf <- wins_rf %>%
  count(tourney_date)

# same for RN but add rows for 2000 and 2001 since he had not yet played professional in these years
tourney_date <- c(2000,2001)
n <- c(0,0)
rn <- data.frame(tourney_date, n)
by_year_rn <- wins_rn %>%
  count(tourney_date)
by_year_rn <- rbind(rn,by_year_rn)

# same for ND but add rows for 2000, 2001, 2002 and 2003 since he had not yet played professional in these years
tourney_date <- c(2000,2001,2002,2003)
n <- c(0,0,0,0)
rn <- data.frame(tourney_date, n)
by_year_nd <- wins_nd %>%
  count(tourney_date)
by_year_nd <- rbind(rn,by_year_nd)

# create dataframe
total<-merge(by_year_rf, by_year_rn, by="tourney_date")
total <- merge(total, by_year_nd, by="tourney_date")


# bar plot of overall wins
overall_wins <- ggplot(total, aes(x=tourney_date, group=1))+
  geom_line(aes(y=n.x, color="Roger"))+
  geom_point(aes(y=n.x))+
  geom_line(aes(y=n.y, color="Rafa"))+
  geom_point(aes(y=n.y))+
  geom_line(aes(y=n, color="green"), color="green")+
  geom_point(aes(y=n))  +
  labs(y="number of matches won", x="year")+
  scale_color_manual(name = "player", values = c("Roger"="red","Rafa"="blue","Novak"="green"))
overall_wins

#---------------------------------------------------------------------------------------------------------------------
# 4. comparison time periods
#tournament wins
#2000-2008 
data_00_08 <- subset(tourn, tourney_date=="2000" | tourney_date=="2001" | tourney_date=="2002" | tourney_date=="2003" | tourney_date=="2004" | 
                       tourney_date=="2005" |tourney_date=="2006" |tourney_date=="2007" |tourney_date=="2008")

#2009-2017 
data_09_17 <- subset(tourn, tourney_date=="2009" | tourney_date=="2010" | tourney_date=="2011" | tourney_date=="2012" | tourney_date=="2013" | 
                       tourney_date=="2014" |tourney_date=="2015" |tourney_date=="2016" |tourney_date=="2017")

# preperation for bar plot
data_00_08$round <- 1
data_09_17$round <- 1

# bar plot 2000-2008
ggplot(data = data_00_08, aes(x=winner_name, y=round, fill=tourney_level, label=round)) +
  geom_bar(stat="identity")+
  labs(fill="tournament", y="number of championchips won", x="winner name")


# bar plot 2009-2017
ggplot(data = data_09_17, aes(x=winner_name, y=round, fill=tourney_level, label=round)) +
  geom_bar(stat="identity")+
  labs(fill="tournament", y="number of championchips won", x="winner name")


# bar chart comparison 2000-2008 and 2009-2017
data_00_08$tourney_date <- "2000-2008"
data_09_17$tourney_date <- "2009-2017"

# merge 00_08 and 09_17 for stacked barchart
data_compl <- rbind(data_00_08, data_09_17)

# bar plot comparison
ggplot(data = data_compl, aes(x=winner_name, y=round, fill=tourney_date, label=round)) +
  geom_bar(stat="identity")+
  labs(fill="tournament", y="number of championchips won", x="winner name")


#------------------------------------------------------------------------------------------------------------------------
# 5. Head to Head
# H2H
roger_rafa <- subset(data, winner_name == "Roger Federer" & loser_name == "Rafael Nadal" | loser_name == "Roger Federer" & winner_name == "Rafael Nadal")
roger_novak <- subset(data, winner_name == "Roger Federer" & loser_name == "Novak Djokovic" | loser_name == "Roger Federer" & winner_name == "Novak Djokovic")
rafa_novak <- subset(data, winner_name == "Novak Djokovic" & loser_name == "Rafael Nadal" | loser_name == "Novak Djokovic" & winner_name == "Rafael Nadal")

# preperation for bar plot
roger_rafa$round <- 1
roger_novak$round <- 1
rafa_novak$round <- 1

#pie chart of H2H
# roger rafa
ggplot(roger_rafa, aes(x="", y=round, fill=winner_name))+
  geom_bar(stat="identity", width=1)+
  coord_polar(theta="y")+
  theme(axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid  = element_blank(),
        axis.title = element_blank()) +
  labs(fill="winner")+
  scale_fill_manual(values=(c("Roger Federer"="#00BFC4", "Rafael Nadal"="#7CAE00")))

#roger novak
ggplot(roger_novak, aes(x="", y=round, fill=winner_name))+
  geom_bar(stat="identity", width=1)+
  coord_polar(theta="y")+
  theme(axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid  = element_blank(),
        axis.title = element_blank()) +
  labs(fill="winner")+
  scale_fill_manual(values=(c("Roger Federer"="#00BFC4", "Novak Djokovic"="#F8766D")))

# rafa novak
ggplot(rafa_novak, aes(x="", y=round, fill=winner_name))+
  geom_bar(stat="identity", width=1)+
  coord_polar(theta="y")+
  theme(axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid  = element_blank(),
        axis.title = element_blank()) +
  labs(fill="winner")+
  scale_fill_manual(values=(c("Novak Djokovic"="#F8766D", "Rafael Nadal"="#7CAE00")))



