# Analysis_ASD_Final
# Chi-Squared for Children, Adolescent, & Adult data

##Load Libraries

library("dplyr")
library("gmodels")

##Stack data one on top of the other - requires the same columns in each

### Need the names and order of the columns
names(asd_child_yes)
names(asd_adolescent_yes)
names(asd_adult_yes)


#### Column names need to be the same
child_raceSubsetRenames <- asd_child_yes %>% rename( others = others.)
adolescent_raceSubsetRenames <- asd_adolescent_yes %>% rename( others = others.)
adult_raceSubsetRenames <- asd_adult_yes %>% rename( others = others.)

### Reorder and drop columns to look like the toddler. 'Class' & 'aboriginal' dropped
child_reordered <- child_raceSubsetRenames[,c(1:11, 13, 15, 14, 17, 16, 19, 18, 20, 22:24)]
adolescent_reordered <- adolescent_raceSubsetRenames[, c(1:11, 13, 15, 14, 21, 16, 18, 17, 19, 22:24)]
adult_reordered <- adult_raceSubsetRenames[, c(1:11, 13, 15, 14, 18, 16, 20, 17, 19, 22:24)]

### Check to make sure they are now all the same order and number of columns:
names(child_reordered)
names(adolescent_reordered)
names(adult_reordered)

### Add a column to each data frame that adds the time frame on there

childTime <- mutate(child_reordered, Time = "Child")
adolescentTime <- mutate(adolescent_reordered, Time = "Adolescent")
adultTime <- mutate(adult_reordered, Time = "Adult")

## Combine data one on top of each other!

all <- rbind(childTime, adolescentTime, adultTime)

#Independent Chi-Square

CrossTable(all$Time, all$A1, chisq=TRUE, expected = TRUE, sresid=TRUE, format="SPSS")
