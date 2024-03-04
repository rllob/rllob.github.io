
rm(list = ls())

library(tidyverse)

# load data

df <- read_csv(file = "data/draft.csv")

names(df)


# tidy your data

df_c <- na.omit(df)

questionr::freq.na(df)


###### Question 1:---------------------------------------------


ido_table <- table(df_c$ideology)
ido_barplot <- barplot(ido_table,
                       main = 'Distribution of Ideology',
                       xlab = 'Ideology',
                       ylab = 'Count',
                       names.arg = c('Very Con.', 'Con.', 'Moderate',
                                     'Lib.', 'Very Lib.'))
text(ido_barplot, ido_table - 17, ido_table, font=2)


###### Question 2:---------------------------------------------


df_c$liberal = ifelse(df_c$ideology >=4, 1, 0)

round(tapply(df_c$liberal, df_c$year, mean), digits = 3)


###### Question 3:---------------------------------------------

treat.ideol <- mean(df_c$liberal[df_c$draft == 1])
treat.ideol  #proportion of "liberal" among treatment


contrl.ideol <- mean(df_c$liberal[df_c$draft == 0])
contrl.ideol #proportion of "liberal" among control

treat.ideol - contrl.ideol # SATE

###### Question 4:---------------------------------------------

#lib proportion by treatment and control in Colorado
treat.ideol.col <- mean(df_c$liberal[df_c$draft == 1 &
                                      df_c$state == "CO"])
contrl.ideol.col <- mean(df_c$liberal[df_c$draft == 0 &
                                       df_c$state == "CO"])
ate.colorado <-treat.ideol.col - contrl.ideol.col
ate.colorado #SATE of draft status on liberal ideology for Colorado

#lib proportion by treatment and control in Oregon
treat.ideol.ore <- mean(df_c$liberal[df_c$draft == 1 &
                                      df_c$state == "OR"])
contrl.ideol.ore <- mean(df_c$liberal[df_c$draft == 0 &
                                       df_c$state == "OR"])
ate.oregon <- treat.ideol.ore - contrl.ideol.ore
ate.oregon #SATE of draft status on liberal ideology for Oregon:



#########################################
















