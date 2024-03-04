
rm(list = ls())

library(tidyverse)

# load data

blackturnout <- read.csv("data/blackturnout.csv")

names(blackturnout)

# tidy your data


blackturnout$candidate_f <- factor(blackturnout$candidate,
                                   levels=0:1,
                                   labels=c("No","Yes"))

blackturnout$district <- factor(blackturnout$district)
blackturnout$state <- factor(blackturnout$state)
blackturnout$year_f <- factor(blackturnout$year)


###### Question 1 (with base R):---------------------------------------------

dim(blackturnout)

head(blackturnout)

summary(blackturnout)

levels(blackturnout$year_f)

levels(blackturnout$state)


###### Question 2 (with base R):------------------------------------


boxplot(turnout ~ candidate_f, data = blackturnout,
        ylab = "Voter turnout (black voters)",
        xlab = "One or more co-ethnic candidates")



###### Question 2 (with dplyr):------------------------------------

ggplot(data=blackturnout, 
       aes(y=turnout,
           x=candidate_f,
           fill=candidate_f)) +
  geom_boxplot() +
  theme_bw()


# small-multiples by state

ggplot(data=blackturnout, 
       aes(y=turnout,
           x=candidate_f,
           fill=candidate_f)) +
  geom_boxplot() +
  theme_bw() +
  facet_wrap(~state)

# small-multiples by years

ggplot(data=blackturnout, 
       aes(y=turnout,
           x=candidate_f,
           fill=candidate_f)) +
  geom_boxplot() +
  theme_bw() +
  facet_wrap(~year_f)



###### Question 3 (with base R):------------------------------------------

fit.1 <- lm(turnout ~ candidate, data = blackturnout)
fit.1

summary(fit.1)

# The intercept is 0.394 which means that in elections featuring no black candidates, 39.4% of the black
# voting-age population are predicted to turn out. The coefficient on the candidate co-ethnicity variable is
# 0.062, which means that in elections with a black candidate black voter turnout is predicted to be about 6.2
# percentage points higher on average. Thus, in elections featuring at least one black candidate, black voter
# turnout is predicted to be 45.6%. These results are consistent with the prediction that black voters turn out
# at a higher rate when a co-ethnic candidate is running.


###### Question 4 (with base R):-----------------------------------------

blackturnout$col[blackturnout$candidate == 0] <- "blue"
blackturnout$col[blackturnout$candidate == 1] <- "red"

plot(blackturnout$CVAP, blackturnout$turnout, col = blackturnout$col,
     xlab = "Co-ethnic Voting-Age Population", ylab = "Black Voter Turnout")
legend(.37, .95, legend = c("Co-ethnic Candidate", "No Co-ethnic Candidates"),
       col = c("red", "blue"), pch = c(1, 1))

###### Question 4 (with dplyr):-----------------------------------------


ggplot(data=blackturnout, aes(y = turnout, x = CVAP, color = candidate_f)) +
  geom_point(shape = 1) +
  theme_bw() +
  scale_color_manual(values = c("blue", "red"),
                     labels = c("No Co-ethnic Candidate", "Co-ethnic Candidates"),
                     name = "Candidate") +
  labs(title = "Black Voter Turnout Conditional on Co-ethnic Candidate",
       x = "Co-ethnic Voting-Age Population",
       y = "Black Voter Turnout") +
  theme(legend.position = c(0.8, 0.9),
        legend.box.background = element_rect(color = "black", 
                                             fill = "transparent"))


# The scatter plot shows two important things. First, it shows that black candidates often run in districts
# that have large black voting-age populations. Second, it shows that there is a positive relationship between
# black voting age population and black voter turnout (the correlation is 0.17). Therefore, co-ethnic voting age
# population might be an important variable to include in the analysis.


###### Question 5 (with base R):-----------------------------------------


fit.2 <- lm(turnout ~ candidate + CVAP, data = blackturnout)
fit.2

summary(fit.2)

# The coefficient of candidate co-ethnicity is -0.007, meaning that holding co-ethnic voting-age population at a
# fixed value, elections featuring a black candidate having lower black voter turnout by -0.7 percentage points
# on average.

# CVAP co-ethnic measures voting age participation in decimals. Therefore, one point of increase in the model represents 
# 100% of the co-ethnic voting-age population, something unplausible as it extrapolates the marginal effect of CVAP.

# The coefficient on co-ethnic voting-age population is 0.21. This indicates that if the proportion of a district is
# greater by 10 percentage points (i.e., 20% rather than 10% black), the black turnout is 2 percentage-point
# greater on average. In a 100%-black district featuring no black candidates, the average black voter turnout is
# predicted to be around 59%.

###### Question 6:-----------------------------------------

# The intercept is 0.375. This means that the model predicts that elections featuring no black candidates in
# districts with no black people, black voter turnout will be 37.5 on average. This is obviously impossible:
# districts with no black people will not have any black voters.

# This example illustrates that your regression might not be useful for predicting the outcome under certain
# scenarios.




###### Question 7:-----------------------------------------

# In the model with one predictor, black voter turnout is predicted to be higher in elections with one or more
# co-ethnic candidates. In the model with two predictors, the opposite is true. That is, in the two predictor
# model, elections with one or more black candidates are predicted to have slightly lower turnout. This second
# model is consistent with Fraga’s claim.

# This is an example of a more general phenomenon where including a third variable could change the
# relationship between two variables. This is closely related to omitted variable bias.



#########################################
















