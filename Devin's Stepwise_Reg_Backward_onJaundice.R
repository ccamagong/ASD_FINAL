df = read.csv("asd_all_ML.csv")

FitJaundice = glm(Class ~ Jaundice, data = df)

summary(FitJaundice)

FitAll = glm(Class ~ ., data = df)

summary(FitAll)

step(FitAll, direction = 'backward')

BestFit = glm(formula = Class ~ A1 + A2 + A3 + A4 + A5 + A6 + A7 + A8 + 
                A9 + A10 + Sex + Jaundice + hispanic + white, data = df)

summary(BestFit)

