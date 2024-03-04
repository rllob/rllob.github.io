
rm(list = ls())


library(questionr)
library(tidyverse)

# load data

wb <- read_csv("data/world_bank.csv")
polity <- read_csv("data/polity.csv")


names(wb)
names(polity)


# tidy your data


###### Question 1 (with base R):---------------------------------------------


dim(wb)

dim(polity)

# calculate missingness with questionr

freq.na(wb)

# calculate missingness for vars in wb without loop

wb_na <- ifelse(is.na(wb), 1, 0)

colMeans(wb_na)


# We have more than 10,000 observations for each dataset. However, we do have quite a lot of missing data.
# Identifying information for the row, like the country’s name and the year, is nearly always present. However,
# the more interesting data on GDP and infant mortality are missing nearly 20% of the time.


###### Question 2 (with base R):------------------------------------

#subset
polity <- subset(polity,
                 subset = (year >= 1970 & year <= 2015),
                 select = c("scode", "year", "polity"))
# rename
colnames(polity) <- c("country_code", "year", "polity")
# merge
wb_polity <- merge(wb, polity, by = c("country_code", "year"))


###### Question 3 (with base R):------------------------------------------

# missing data index

wb_polity$missing <- ifelse(
  apply(wb_polity, 1, anyNA),
  1, 0
)


###### Question 4 (with base R):-----------------------------------------

prop_missingness <- tapply(wb_polity$missing,
                           wb_polity$year,
                           mean, na.rm = T)

plot(x = unique(wb_polity$year),
     y = prop_missingness,
     main = "Proportion of Missing Data by Year",
     xlab = "Year",
     ylab = "Proportion of Missing Data")


###### Question 5 (with base R):-----------------------------------------


boxplot(formula = polity ~ missing,
        data = wb_polity,
        main = "Polity Score of Missing vs. Non-Missing Data",
        ylab = "Polity Score",
        xlab = "Missing Data",
        ylim = c(-15, 15),
        names = c("No", "Yes"))


###### Question 6:-----------------------------------------

# log vars
wb_polity$pop_density_log <- log(wb_polity$pop_density)
wb_polity$inf_mort_log <- log(wb_polity$inf_mort)
wb_polity$gdp_per_capita_log <- log(wb_polity$gdp_per_capita)

# regression (naive) and store results
fit_dem <- lm(inf_mort_log ~ polity + gdp_growth +
                gdp_per_capita_log + pop_density_log,
              data = wb_polity)

summary(fit_dem)


# The null hypothesis in this study is that there is no relationship between democracy and infant mortality,
# once we account for all the other predictors in our model. Our point estimate for polity is -0.02. Note
# that the formula of interpreting the coefficient of a logged variable is obtained by recognizing the equality


## get polity coefficient
polCoef <- fit_dem$coefficients[2]
100 * (exp(polCoef) - 1)


# So, this model finds that a one unit increase in polity leads to a -1.71% decrease in infant mortality.

# The p-value on this coefficient is 0, which is much lower than 0.05. The standard error, 0.002, suggests that
# we are highly precise about our estimate. Therefore we can reject the null hypothesis that democracy does
# not have an effect on infant mortality. This would lead us to conclude that democracy is indeed associated
# with a reducuction in infant mortality.


###### Question 7:-----------------------------------------


fit_dem <- lm(inf_mort_log ~ country_name + year + polity + gdp_growth +
                gdp_per_capita_log + pop_density_log,
              data = wb_polity)

summary(fit_dem)




# Things change once we take into account country and year fixed effects. The point estimate on polity, −0.001
# is essentially 0. This suggests that there is essentially no relationship between polity and infant mortality,
# after controlling for the other covariates. The p-value, 0.19, is greater than 0.05. Therefore, we no longer
# can reject the null hypothesis that democracy has a negative association with infant mortality. Adjusting for
# the variance found in country and year fixed effects removed the significance of the polity variable although
# the magnitude of estimated coefficient is quite similar.


#########################################
















