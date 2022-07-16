# GOAT_of_tennis_proj
Data analytics project to determine the greatest of all time in tennis

## 1 Introduction / Ask

After every Grand Slam won by one of the "Big 3" (Roger Federer, Rafael Nadal and Novak Djokovic) there is a discussion who the greatest of all time (GOAT) is. In the upcoming steps this question will be investigated.

### 1.1 Problems
The upcoming questions will guide threw the analysis

* Who has won the most Grand Slams?
* Who has won the most tournaments?
* Who is the best player regarding the surface?
* How are their Head to Head performances?

It should also be taken into account that they are not the same age and started playing professionally at different times. Therefore, a small analysis will take place on who is the best player in which year or at which period of time.

### 1.2 About the data
I used a data set from kaggle called "Association of Tennis Professionals Matches". Each year (2000 - 2017) has its own data set - therefore, there are 18 data sets. Each data set has 49 columns, which are not all needed. I will name the remaining columns after the cleaning process. 
The data has a CC BY-NC-SA 4.0 license.

## 2 Prepare + Process

* Firstly, I combined all datasets into one dataframe
* Then I deleted xx columns. The following columns remained:
  * tourney_name, 
  * tourney_level, 
  * tourney_date, 
  * winner_name, 
  * loser_name and
  * round
* Then, I shortened the match date from yyyymmdd to yyyy because only the year is important
* Then I replaced the short terms for the tournament level with the real name
* After that I deleted every row where neither the winner was one of the Big 3 nor the loser


## 3 Analyze and share
As a small entry into the topic, I created these visualizations to show why either Roger, Rafa and Novak are considered to be the GOAT. (I did that in between the cleaning process). They make up 0,2 % of the players which played a match in these years but won about 5 % of the matches.

For the main part of the analysis. let's start with the overall tournament wins:

As we see Roger has won the most Grand Slams, ATP Finals and "Other". Novak has won the most Masters 1000.

Here are the Grand Slam wins of each player:


Let's have a look at the match wins of each player per year.

As we can see Rafa began to play in 2002 and Novak in 2004. So there are a lot of tournaments they missed. Let's investigate the players in two time periods: 

* 2000-2008
* 2009-2017

And lastly their head to head performances:


## 4 Conclusion (act)
As we can see Roger has won the most Grand Slam titles and generally the most tournaments. He also has own the most Wimbledon and Us Open titles. In 2006 he also won the most matches anyone of the Big 3 ever won in one year. However, he has the worst H2H performance since he has lost more matches against Rafa and Novak respectivly than he has won.
Novak Djokovic won the most Masters 1000 titles and has the best H2H performance (He has a positive record against both players). He has won the most Australien Open titles.
Rafael Nadal has won the most French Open titles. With these 9 titles he is also the player with the most championships in one single Grand Slam tournament.

Over this time period Roger Federer seems most likely to be the GOAT, followed by Novak Djokovic. However most of Roger's successes took place in 2000-2008. Novak Djokovic and Rafael Nadal both won more matches in 2009-2017 (especially Novak). Therefore, the discussion of the GOAT is not over yet.

## Outlook
This dataset only has data up to the year 2017. In the meantime especially Rafa and Novak won many more tournaments. At the moment Rafa is the leading player regarding the Grand Slam wins, followed by Novak. Therefore, an analysis with updated data would be useful. 
