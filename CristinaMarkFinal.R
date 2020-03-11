# This is to properly wrangle Cristina and Mark's data for a repeated measures ANOVA or ANCOVA

#Trying the gather function: 

##Load Libraries

library("dplyr")
library("gmodels")

##Stack data one on top of the other - requires the same columns in each

### Need the names and order of the columns
names(asd_toddler_yes)
names(asd_child_yes)
names(asd_adolescent_yes)
names(asd_adult_yes)

### Reorder the columns to look like toddler

child_reordered <- asd_child_yes[,c(1:16, 18, 19, 20, 21, 22, 23, 24, 17)]
adolescent_reordered <- asd_adolescent_yes[, c(1:16, 18, 19, 20, 21, 22, 23, 24 ,17)]
adult_reordered <- asd_adult_yes[, c(1:16, 18, 19, 20, 21, 22, 23, 24, 17)]

###Drop columns that don't match up with toddler

####Drop native indian and pacificia from toddler

toddler_raceSubset <- asd_toddler_yes[, c(1:20, 23, 25, 26)]

#### Drop asian from child, adolescent, adult
child_raceSubset <-child_reordered[,1:23]
adolescent_raceSubset <- adolescent_reordered[,1:23]
adult_raceSubset <- adult_reordered[,1:23]

### Check to make sure they are now all the same order and number of columns:

names(toddler_raceSubset)
names(child_raceSubset)
names(adolescent_raceSubset)
names(adult_raceSubset)

### Column names need to be the same

toddler_raceSubsetRenames <- toddler_raceSubset %>% rename( white = white.european)

### Add a column to each data frame that adds the time frame on there

toddlerTime <- mutate(toddler_raceSubsetRenames, Time = 0)
childTime <- mutate(child_raceSubset, Time = 1)
adolescentTime <- mutate(adolescent_raceSubset, Time = 2)
adultTime <- mutate(adult_raceSubset, Time = 3)

## Combine data one on top of each other!

all <- rbind(toddlerTime, childTime, adolescentTime, adultTime)

#Independent Chi-Square

CrossTable(all$Time, all$A1, chisq=TRUE, expected = TRUE, sresid=TRUE, format="SPSS")

# Reference material / things that didn't work------------------------------------------------------------------------

library("tidyr")

breakfast4 <- breakfast2[,1:5]
breakfast4$repdat <- breakfast2$Baseline.Resting.Metabolic.Rate..kcal.d.
breakfast4$contrasts <- "T1"
breakfast5 <- breakfast2[,1:5]
breakfast5$repdat <- breakfast2$Follow.Up.Resting.Metabolic.Rate..kcal.d.
breakfast5$contrasts <- "T2"
breakfast3 <- rbind(breakfast4, breakfast5)
leveneTest(repdat ~ Treatment.Group*contrasts, data=breakfast3)

## Subset data to only what's needed 

toddler_subset_indicators <- asd_toddler_yes[,2:11]

##Gather
toddler_long <- gather(asd_toddler_yes, Indicator, Data, A1)


## Gather

all_long <- gather(all, Indicator, Data, A1:A10)

#Run the analysis (didn't try assumptions)

RManova <- ezANOVA(data = all_long, dv = .(Data), wid = .(X), within = .(A1))

RManova <- aov(Data~Indicator+Error(), breakfast2)
summary(RManova)
