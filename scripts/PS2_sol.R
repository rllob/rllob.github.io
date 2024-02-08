
rm(list = ls())

library(tidyverse)

# load data

dbj <- read.csv(file = "data/dbj.csv")

names(dbj)


# tidy your data

dbj <- 
  dbj %>% 
  mutate(woman_f = case_when(woman == 1 ~ "female",
                             woman == 0 ~ "male"),
         woman_f=factor(woman_f,
                        levels=c("male","female")),
         republican_f = case_when(republican == 1 ~ "republican",
                                  republican == 0 ~ "democrat"),
         republican_f=factor(republican_f,
                             levels=c("democrat","republican")))



###### Question 1 (with base R):---------------------------------------------


## How many judges are there in the data set?
nrow(dbj)

## What is the gender composition of the judges in the data set?
table(dbj$woman_f)

## What is the party composition of judges in the data set?
table(dbj$republican_f)

## How about for only females / males?
females <- dbj[dbj$woman == 1, ]
males <- dbj[dbj$woman != 1, ]


## party composition by gender
table(females$republican_f)

table(males$republican_f)

summary(dbj$progressive.vote)

always <- subset(dbj, progressive.vote == 1)
never <- subset(dbj, progressive.vote == 0)

## how many?
nrow(always)

nrow(never)

## party composition
table(always$republican_f)

table(never$republican_f)


###### Question 2 (with base R):------------------------------------


boxplot(progressive.vote ~ woman + republican, data = dbj,
        xlab = "Gender and Partisanship",
        ylab = "Proportion of pro-feminist decisions",
        main = "Progressive Vote Prop. by Gender and Partisanship",
        names = c("Dem. Men", "Dem. Women", "Rep. Men", "Rep. Women"))


###### Question 3 (with base R):------------------------------------------

dbj$c.indic <- ifelse(dbj$child >= 1, 1, 0)

## How many judges in the data set have at least one child?
table(dbj$c.indic)

## Are republicans and democrats equally likely to be parents?
diff.kids.party <- (mean(dbj$c.indic[dbj$republican==1])) -
  (mean(dbj$c.indic[dbj$republican==0]))
diff.kids.party

## Do judges with children vote differently than judges without?
diff.means.kids <- (mean(dbj$progressive.vote[dbj$c.indic==1])) -
  (mean(dbj$progressive.vote[dbj$c.indic==0]))
diff.means.kids

## Do republican and democratic parents vote differently on feminist issues?
rep.kids.mean <- mean(dbj$progressive.vote[dbj$republican==1 & dbj$c.indic ==1])
dem.kids.mean <- mean(dbj$progressive.vote[dbj$republican==0 & dbj$c.indic == 1])
rep.kids.mean - dem.kids.mean



###### Question 4 (with base R):-----------------------------------------


## select only judges that have children
children <- dbj[dbj$child >= 1,]

## create indicator for at least one girl
children$girl.indic <- ifelse(children$girls >= 1, 1, 0)
table(children$girl.indic) # find how many judges have at least one girl

atLeastOneGirl <- subset(children, subset = girl.indic == 1)
noGirls <- subset(children, subset = girl.indic == 0)


## full sample effect
overall <- mean(atLeastOneGirl$progressive.vote) - mean(noGirls$progressive.vote)

## subset by one child
oneChild <- children[children$child == 1,]
oneGirl <- oneChild[oneChild$girls >= 1,]
noGirls <- oneChild[oneChild$girls == 0,]
(one <- mean(oneGirl$progressive.vote) - mean(noGirls$progressive.vote))


## subset by two children
twoChildren <- children[children$child == 2,]
atLeastOneGirl <- twoChildren[twoChildren$girls >= 1,]
noGirls <- twoChildren[twoChildren$girls == 0,]
(two <- mean(atLeastOneGirl$progressive.vote) - mean(noGirls$progressive.vote))

## subset by three children
threeChildren <- children[children$child == 3,]
atLeastOneGirl <- threeChildren[threeChildren$girls >= 1,]
noGirls <- threeChildren[threeChildren$girls == 0,]
(three <- mean(atLeastOneGirl$progressive.vote) - mean(noGirls$progressive.vote))

breakdown <- rbind(one, two, three)
rownames(breakdown) <- c("one child", "two children", "three children")
breakdown


###### Question 5 (with base R):-----------------------------------------

## straight tapply
tapply(dbj$girls, dbj$child, mean)

## normalized proportion
dbj$girl.prop <- dbj$girls / dbj$child
tapply(dbj$girl.prop, dbj$child, mean)

## catholic is the 4th religion
dbj$catholics <- ifelse(dbj$religion == 4, 1, 0)
catholics <- dbj[dbj$catholics == 1,]
nonCatholics <- dbj[dbj$catholics == 0,]
mean(catholics$girls)
mean(nonCatholics$girls)


## Republican Catholics
republicans <- catholics[catholics$republican == 1,]
nonRepublicans <- catholics[catholics$republican != 1,]
mean(republicans$girls)
mean(nonRepublicans$girls)


#########################################
















