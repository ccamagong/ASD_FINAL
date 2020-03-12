# DATA SCIENCE Final current

# Packages
library(tidyverse)
library(DAAG)
install.packages("psych")
library("psych")


#Data Wrangling

## Check Data Type
str(Autism_Toddler)
str(Autism_Child)
str(Autism_Adolescent)
str(Autism_Adult)

## Dummy Code Ethnicity
Autism_Toddler1 <- dummy.code(Autism_Toddler$Ethnicity)
Autism_Toddler <- data.frame(Autism_Toddler, Autism_Toddler1)

Autism_Child1 <- dummy.code(Autism_Child$Ethnicity)
Autism_Child <- data.frame(Autism_Child, Autism_Child1)

Autism_Adolescent1 <- dummy.code(Autism_Adolescent$Ethnicity)
Autism_Adolescent <- data.frame(Autism_Adolescent, Autism_Adolescent1)

Autism_Adult1 <- dummy.code(Autism_Adult$Ethnicity)
Autism_Adult <- data.frame(Autism_Adult, Autism_Adult1)

Autism_ALL1 <- dummy.code(Autism_ALL$Ethnicity)
Autism_ALL <- data.frame(Autism_ALL, Autism_ALL1)

## Recode gender
Autism_Toddler$SexR <-NA
Autism_Child$SexR <- NA
Autism_Adolescent$SexR <- NA
Autism_Adult$SexR <- NA
Autism_ALL$SexR <- NA

Autism_Toddler$SexR[Autism_Toddler$Sex=='m'] <- 0
Autism_Toddler$SexR[Autism_Toddler$Sex=='f'] <- 1

Autism_Child$SexR[Autism_Child$Sex=='m'] <- 0
Autism_Child$SexR[Autism_Child$Sex=='f'] <- 1

Autism_Adolescent$SexR[Autism_Adolescent$Sex=='m'] <- 0
Autism_Adolescent$SexR[Autism_Adolescent$Sex=='f'] <- 1

Autism_Adult$JaundiceR[Autism_Adult$Sex=='m'] <- 0
Autism_Adult$SexR[Autism_Adult$Sex=='f'] <- 1

Autism_ALL$JaundiceR[Autism_ALL$Sex=='m'] <- 0
Autism_ALL$SexR[Autism_ALL$Sex=='f'] <- 1

## Recode Jaundice
Autism_Toddler$JaundiceR <-NA
Autism_Child$JaundiceR <- NA
Autism_Adolescent$JaundiceR <- NA
Autism_Adult$JaundiceR <- NA
Autism_ALL$JaundiceR <- NA

Autism_Toddler$JaundiceR[Autism_Toddler$Jaundice=='no'] <- 0
Autism_Toddler$JaundiceR[Autism_Toddler$Jaundice=='yes'] <- 1

Autism_Child$JaundiceR[Autism_Child$Jaundice=='no'] <- 0
Autism_Child$JaundiceR[Autism_Child$Jaundice=='yes'] <- 1

Autism_Adolescent$JaundiceR[Autism_Adolescent$Jaundice=='no'] <- 0
Autism_Adolescent$JaundiceR[Autism_Adolescent$Jaundice=='yes'] <- 1

Autism_Adult$JaundiceR[Autism_Adult$Jaundice=='no'] <- 0
Autism_Adult$JaundiceR[Autism_Adult$Jaundice=='yes'] <- 1

Autism_ALL$JaundiceR[Autism_ALL$Jaundice=='no'] <- 0
Autism_ALL$JaundiceR[Autism_ALL$Jaundice=='yes'] <- 1

## Recode Family_ASD
Autism_Toddler$Family_ASDR <-NA
Autism_Child$Family_ASDR <- NA
Autism_Adolescent$Family_ASDR <- NA
Autism_Adult$Family_ASDR <- NA
Autism_ALL$Family_ASDR <- NA

Autism_Toddler$Family_ASDR[Autism_Toddler$Family_ASD=='no'] <- 0
Autism_Toddler$Family_ASDR[Autism_Toddler$Family_ASD=='yes'] <- 1

Autism_Child$Family_ASDR[Autism_Child$Family_ASD=='no'] <- 0
Autism_Child$Family_ASDR[Autism_Child$Family_ASD=='yes'] <- 1

Autism_Adolescent$Family_ASDR[Autism_Adolescent$Family_ASD=='no'] <- 0
Autism_Adolescent$Family_ASDR[Autism_Adolescent$Family_ASD=='yes'] <- 1

Autism_Adult$Family_ASDR[Autism_Adult$Family_ASD=='no'] <- 0
Autism_Adult$Family_ASDR[Autism_Adult$Family_ASD=='yes'] <- 1

Autism_ALL$Family_ASDR[Autism_ALL$Family_ASD=='no'] <- 0
Autism_ALL$Family_ASDR[Autism_ALL$Family_ASD=='yes'] <- 1

## Drop orginal columns that were recoded
Autism_Toddler <- Autism_Toddler[-c(12:15)]
Autism_Child <- Autism_Child[-c(12:15)]
Autism_Adolescent <- Autism_Adolescent[-c(12:15)]
Autism_Adult <- Autism_Adult[-c(12:15)]

## Create df's to filter 'yes' columns
asd_toddler_yes <- filter(Autism_Toddler, Class == "YES")
write_csv(toddler_yes, "/Users/markzepeda/Desktop/Final Project/R Github Projects/ASD_FINAL/asd_toddler_yes.csv")
asd_child_yes <- filter(Autism_Child, Class == "YES")
asd_adolescent_yes <- filter(Autism_Adolescent, Class == "YES")
asd_adult_yes <- filter(Autism_Adult, Class == "YES")
asd_all_yes <- filter(Autism_Adult, Class == "YES")

dbRemove