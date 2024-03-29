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

### Checking Multicollinearity
To check if exists multicollinearity in this dataset, I'm using the VIF (Variance Inflation Factor), which quantifies the severity of multicollinearity. According to Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani in "An Introduction to Statistical Learning": 

> "As a rule of thumb, a VIF value that exceeds 5 or 10 indicates a problematic amount of collinearity."

Checking the VIF values on the image below, we can see there is multicollinearity on "rad" and "tax" features.

![VIF 1](https://github.com/ricardobreis/Linear-Regression-Boston-Housing/blob/master/vif-model1.png)

Removing the "rad" variable and checking the VIF again we can see that there is no multicollinearity anymore.

![VIF 2](https://github.com/ricardobreis/Linear-Regression-Boston-Housing/blob/master/vif-model2.png)

### Final Model
After removing "rad" and doing the linear regression again, we can check that some variables are not statistically significant (P-value > 5%), so these variables were removed one by one. 

![Model 2](https://github.com/ricardobreis/Linear-Regression-Boston-Housing/blob/master/model2.png)

After that, we've got this final model:
> y = -2,852845 + 6,110905.rm - 0,569839.dis - 0,011868.tax - 0,469279.lstat + e

with a rmse of:
> 6.312745

and a Adjusted R-squared of:
> 70%

### Plotting Real Value X Forecast Value
![Plot - Real x Forecast](https://github.com/ricardobreis/Linear-Regression-Boston-Housing/blob/master/RealxPrevisa%CC%83o.png)

## Boston Housing Dataset
https://www.rdocumentation.org/packages/mlbench/versions/2.1-1/topics/BostonHousing
