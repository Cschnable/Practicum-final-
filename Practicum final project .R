getwd()
library(readr)
read.csv("nfl_elo_latest (1).csv")
nfl_elo=read.csv("nfl_elo_latest (1).csv")
View(nfl_elo)

#I am deleting the "date", "season", and "neutral" columns because of the errors in formatting and I felt that this information was not important for my analysis. 
nfl_elo2<-subset(nfl_elo,select = -c(date,season,neutral))
View(nfl_elo2)

#I renamed the elo probability columns to match the rest of the columns with the number coming next to elo. 
library(dplyr)
new_nfl_elo<-rename(nfl_elo2, elo1_prob = elo_prob1, elo2_prob = elo_prob2)
View(new_nfl_elo)

#I am now filling in some of the missing data that I have readily available. This will make less outliers and a mostly complete dataset. 
new_nfl_elo$team2[9:9]<-"CHI"
new_nfl_elo$team1[131:131]<-"ARI"
new_nfl_elo$team2[131:131]<-"MIA"
new_nfl_elo$team2[182:182]<-"OAK"
new_nfl_elo$team1[239:239]<-"GB"
new_nfl_elo$team1[249:249]<-"LAR"
new_nfl_elo$team1[269:269]<-"KC"
new_nfl_elo$team2[269:269]<-"TB"
new_nfl_elo$qb1[268:268]<-"Patrick Mahomes"
new_nfl_elo$qb1[269:269]<-"Patrick Mahomes"
new_nfl_elo$qb2[269:269]<-"Tom Brady"
new_nfl_elo$score1[267:267]<-26
new_nfl_elo$score2[267:267]<-31
new_nfl_elo$score1[268:268]<-38
new_nfl_elo$score2[268:268]<-24
new_nfl_elo$score1[269:269]<-9
new_nfl_elo$score2[269:269]<-31
new_nfl_elo$score1[253:253]<-38
new_nfl_elo$score2[158:158]<-31
new_nfl_elo$score1[158:158]<-28
new_nfl_elo$score1[49:49]<-28
new_nfl_elo$score1[101:101]<-16

View(new_nfl_elo)

library(ggplot2)
#Computing a histogram of QB 1 and 2 values pre and post game.
qplot(new_nfl_elo$qb1_game_value,geom="histogram")
qplot(new_nfl_elo$qb2_game_value,geom="histogram")
qplot(new_nfl_elo$qb1_value_post,geom="histogram")
qplot(new_nfl_elo$qb2_value_post,geom="histogram")




