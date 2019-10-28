# Linear-Regression-Boston-Housing

The project consists in creating a model using linear regression to predict prices of houses of the Boston Housing dataset which can be found in Kaggle. The project was presented as a linear regression case study at Looqbox MeetUp.

## Features
1. Crim: per capita crime rate by town
2. Zn: proportion of residential land zoned for lots over 25,000 sq.ft
3. Indus: proportion of non-retail business acres per town
4. Chas: Charles River dummy variable (= 1 if tract bounds river; 0 otherwise)
5. Nox: nitric oxides concentration (parts per 10 million)
6. Rm: average number of rooms per dwelling
7. Age: proportion of owner-occupied units built prior to 1940
8. Dis: weighted distances to five Boston employment centres
9. Rad: index of accessibility to radial highways
10. Tax: full-value property-tax rate per USD 10,000
11. Ptratio: pupil-teacher ratio by town
12. B: 1000(B - 0.63)^2, where B is the proportion of blacks by town
13. Lstat: percentage of lower status of the population
14. Medv: median value of owner-occupied homes in USD 1000's

## Partitioning
The dataset is a set of 506 rows and 14 columns (13 independent variables and 1 dependent) and, to this study, it was divided into 2 datasets, a validation (with 356 observations) and test (with 150 observations) samples, a proportion of 70% and 30%.

## Linear Regression

### Final Model
> y = -2,852845 + 6,110905.rm - 0,569839.dis - 0,011868.tax - 0,469279.lstat + e

### Plotting Real Value X Forecast Value
![Plot - Real x Forecast](https://github.com/ricardobreis/Linear-Regression-Boston-Housing/blob/master/RealxPrevisa%CC%83o.png)

### RMSE
> 6.312745

## Boston Housing Dataset
https://www.rdocumentation.org/packages/mlbench/versions/2.1-1/topics/BostonHousing
