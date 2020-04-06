df = asd_all_ML

# Model 1: Logistic Regregression. (Jaundice)
FitJaundice = glm(Class ~ Jaundice, data = df)

summary(FitJaundice)

# Model 2: Logistic Regregression. (asian)
FitAsian = glm(Class ~ asian, data = df)

summary(FitAsian)

# Model 3: Logistic Regregression. (white)
FitWhite = glm(Class ~ white, data = df)

summary(FitWhite)

# Stepwise Regression
FitAll = glm(Class ~ ., data = df)

summary(FitAll)

## Backward
step(FitAll, direction = 'backward')

BestFit = glm(formula = Class ~ A1 + A2 + A3 + A4 + A5 + A6 + A7 + A8 + 
                A9 + A10 + Sex + Jaundice + hispanic + white, data = df)

summary(BestFit)

## Forward
step(FitAll, direction = 'forward')

BestFit = glm(formula = Class ~ X + A1 + A2 + A3 + A4 + A5 + A6 + A7 + 
                A8 + A9 + A10 + Age + Sex + Jaundice + Family_ASD + asian + 
                black + hispanic + latino + middle.eastern + others + south.asians + 
                white, data = df)
summary(BestFit)

## Hybrid
step(FitAll, direction = 'both')

BestFit = glm(formula = Class ~ A1 + A2 + A3 + A4 + A5 + A6 + A7 + A8 + 
                A9 + A10 + Sex + Jaundice + hispanic + white, data = df)

summary(BestFit)



FitAll = glm(Class ~ ., data = df)

summary(FitAll)

## Backward
step(FitAll, direction = 'backward')

BestFit = glm(formula = Class ~ A1 + A2 + A3 + A4 + A5 + A6 + A7 + A8 + 
                A9 + A10 + Sex + Jaundice + hispanic + white, data = df)

summary(BestFit)

## Forward
step(FitAll, direction = 'forward')

BestFit = glm(formula = Class ~ X + A1 + A2 + A3 + A4 + A5 + A6 + A7 + 
                A8 + A9 + A10 + Age + Sex + Jaundice + Family_ASD + asian + 
                black + hispanic + latino + middle.eastern + others + south.asians + 
                white, data = df)
summary(BestFit)

## Hybrid
step(FitAll, direction = 'both')

BestFit = glm(formula = Class ~ A1 + A2 + A3 + A4 + A5 + A6 + A7 + A8 + 
                A9 + A10 + Sex + Jaundice + hispanic + white, data = df)


summary(BestFit)
plot(BestFit)

coef(BestFit)

logit2prob <- function(logit){
  odds <- exp(logit)
  prob <- odds / (1 + odds)
  return(prob)
}
logit2prob(coef(BestFit))

(intercept <- coef(BestFit)[1])
(b_survival <- coef(BestFit)[15])
(logits_survival <- intercept + 2 * b_survival)
logit2prob(logits_survival)

logit_seq <- seq(-10, 10, by = 2)

prob_seq <- round(logit2prob(logit_seq), 3)
df <- data.frame(Logit = logit_seq,
                 Probability = prob_seq)

library(htmlTable)
htmlTable(df)

library(ggplot2)


logit_seq <- seq(-10, 10, by = .1)

prob_seq <- logit2prob(logit_seq)

rm(df)

df <- data.frame(Logit = logit_seq,
                 Probability = prob_seq)

ggplot(df) +
  aes(x = logit_seq, y = prob_seq) +
  geom_point(size = 2, alpha = .3) +
  labs(x = "logit", y = "probability of success")