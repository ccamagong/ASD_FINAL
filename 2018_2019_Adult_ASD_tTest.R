# Independent t-Test for 2018-2019 

# Load data

#Import Packages
library(tidyverse)
library(DAAG)
install.packages("psych")
library("psych")
library("dplyr")
library("gmodels")

#Data Wrangle
## Dummy Code Ethnicity
Autism_Adult1 <- dummy.code(Autism_Adult$Ethnicity)
Autism_Adult <- data.frame(Autism_Adult, Autism_Adult1)
Autism_Adult_20191 <- dummy.code(Autism_Adult_2019$Ethnicity)
Autism_Adult_2019 <- data.frame(Autism_Adult_2019, Autism_Adult1)
adult_raceSubsetRenames <- asd_adult_yes %>% rename( others = others.)

## Recode gender
Autism_Adult$SexR <- NA
Autism_Adult_2019$SexR <- NA
Autism_Adult$JaundiceR[Autism_Adult$Sex=='m'] <- 0
Autism_Adult$SexR[Autism_Adult$Sex=='f'] <- 1
Autism_Adult_2019$JaundiceR[Autism_Adult_2019$Sex=='m'] <- 0
Autism_Adult_2019$SexR[Autism_Adult_2019$Sex=='f'] <- 1

## Recode Jaundice
Autism_Adult$JaundiceR <- NA
Autism_Adult_2019$JaundiceR <- NA
Autism_Adult$JaundiceR[Autism_Adult$Jaundice=='no'] <- 0
Autism_Adult$JaundiceR[Autism_Adult$Jaundice=='yes'] <- 1
Autism_Adult_2019$JaundiceR[Autism_Adult_2019$Jaundice=='no'] <- 0
Autism_Adult_2019$JaundiceR[Autism_Adult_2019$Jaundice=='yes'] <- 1

## Recode Family_ASD
Autism_Adult$Family_ASDR <- NA
Autism_Adult_2019$Family_ASDR <- NA
Autism_Adult$Family_ASDR[Autism_Adult$Family_ASD=='no'] <- 0
Autism_Adult$Family_ASDR[Autism_Adult$Family_ASD=='yes'] <- 1
Autism_Adult_2019$Family_ASDR[Autism_Adult_2019$Family_ASD=='no'] <- 0
Autism_Adult_2019$Family_ASDR[Autism_Adult_2019$Family_ASD=='yes'] <- 1

## Drop orginal columns that were recoded
Autism_Adult <- Autism_Adult[-c(12:15)]
Autism_Adult_2019 <- Autism_Adolescent[-c(12:15)]

## Create df's to filter 'yes' columns
asd_adult_yes <- filter(Autism_Adult, Class == "YES")
asd_adult_2019_yes <- filter(Autism_Adult, Class == "YES")

# Analysis







