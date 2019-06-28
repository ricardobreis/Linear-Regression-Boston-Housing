################################################################################################
#
# Regressão Linear - Looqbox MeetUp
# Por: Ricardo Reis
#
# CASO - BOSTON HOUSING
#
# crim - per capita crime rate by town
# zn - proportion of residential land zoned for lots over 25,000 sq.ft
# indus - proportion of non-retail business acres per town
# chas - Charles River dummy variable (= 1 if tract bounds river; 0 otherwise)
# nox - nitric oxides concentration (parts per 10 million)
# rm - average number of rooms per dwelling
# age - proportion of owner-occupied units built prior to 1940
# dis - weighted distances to five Boston employment centres
# rad - index of accessibility to radial highways
# tax - full-value property-tax rate per USD 10,000
# ptratio- pupil-teacher ratio by town
# b 1000(B - 0.63)^2, where B is the proportion of blacks by town
# lstat - percentage of lower status of the population
# medv - median value of owner-occupied homes in USD 1000's
#
################################################################################################

install.packages('mlbench')
install.packages('car')
library(mlbench)
library(car)
library(caTools)
library(dplyr)
library(plotly)
library(caret)

data(BostonHousing)
housing <- BostonHousing
str(housing)

summary(housing)

#Separando o dataset em treino e teste
set.seed(123)

index <- createDataPartition(housing$medv, p = 0.7, list = F)
trainData <- housing[index,]
testData <- housing[-index,]

#Montando o modelo com todas as variaveis
model1 <- lm(medv ~ crim + zn + indus + chas + nox + rm + age + dis + rad + tax + ptratio + b
             + lstat, data = trainData)
vif(model1)
summary(model1)

#Retirando rad
model2 <- lm(medv ~ crim + zn + indus + chas + nox + rm + age + dis + tax + ptratio + b
             + lstat, data = trainData)
vif(model2)
summary(model2)

#Retirando age
model3 <- lm(medv ~ crim + zn + indus + chas + nox + rm + dis + tax + ptratio + b
             + lstat, data = trainData)
summary(model3)

#Retirando b
model4 <- lm(medv ~ crim + zn + indus + chas + nox + rm + dis + tax + ptratio 
             + lstat, data = trainData)
summary(model4)

#Retirando chas
model5 <- lm(medv ~ crim + zn + indus + nox + rm + dis + tax + ptratio 
             + lstat, data = trainData)
summary(model5)

#Retirando indus
model6 <- lm(medv ~ crim + zn  + nox + rm + dis + tax + ptratio 
             + lstat, data = trainData)
summary(model6)

#Retirando zn
model6 <- lm(medv ~ crim + nox + rm + dis + tax + lstat + ptratio, data = trainData)
summary(model6)

#Retirando ptratio
model7 <- lm(medv ~ crim + nox + rm + dis + tax + lstat, data = trainData)
summary(model7)

#Retirando crim
model8 <- lm(medv ~ nox + rm + dis + tax + lstat, data = trainData)
summary(model8)

#Retirando nox
model8 <- lm(medv ~ rm + dis + tax + lstat, data = trainData)
summary(model8)

#Treinando
modelTrain <- lm(medv ~ rm + dis + tax + lstat, data = trainData)
summary(modelTrain)

testData$predicted.medv <- predict(modelTrain,testData)

grafico <- testData %>% 
  ggplot(aes(medv,predicted.medv)) +
  geom_point(alpha=0.5) +
  xlab('MEDV Atual') +
  ylab('MEDV Previsto')

ggplotly(grafico)

error <- testData$predicted.medv-testData$medv
rmse <- sqrt(sum((error)^2)/length(testData$medv))
