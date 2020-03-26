| Introduction to Multivariable Regression. (Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses. If you care to use them, they must be
| downloaded as a zip file and viewed locally. This lesson corresponds to Regression_Models/02_01_multivariate. Galton data is from John Verzani's Using R website, http://wiener.math.csi.cuny.edu/UsingR/)

...

|======== | 4%
| In this lesson we'll illustrate that regression in many variables amounts to a series of regressions in one. Using regression in one variable, we'll show how to eliminate any chosen regressor, thus reducing a
| regression in N variables, to a regression in N-1. Hence, if we know how to do a regression in 1 variable, we can do a regression in 2. Once we know how to do a regression in 2 variables, we can do a regression
| in 3, and so on. We begin with the galton data and a review of eliminating the intercept by subtracting the means.

...

|================| 8%
| When we perform a regression in one variable, such as lm(child ~ parent, galton), we get two coefficients, a slope and an intercept. The intercept is really the coefficient of a special regressor which has the
| same value, 1, at every sample. The function, lm, includes this regressor by default.

...

|======================== |12%
| We'll demonstrate by substituting an all-ones regressor of our own. This regressor must have the same number of samples as galton (928.) Create such an object and name it ones, using ones <- rep(1, nrow(galton)),
| or some equivalent expression.

> skip()

| Entering the following correct answer for you...

> ones <- rep(1, nrow(galton))

| You are quite good my friend!

|================================|15%
| The galton data has already been loaded. The default intercept can be excluded by using -1 in the formula. Perform a regression which substitutes our regressor, ones, for the default using lm(child ~ ones +
| parent -1, galton). Since we want the result to print, don't assign it to a variable.

> skip()

| Entering the following correct answer for you...

> lm(child ~ ones + parent - 1, galton)

Call:
lm(formula = child ~ ones + parent - 1, data = galton)

Coefficients:
 ones parent
23.9415 0.6463


| Excellent work!

|=======================================|19%
| The coefficient of ones is 23.9415. Now use the default, lm(child ~ parent, galton), to show the intercept has the same value. This time, DO NOT suppress the intercept with -1.

> skip()

| Entering the following correct answer for you...

> lm(child ~ parent, galton)

Call:
lm(formula = child ~ parent, data = galton)

Coefficients:
(Intercept)parent
23.94150.6463


| Your dedication is inspiring!

|=============================================== |23%
| The regression in one variable given by lm(child ~ parent, galton) really involves two regressors, the variable, parent, and a regressor of all ones.

1: False
2: True

Selection: 2

| You are really on a roll!

|=======================================================|27%
| In earlier lessons we demonstrated that the regression line given by lm(child ~ parent, galton) goes through the point x=mean(parent), y=mean(child). We also showed that if we subtract the mean from each
| variable, the regression line goes through the origin, x=0, y=0, hence its intercept is zero. Thus, by subtracting the means, we eliminate one of the two regressors, the constant, leaving just one, parent. The
| coefficient of the remaining regressor is the slope.

...

|===============================================================|31%
| Subtracting the means to eliminate the intercept is a special case of a general technique which is sometimes called Gaussian Elimination. As it applies here, the general technique is to pick one regressor and to
| replace all other variables by the residuals of their regressions against that one.

...

|======================================================================= |35%
| Suppose, as claimed, that subtracting a variable's mean is a special case of replacing the variable with a residual. In this special case, it would be the residual of a regression against what?

1: The outcome
2: The variable itself
3: The constant, 1

Selection: 3

| Excellent job!

|===============================================================================|38%
| The mean of a variable is the coefficient of its regression against the constant, 1. Thus, subtracting the mean is equivalent to replacing a variable by the residual of its regression against 1. In an R formula,
| the constant regressor can be represented by a 1 on the right hand side. Thus, the expression, lm(child ~ 1, galton), regresses child against the constant, 1. Recall that in the galton data, the mean height of a
| child was 68.09 inches. Use lm(child ~ 1, galton) to compare the resulting coefficient (the intercept) and the mean height of 68.09. Since we want the result to print, don't assign it a name.

> skip()

| Entering the following correct answer for you...

> lm(child ~ 1, galton)

Call:
lm(formula = child ~ 1, data = galton)

Coefficients:
(Intercept)
68.09


| Keep up the great work!

|======================================================================================= |42%
| The mean of a variable is equal to its regression against the constant, 1.

1: False
2: True

Selection: 2

| Keep working like that and you'll get there!

|===============================================================================================|46%
| To illustrate the general case we'll use the trees data from the datasets package. The idea is to predict the Volume of timber which a tree might produce from measurements of its Height and Girth. To avoid
| treating the intercept as a special case, we have added a column of 1's to the data which we shall use in its place. Please take a moment to inspect the data using either View(trees) or head(trees).

> skip()

| Entering the following correct answer for you...

> head(trees)
Constant Girth Height Volume
1 1 8.3 70 10.3
2 1 8.6 65 10.3
3 1 8.8 63 10.2
4 110.5 72 16.4
5 110.7 81 18.8
6 110.8 83 19.7

| You are doing so well!

|======================================================================================================|50%
| A file of relevant code has been copied to your working directory and sourced. The file, elimination.R, should have appeared in your editor. If not, please open it manually.

...

|============================================================================================================== |54%
| The general technique is to pick one predictor and to replace all other variables by the residuals of their regressions against that one. The function, regressOneOnOne, in eliminate.R performs the first step of
| this process. Given the name of a predictor and one other variable, other, it returns the residual of other when regressed against predictor. In its first line, labeled Point A, it creates a formula. Suppose that
| predictor were 'Girth' and other were 'Volume'. What formula would it create?

1: Volume ~ Girth
2: Volume ~ Girth - 1
3: Girth ~ Volume - 1

Selection: 2

| That's the answer I was looking for.

|======================================================================================================================|58%
| The remaining function, eliminate, applies regressOneOnOne to all variables except a given predictor and collects the residuals in a data frame. We'll first show that when we eliminate one regressor from the
| data, a regression on the remaining will produce their correct coefficients. (Of course, the coefficient of the eliminated regressor will be missing, but more about that later.)

...

|==============================================================================================================================|62%
| For reference, create a model named fit, based on all three regressors, Girth, Height, and Constant, and assign the result to a variable named fit. Use an expression such as fit <- lm(Volume ~ Girth + Height +
 | Constant -1, trees). Don't forget the -1, and be sure to name the model fit for later use.

> skip()

| Entering the following correct answer for you...

> fit <- lm(Volume ~ . - 1, trees)

| You are quite good my friend!

|====================================================================================================================================== |65%
| Now let's eliminate Girth from the data set. Call the reduced data set trees2 to indicate it has only 2 regressors. Use the expression trees2 <- eliminate("Girth", trees).

> skip()

| Entering the following correct answer for you...

> trees2 <- eliminate("Girth", trees)

| You are amazing!

|==============================================================================================================================================|69%
| Use head(trees2) or View(trees2) to inspect the reduced data set.

> skip()

| Entering the following correct answer for you...

> head(trees2)
Constant Height Volume
1 0.4057735 24.38809-9.793826
2 0.3842954 17.73947 -10.520109
3 0.3699767 14.64038 -11.104298
4 0.2482677 14.29818-9.019900
5 0.2339490 22.19910-7.104089
6 0.2267896 23.64956-6.446183

| That's correct!

|====================================================================================================================================================== |73%
| Why, in trees2, is the Constant column not constant?

1: Computational precision was insufficient.
2: There must be some mistake
3: The constant, 1, has been replaced by its residual when regressed against Girth.

Selection: 3

| Your dedication is inspiring!

|==============================================================================================================================================================|77%
| Now create a model, called fit2, using the reduced data set. Use an expression such as fit2 <- lm(Volume ~ Height + Constant -1, trees2). Don't forget to use -1 in the formula.

> skip()

| Entering the following correct answer for you...

> fit2 <- lm(Volume ~ . - 1, trees2)

| That's correct!

|====================================================================================================================================================================== |81%
| Use the expression lapply(list(fit, fit2), coef) to print coefficients of fit and fit2 for comparison.

> skip()

| Entering the following correct answer for you...

> lapply(list(fit, fit2), coef)
[[1]]
 ConstantGirthHeight 
-57.9876589 4.7081605 0.3392512 

[[2]]
 ConstantHeight 
-57.9876589 0.3392512 


| You are doing so well!

|============================================================================================================================================================================= |85%
| The coefficient of the eliminated variable is missing, of course. One way to get it would be to go back to the original data, trees, eliminate a different regressor, such as Height, and do another 2 variable
| regession, as above. There are much more efficient ways, but efficiency is not the point of this demonstration. We have shown how to reduce a regression in 3 variables to a regression in 2. We can go further and
| eliminate another variable, reducing a regression in 2 variables to a regression in 1.

...

|=====================================================================================================================================================================================|88%
| Here is the final step. We have used eliminate("Height", trees2) to reduce the data to the outcome, Volume, and the Constant regressor. We have regressed Volume on Constant, and printed the coefficient as shown
| in the command above the answer. As you can see, the coefficient of Constant agrees with previous values.


Call:
lm(formula = Volume ~ Constant - 1, data = eliminate("Height", 
trees2))

Coefficients:
Constant
-57.99

...

|=============================================================================================================================================================================================|92%
| Suppose we were given a multivariable regression problem involving an outcome and N regressors, where N > 1. Using only single-variable regression, how can the problem be reduced to a problem with only N-1
| regressors?

1: Subtract the mean from the outcome and each regressor.
2: Pick any regressor and replace the outcome and all other regressors by their residuals against the chosen one.

Selection: 1

| You're close...I can feel it! Try it again.

| Subtracting the mean is a special case, applying only to the constant regressor. Not every problem will involve a constant regressor.

1: Subtract the mean from the outcome and each regressor.
2: Pick any regressor and replace the outcome and all other regressors by their residuals against the chosen one.

Selection: 2

| That's the answer I was looking for.

|===================================================================================================================================================================================================== |96%
| We have illustrated that regression in many variables amounts to a series of regressions in one. The actual algorithms used by functions such as lm are more efficient, but are computationally equivalent to what
| we have done. That is, the algorithms use equivalent steps but combine them more efficiently and abstractly. This completes the lesson.

...

|=============================================================================================================================================================================================================| 100%
| Would you like to receive credit for completing this course on Coursera.org?

1: Yes
2: No

Selection: 1
What is your email address? enrique.sedes@gmail.com
What is your assignment token? 72MaoJ3XaPbZGkNW
Grade submission succeeded!

| Great job!

| You've reached the end of this lesson! Returning to the main menu...

| Please choose a course, or type 0 to exit swirl.

1: Regression Models
2: Take me to the swirl course repository!

Selection: 1

| Please choose a lesson, or type 0 to return to course menu.

1: Introduction2: Residuals3: Least Squares Estimation 4: Residual Variation
5: Introduction to Multivariable Regression 6: MultiVar Examples 7: MultiVar Examples28: MultiVar Examples3
9: Residuals Diagnostics and Variation10: Variance Inflation Factors11: Overfitting and Underfitting 12: Binary Outcomes
13: Count Outcomes 

Selection: 6

| Attempting to load lesson dependencies...

| Package ‘datasets’ loaded correctly!

| Package ‘stats’ loaded correctly!

| Package ‘graphics’ loaded correctly!

|| 0%

| MultiVar_Examples. (Slides for this and other Data Science courses may be found at github https://github.com/DataScienceSpecialization/courses. If you care to use them, they must be downloaded as a zip file and
| viewed locally. This lesson corresponds to Regression_Models/02_02_multivariateExamples.)

...

|=========| 4%
| In this lesson, we'll look at some examples of regression models with more than one variable. We'll begin with the Swiss data which we've taken the liberty to load for you. This data is part of R's datasets
| package. It was gathered in 1888, a time of demographic change in Switzerland, and measured six quantities in 47 French-speaking provinces of Switzerland. We used the code from the slides (the R function pairs)
| to display here a 6 by 6 array of scatterplots showing pairwise relationships between the variables. All of the variables, except for fertility, are proportions of population. For example, "Examination" shows the
| percentage of draftees receiving the highest mark on an army exam, and "Education" the percentage of draftees with education beyond primary school.

...

|==================| 9%
| From the plot, which is NOT one of the factors measured?

1: Catholic
2: Fertility
3: Infant Mortality
4: Obesity

Selection: 4

| You nailed it! Good job!

|===========================|13%
| First, use the R function lm to generate the linear model "all" in which Fertility is the variable dependent on all the others. Use the R shorthand "." to represent the five independent variables in the formula
| passed to lm.Remember the data is "swiss".

> 
> skip()

| Entering the following correct answer for you...

> all <- lm(Fertility ~ ., swiss)

| Perseverance, that's the answer.

|====================================|17%
| Now look at the summary of the linear model all.

> skip()

| Entering the following correct answer for you...

> summary(all)

Call:
lm(formula = Fertility ~ ., data = swiss)

Residuals:
 Min1Q Median3QMax 
-15.2743-5.2617 0.5032 4.119815.3213 

Coefficients:
 Estimate Std. Error t value Pr(>|t|)
(Intercept)66.91518 10.70604 6.250 1.91e-07 ***
Agriculture-0.172110.07030-2.4480.01873 *
Examination-0.258010.25388-1.0160.31546
Education -0.870940.18303-4.758 2.43e-05 ***
Catholic 0.104120.03526 2.9530.00519 ** 
Infant.Mortality1.077050.38172 2.8220.00734 ** 
---
Signif. codes:0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 7.165 on 41 degrees of freedom
Multiple R-squared:0.7067,	Adjusted R-squared:0.671 
F-statistic: 19.76 on 5 and 41 DF,p-value: 5.594e-10


| That's a job well done!

|=============================================|22%
| Recall that the Estimates are the coefficients of the independent variables of the linear model (all of which are percentages) and they reflect an estimated change in the dependent variable (fertility) when the
| corresponding independent variable changes. So, for every 1% increase in percent of males involved in agriculture as an occupation we expect a .17 decrease in fertility, holding all the other variables constant;
| for every 1% increase in Catholicism, we expect a .10 increase in fertility, holding all other variables constant.

...

|===================================================== |26%
| The "*" at the far end of the row indicates that the influence of Agriculture on Fertility is significant. At what alpha level is the t-test of Agriculture significant?

1: 0.01
2: R doesn't say
3: 0.1
4: 0.05

Selection: 4

| That's a job well done!

|============================================================== |30%
| Now generate the summary of another linear model (don't store it in a new variable) in which Fertility depends only on agriculture.

> skip()

| Entering the following correct answer for you...

> summary(lm(Fertility ~ Agriculture, swiss))

Call:
lm(formula = Fertility ~ Agriculture, data = swiss)

Residuals:
 Min1Q Median3QMax 
-25.5374-7.8685-0.6362 9.046424.4858 

Coefficients:
 Estimate Std. Error t value Pr(>|t|)
(Intercept) 60.304384.2512614.185 <2e-16 ***
Agriculture0.194200.07671 2.532 0.0149 *
---
Signif. codes:0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 11.82 on 45 degrees of freedom
Multiple R-squared:0.1247,	Adjusted R-squared:0.1052 
F-statistic: 6.409 on 1 and 45 DF,p-value: 0.01492


| Excellent job!

|======================================================================= |35%
| What is the coefficient of agriculture in this new model?

1: 0.07671
2: 0.19420
3: *
4: 60.30438

Selection: 2

| You are amazing!

|================================================================================ |39%
| The interesting point is that the sign of the Agriculture coefficient changed from negative (when all the variables were included in the model) to positive (when the model only considered Agriculture). Obviously
| the presence of the other factors affects the influence Agriculture has on Fertility.

...

|========================================================================================= |43%
| Let's consider the relationship between some of the factors. How would you expect level Education and performance on an Examination to be related?

1: They would be correlated
2: I would not be able to guess without more information
3: They would be uncorrelated

Selection: 1

| You got it right!

|================================================================================================== |48%
| Now check your intuition with the R command "cor". This computes the correlation between Examination and Education.

> skip()

| Entering the following correct answer for you...

> cor(swiss$Examination,swiss$Education)
[1] 0.6984153

| You got it!

|=========================================================================================================== |52%
| The correlation of .6984 shows the two are correlated. Now find the correlation between Agriculture and Education.

> skip()

| Entering the following correct answer for you...

> cor(swiss$Agriculture,swiss$Education)
[1] -0.6395225

| That's the answer I was looking for.

|==================================================================================================================== |57%
| The negative correlation (-.6395) between Agriculture and Education might be affecting Agriculture's influence on Fertility. I've loaded and sourced the file swissLMs.R in your working directory. In it is a
| function makelms() which generates a sequence of five linear models. Each model has one more independent variable than the preceding model, so the first has just one independent variable, Agriculture, and the
| last has all 5. I've tried loading the source code in your editor. If I haven't done this, open the file manually so you can look at the code.

...

|============================================================================================================================= |61%
| Now run the function makelms() to see how the addition of variables affects the coefficient of Agriculture in the models.

> skip()
Agriculture Agriculture Agriculture Agriculture Agriculture 
0.1942017 0.1095281-0.2030377-0.2206455-0.1721140 

| Entering the following correct answer for you...

> makelms()

| Great job!

|====================================================================================================================================== |65%
| The addition of which variable changes the sign of Agriculture's coefficient from positive to negative?

1: Education
2: Catholic
3: Infant.Mortality
4: Examination

Selection: 1

| You are amazing!

|=============================================================================================================================================== |70%
| Now we'll show what happens when we add a variable that provides no new linear information to a model. Create a variable ec that is the sum of swiss$Examination and swiss$Catholic.

> skip()

| Entering the following correct answer for you...

> ec <- swiss$Examination+swiss$Catholic

| That's correct!

|======================================================================================================================================================== |74%
| Now generate a new model efit with Fertility as the dependent variable and the remaining 5 of the original variables AND ec as the independent variables. Use the R shorthand ". + ec" for the righthand side of the
| formula.

> skip()

| Entering the following correct answer for you...

> efit <- lm(Fertility ~ . + ec, swiss)

| Perseverance, that's the answer.

|================================================================================================================================================================|78%
| We'll see that R ignores this new term since it doesn't add any information to the model.

...

|=========================================================================================================================================================================|83%
| Subtract the efit coefficients from the coefficients of the first model you created, all.

> skip()

| Entering the following correct answer for you...

> all$coefficients - efit$coefficients
 (Intercept)AgricultureExamination EducationCatholic Infant.Mortalityec 
000000NA 

| Keep working like that and you'll get there!

|==================================================================================================================================================================================|87%
| Which is the coefficient of ec?

1: I haven't a clue.
2: 0
3: NA

Selection: 3

| You are really on a roll!

|===========================================================================================================================================================================================|91%
| This tells us that

1: R is really cool
2: Adding ec zeroes out the coefficients
3: Adding ec doesn't change the model

Selection: 2

| Give it another try.

| Since ec is a linear combination of two othe variables it doesn't change the model.

1: R is really cool
2: Adding ec zeroes out the coefficients
3: Adding ec doesn't change the model

Selection: 3

| You are quite good my friend!

|====================================================================================================================================================================================================|96%
| Congrats! You've concluded this first lesson on multivariable linear models.