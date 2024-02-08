
rm(list = ls())

library(tidyverse)

# load data

df <- read_csv(file = "data/boston.csv")


###: Question 1:---------------------------------------------

names(df)

# Show that the treatment and control groups are balanced respect of income


## create two subsets
df_treat <- subset(df, treatment == 1)
df_ctrl <- subset(df, treatment == 0)


summary(df_treat$income)
summary(df_ctrl$income)


median(df_treat$income) -  median(df_ctrl$income) # balanced income

# proportion of males

mean(df_treat$male)

mean(df_ctrl$male)

mean(df_treat$male) - mean(df_ctrl$male) # short imbalance of almost 6%


# Extra: visualize both distributions with ggplot

df %>% 
  mutate(treatment=factor(treatment,
                          levels=c(0,1),
                          labels=c("control","treatment"))) %>% 
  ggplot(aes(x=income/10000,
             group=treatment,
             color=treatment,
             fill=treatment)) +
  # density plot
  geom_density(alpha=0.5) +
  # set a theme
  theme_minimal()


###: Question 2:---------------------------------------------

## compute change in attitude

df$change <- df$numberim.post - df$numberim.pre

treat_change <- mean(df$change[df$treatment == 1],
                     na.rm = TRUE)
ctrl_change <- mean(df$change[df$treatment == 0],
                    na.rm = TRUE)

## average treatment effect

treat_change - ctrl_change


###: Question 3:---------------------------------------------

trt_col_change <- mean(df$change[df$treatment == 1 &
                                   df$college == 1],
                       na.rm = TRUE)

ctrl_col_change <- mean(df$change[df$treatment == 0 &
                                    df$college == 1],
                        na.rm = TRUE)

trt_nocol_change <- mean(df$change[df$treatment == 1 &
                                     df$college == 0],
                         na.rm = TRUE)

ctrl_nocol_change <- mean(df$change[df$treatment == 0 &
                                      df$college == 0],
                          na.rm = TRUE)

# alternatively, with tapply

tapply(df$change,list(df$treatment,df$college),mean,na.rm=TRUE)


(ate_col <- trt_col_change - ctrl_col_change) 

# ATE among college educated is of 0.3014

(ate_nocol <- trt_nocol_change - ctrl_nocol_change)

# ATE among non-college educated is of 0.2857

ate_col - ate_nocol

# The difference between those is 0.0157, a negligible effect.


###: Question 4:---------------------------------------------

## create age quartiles

qrt <- quantile(df$age, probs = seq(from = 0, to = 1, by = 0.25))

df$age.qrt <-
  ifelse(df$age <= qrt[2], 1,
         ifelse(df$age > qrt[2] & df$age <= qrt[3], 2,
                ifelse(df$age > qrt[3] & df$age <= qrt[4], 3,
                       ifelse(df$age > qrt[4], 4, 
                              NA))))

## treatmemnt group change by age
t.age.change <- tapply(df$change[df$treatment == 1],
                       df$age.qrt[df$treatment == 1], mean,
                       na.rm = TRUE)

## control group change by age
c.age.change <- tapply(df$change[df$treatment == 0],
                       df$age.qrt[df$treatment == 0], mean,
                       na.rm = TRUE)

ate.age <- t.age.change - c.age.change

ate.age


plot(ate.age)

## treatment group change by ideology
t.idea.change <- tapply(df$change[df$treatment == 1],
                        df$ideology[df$treatment == 1],
                        mean, na.rm = TRUE)
## control group change by ideology
c.idea.change <- tapply(df$change[df$treatment == 0],
                        df$ideology[df$treatment == 0],
                        mean, na.rm = TRUE)

ate.idea <- t.idea.change - c.idea.change
ate.idea


#########################################
















