# GOAT_of_tennis_proj
Data analytics project to determine the greatest of all time in tennis

## 1 Introduction

After every Grand Slam won by one of the “Big 3” (Roger Federer, Rafael Nadal and Novak Djokovic) there is a discussion who the greatest of all time (GOAT) is. In the upcoming steps this question will be investigated.

### 1.1 Questions
The following questions will guide threw the analysis:

* Who has won the most Grand Slams?
* Who has won the most tournaments?
* Who is the best player regarding the surface?
* How are their head-to-head performances?

It should also be taken into account that they are not the same age and started playing professionally at different times. Therefore, a small analysis will take place on who is the best player in which year or at which period of time.

### 1.2 About the data
I used a data set from kaggle called “Association of Tennis Professionals Matches”. Each year (2000 - 2017) has its own spreadsheet table - therefore, there are 18 files. Each data set has 49 columns, which are not all needed. I will name the remaining columns after the cleaning process. 
The data has a CC BY-NC-SA 4.0 license.

## 2 Prepare and Process

* Firstly, I combined all datasets into one dataframe
* Then, I deleted xx columns. The following columns remained:
  * tourney_name, 
  * tourney_level, 
  * tourney_date, 
  * winner_name, 
  * loser_name and
  * round
* Then, I shortened the match date from yyyymmdd to yyyy because only the year is important
*	Then, I replaced the abbreviations for the tournament level with its real name
*	After that I deleted every row where neither the winner nor the loser was one of the Big 3



## 3 Analyze and Share
As a small entry into the topic, I created these visualizations to show why either Roger, Rafa and Novak are considered to be the GOAT. (I did that in between the cleaning process). They make up 0,2 % of the players which played a match in these years but won about 5 % of the matches.

<img src = "https://github.com/emilybnk/GOAT_of_tennis_proj/blob/main/proportion_players.png" width="300">   <img src = "https://github.com/emilybnk/GOAT_of_tennis_proj/blob/main/proportion_wins.png" width="300">

<sub>*Figure 1: share of the Big 3 in the number of players (left); share of the wins of the Big 3 in the number of wins of all players (right)* </sub>

For the main part of the analysis, let's start with the overall tournament wins:

<img src = "https://github.com/emilybnk/GOAT_of_tennis_proj/blob/main/tournament_wins.png" width="300">

<sub>*Figure 2: Number of championships per player. The tournament type is subdivided in four categories*</sub>

Following, the Grand Slam wins of each player:

<img src = "https://github.com/emilybnk/GOAT_of_tennis_proj/blob/main/Grand_Slam_wins.png" width="300">

<sub>*Figure 3: Number of Grand Slam championships of each player*</sub>

Next, the match wins of each player per year.

<img src = "https://github.com/emilybnk/GOAT_of_tennis_proj/blob/main/over_the_years.png" width="500">

<sub>*Figure 4: Match wins of each player per year*</sub>

As we can see Rafa began to play in 2002 and Novak in 2004. So there are a lot of tournaments they missed. Let's investigate the players in two time periods: 

* 2000-2008
* 2009-2017


<img src = "https://github.com/emilybnk/GOAT_of_tennis_proj/blob/main/2000_2008.png" width="300" height="250"> <img src = "https://github.com/emilybnk/GOAT_of_tennis_proj/blob/main/2009_2017.png" width="300" height="250"> <img src = "https://github.com/emilybnk/GOAT_of_tennis_proj/blob/main/years_comparison.png" width="300" height="250">

<sub>*Figure 5: Number of championships won per player for the years 2000-2008 (left), 2009-2017 (middle), ordered by time period (right)* </sub>

And lastly their head to head performances:

<img src = "https://github.com/emilybnk/GOAT_of_tennis_proj/blob/main/roger_rafa.png" width="300"> <img src = "https://github.com/emilybnk/GOAT_of_tennis_proj/blob/main/roger_novak.png" width="300">  <img src = "https://github.com/emilybnk/GOAT_of_tennis_proj/blob/main/rafa_novak.png" width="300">

<sub>*Figure 6: Roger Federer vs. Rafael Nadal match wins (left), Roger Federer vs Novak Djokovic (middle), Novak Djokovic vs. Rafael Nadal (right)</sub>

## 4 Conclusion
As we can see Roger has won the most Grand Slam titles and generally the most tournaments. He also has own the most Wimbledon and Us Open titles. In 2006 he won more matches than anyone of the Big 3 ever won in one year. However, he has the worst H2H performance since he has lost more matches against Rafa and Novak respectivly than he has won. 
Novak Djokovic won the most Masters 1000 titles and has the best H2H performance (He has a positive record against both players). He has won the most Australien Open titles. 
Rafael Nadal has won the most French Open titles. With these 9 titles he is also the player with the most championships in one single Grand Slam tournament.
Over the underlying time period Roger Federer seems most likely to be the GOAT, followed by Novak Djokovic. However most of Roger’s successes took place in 2000-2008. Novak Djokovic and Rafael Nadal both won more matches in 2009-2017 (especially Novak). Therefore, the discussion of the GOAT is not over yet.

## 5 Outlook
This dataset only has data up to the year 2017. In the meantime especially Rafa and Novak won many more tournaments. At the moment Rafa is the leading player regarding the Grand Slam wins, followed by Novak. Therefore, an analysis with updated data would be useful.
