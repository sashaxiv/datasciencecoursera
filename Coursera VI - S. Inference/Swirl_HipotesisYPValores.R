You might send the innocent man to jail by rejecting H_0. Suppose a guilty person is not convicted. What type of error is
| this?

1: Type I
2: Type II

Selection: 2

| You're the best!

|=======================|19%
| Back to sleep (example)! A reasonable strategy would reject the null hypothesis if our sample mean X' was larger than some
| constant C. We choose C so that the probability of a Type I error, alpha, is .05 (or some other favorite constant). Many
| scientific papers use .05 as a standard level of rejection.

...

|======================== |20%
| This means that alpha, the Type I error rate, is the probability of rejecting the null hypothesis when, in fact, it is
| correct. We don't want alpha too low because then we would never reject the null hypothesis even if it's false.

...

|========================== |22%
| Recall that the standard error of a sample mean is given by the formula s/sqrt(n). Recall in our sleep example we had a sample
| of 100 subjects, our mean RDI (X') was 32 events / hour with a standard deviation (s) of 10 events / hour. What is the
| standard error of the mean in this example?

> 10/sqrt(100)
[1] 1

| You got it right!

|===========================|23%
| Under H_0, X' is normally distributed with mean mu=30 and variance 1. (We're estimating the variance as the square of the
| standard error which in this case is 1.) We want to choose the constant C so that the probability that X is greater than C
| given H_0 is 5%. That is, P(X > C| H_0) is 5%. Sound familiar?

...

|=============================|24%
| Here's a plot to show what we mean. The shaded portion represents 5% of the area under the curve and those X values in it are
 | those for which the probability that X>C is 5%.
 
 ...
 
 |============================== |25%
 | The shaded portion represents 5% of the area under this normal density curve. Which expression represents the smallest value X
 | for which the area is shaded, assuming this is standard normal?
 
 1: dnorm(.95)
 2: qnorm(.95)
 3: rnorm(.95)
 4: qt(.95,99)
 
 Selection: 2
 
 | Perseverance, that's the answer.

|================================ |27%
| The 95th percentile of a standard normal distribution is 1.645 standard deviations from the mean, so in our example we have to
| set C to be 1.645 standard deviations MORE than our hypothesized mean of 30, that is, C = 30 + 1.645 * 1 = 31.645 (recall that
| the variance and standard deviation equalled 1).

...

|=================================|28%
| This means that if our OBSERVED (sample) mean X' >= C, then it's only a 5% chance that a random draw from this N(30,1)
| distribution is larger than C.

...

|================================== |29%
| Recall that our observed mean X' is 32 which is greater than C=31.645, so it falls in that 5% region. What do we do with H_0?
 
 1: fail to reject it
 2: reject it
 3: give it another chance
 
 Selection: 1
 
 | You almost had it, but not quite. Try again.
 
 | The observed sample mean X' falls in the region of rejection so we toss out H_0.

1: reject it
2: give it another chance
3: fail to reject it

Selection: 2

| Keep trying!

| The observed sample mean X' falls in the region of rejection so we toss out H_0.
 
 1: fail to reject it
 2: reject it
 3: give it another chance
 
 Selection: 2
 
 | All that hard work is paying off!
 
 |==================================== |30%
 | So the rule "Reject H_0 when the sample mean X' >= 31.645" has the property that the probability of rejecting H_0 when it is
 | TRUE is 5% given the model of this example - hypothesized mean mu=30, variance=1 and n=100.
 
 ...
 
 |=====================================|31%
 | Instead of computing a constant C as a cutpoint for accepting or rejecting the null hypothesis, we can simply compute a Z
 | score, the number of standard deviations the sample mean is from the hypothesized mean. We can then compare it to quantile
 | determined by alpha.
 
 ...
 
 |=======================================|33%
 | How do we do this? Compute the distance between the two means (32-30) and divide by the standard error of the mean, that is
 | (s/sqrt(n)).
 
 ...
 
 |======================================== |34%
 | What is the Z score for this example? Recall the Z score is X'-mu divided by the standard error of the mean. In this example
| X'=32, mu=30 and the standard error is 10/sqrt(100)=1.
 
 > 2
 [1] 2
 
 | You are quite good my friend!
 
 |========================================== |35%
 | The Z score is 2. The quantile is 1.645, so since 2>1.645. What do we do with H_0?
 
 1: give it another chance
 2: fail to reject it
 3: reject it
 
 Selection: 3
 
 | Excellent job!
 
 |===========================================|36%
 | The general rule for rejection is if sqrt(n) * ( X' - mu) / s > Z_{1-alpha}.

...

|============================================ |37%
| Our test statistic is (X'-mu) / (s/sqrt(n)) which is standard normal.
 
 ...
 
 |============================================== |39%
 | This means that our test statistic has what mean and standard deviation?
 
 1: 1 and 1
 2: 0 and 0
 3: 0 and 1
 4: 1 and 0
 
 Selection: 3
 
 | All that practice is paying off!
 
 |===============================================|40%
 | Let's review and expand. Our null hypothesis is that the population mean mu equals the value mu_0 and alpha=.05. (This is the
| probability that we reject H_0 if it's true.) We can have several different alternative hypotheses.
 
 ...
 
 |=================================================|41%
 | Suppose our first alternative, H_a, is that mu < mu_0. We would reject H_0 (and accept H_a) when our observed sample mean is
 | significantly less than mu_0. That is, our test statistic (X'-mu) / (s/sqrt(n)) is less than Z_alpha. Specifically, it is more
| than 1.64 standard deviations to the left of the mean mu_0.

...

|================================================== |42%
| Here's a plot to show what we mean. The shaded portion represents 5% of the area under the curve and those X values in it are
| those which are at least 1.64 standard deviations less than the mean. The probability of this is 5%. This means that if our
| sample mean fell in this area, we would reject a true null hypothesis, mu=mu_0, with probability 5%.

...

|==================================================== |43%
| We already covered the alternative hypothesis H_a that mu > mu_0 but let's review it. We would reject H_0 (and accept H_a)
| when our sample mean is what?

1: huh?
2: equal to mu_0
3: significantly greater than mu_0
4: significantly less than mu_0

Selection: 4

| Try again. Getting it right on the first try is boring anyway!

| If we accept H_a, that the true mu is greater than the H_0 value mu_0 we would want our sample mean to be greater the mu_0.

1: equal to mu_0
2: significantly less than mu_0
3: huh?
4: significantly greater than mu_0

Selection: 
Enter an item from the menu, or 0 to exit
Selection: 4

| Excellent work!

|=====================================================|45%
| This means that our test statistic (X'-mu) / (s/sqrt(n)) is what?
 
 1: at least 1.64 std dev greater than mu_0
 2: equal to mu_0
 3: huh?
 4: at least 1.64 std dev less than mu_0
 
 Selection: 1
 
 | All that hard work is paying off!
 
 |====================================================== |46%
 | Here again is the plot to show this. The shaded portion represents 5% of the area under the curve and those X values in it are
 | those which are at least 1.64 standard deviations greater than the mean. The probability of this is 5%. This means that if our
 | observed mean fell in this area we would reject a true null hypothesis, that mu=mu_0, with probability 5%.
 
 ...
 
 |======================================================== |47%
 | Finally, let's consider the alternative hypothesis H_a that mu is simply not equal to mu_0, the mean hypothesized by the null
| hypothesis H_0.We would reject H_0 (and accept H_a) when our sample mean is significantly different than mu_0, that is,
| either less than OR greater than mu_0.

...

|=========================================================|48%
| Since we want to stick with a 5% rejection rate, we divide it in half and consider values at both tails, at the .025 and the
| .975 percentiles.This means that our test statistic (X'-mu) / (s/sqrt(n)) is less than .025, Z_(alpha/2), or greater than
| .975, Z_(1-alpha/2).

...

|===========================================================|49%
| Here's the plot. As before, the shaded portion represents the 5% of the area composing the region of rejection. This time,
| though, it's composed of two equal pieces, each containing 2.5% of the area under the curve. The X values in the shaded
| portions are values which are at least 1.96 standard deviations away from the hypothesized mean.

...

|============================================================ |51%
| Notice that if we reject H_0, either it was FALSE (and hence our model is wrong and we are correct to reject it) OR H_0 is
| TRUE and we have made an error (Type I). The probability of this is 5%.

...

|============================================================== |52%
| Since our tests were based on alpha, the probability of a Type I error, we say that we "fail to reject H_0" rather than we
| "accept H_0". If we fail to reject H_0, then H_0 could be true OR we just might not have enough data to reject it.

...

|===============================================================|53%
| We have not fixed the probability of a type II error (accepting H_0 when it is false), which we call beta. The term POWER
| refers to the quantity 1-beta and it represents the probability of rejecting H_0 when it's false. This is used to determine
| appropriate sample sizes in experiments.

...

|=================================================================|54%
| What do you think we call the region of values for which we reject H_0?

1: the abnormal region
2: the rejection region
3: the waggy tails
4: the region of interest
5: the shady tails

Selection: 2

| You got it!

|================================================================== |55%
| Note that so far we've been talking about NORMAL distributions and implicitly relying on the CENTRAL LIMIT THEOREM (CLT).

...

|===================================================================|57%
| Remember the CLT. For a distribution to be approximated by a normal what does the sample size have to be?

1: small
2: large
3: abnormal
4: normal

Selection: 2

| You nailed it! Good job!

|=====================================================================|58%
| No need to worry. If we don't have a large sample size, we can use the t distribution which conveniently uses the same test
| statistic (X'-mu) / (s/sqrt(n)) we used above.That means that all the examples we just went through would work exactly the
| same EXCEPT instead of using NORMAL quantiles, we would use t quantiles and n-1 degrees of freedom.

...

|====================================================================== |59%
| We said t distributions were very handy, didn't we?

...

|======================================================================== |60%
| Let's go back to our sleep disorder example and suppose our sample size=16 (instead of 100). As before, (sample mean) X'=32,
| (standard deviation) s=10.H_0 says the true mean mu=30, and H_a is that mu>30. With this smaller sample size we use the t
| test, but our test statistic is computed the same way, namely (X'-mu)/(s/sqrt(n))

...

|=========================================================================|61%
| What is the value of the test statistic (X'-mu)/(s/sqrt(n)) with sample size 16?

> skip()

| Entering the following correct answer for you...

> 0.8
[1] 0.8

| That's a job well done!
 
 |===========================================================================|63%
 | How many degrees of freedom do we have with a sample size of 16?
 
 > 15
 [1] 15
 
 | You got it right!
 
 |============================================================================ |64%
 | Under H_0, the probability that the test statistic is larger than the 95th percentile of the t distribution is 5%. Use the R
 | function qt with the arguments .95 and the correct number of degrees of freedom to find the quantile.
 
 > qt(0.95,15)
 [1] 1.75305
 
 | Keep up the great work!
 
 |=============================================================================|65%
 | So the test statistic (.8) is less than 1.75, the 95th percentile of the t distribution with 15 df. This means that our sample
 | mean (32) does not fall within the region of rejection since H_a was that mu>30.
 
 ...
 
 |===============================================================================|66%
 | This means what?
 
 1: we reject H_a
 2: we fail to reject H_0
 3: we reject H_0
 
 Selection: 2
 
 | Nice work!
 
 |================================================================================ |67%
 | Now let's consider a two-sided test. Suppose that we would reject the null hypothesis if in fact the sample mean was too large
| or too small. That is, we want to test the alternative H_a that mu is not equal to 30. We will reject if the test statistic,
| 0.8, is either too large or too small.

...

|================================================================================== |69%
| As we discussed before, we want the probability of rejecting under the null to be 5%, split equally as 2.5% in the upper tail
| and 2.5% in the lower tail. Thus we reject if our test statistic is larger than qt(.975, 15) or smaller than qt(.025, 15).

...

|===================================================================================|70%
| Do you expect qt(.975,15) to be bigger or smaller than qt(.95,15)?

1: smaller
2: bigger

Selection: 2

| You got it right!

|=====================================================================================|71%
| Since the test statistic was smaller than qt(.95,15) will it be bigger or smaller than qt(.975,15)?

1: bigger
2: smaller

Selection: 2

| Your dedication is inspiring!

|====================================================================================== |72%
| Now for the left tail, qt(.025,15). What can we say about it?

1: it is greater than 0
2: it is less than 0
3: it is bigger than qt(.975,15)
4: we don't know anything about it
 
 Selection: 2
 
 | Excellent work!
 
 |=======================================================================================|73%
 | Bottom line here is if you fail to reject the one sided test, you know that you will fail to reject the two sided.
 
 ...
 
 |=========================================================================================|75%
 | So the test statistic .8 failed both sides of the test. That means we ?
 
 1: huh?
 2: fail to reject H_0
 3: reject H_a
 4: reject H_0
 
 Selection: 2
 
 | Excellent job!
 
 |========================================================================================== |76%
 | Now we usually don't have to do all this computation ourselves because R provides the function t.test which happily does all
| the work! To prove this, we've provided a csv file with the father_son height data from John Verzani's UsingR website
| (http://wiener.math.csi.cuny.edu/UsingR/) and read it into a data structure fs for you. We'll do a t test on this paired data
 | to see if fathers and sons have similar heights (our null hypothesis).
 
 ...
 
 |============================================================================================ |77%
 | Look at the dimensions of fs now using the R function dim.
 
 > dim(fs)
 [1] 10782
 
 | That's a job well done!

|=============================================================================================|78%
| So fs has 1078 rows and 2 columns. The columns, fheight and sheight, contain the heights of a father and his son. Obviously
| there are 1078 such pairs. We can run t.test on this data in one of two ways. First, we can run it with just one argument, the
| difference between the heights, say fs$sheight-fs$fheight. OR we can run it with three arguments, the two heights plus the
| paired argument set to TRUE. Run t.test now using whichever way you prefer.

> t.test(fs$sheight-fs$fheight)

	One Sample t-test

data:fs$sheight - fs$fheight
t = 11.789, df = 1077, p-value < 2.2e-16
alternative hypothesis: true mean is not equal to 0
95 percent confidence interval:
 0.8310296 1.1629160
sample estimates:
mean of x 
0.9969728 


| You got it right!

|===============================================================================================|80%
| The test statistic is what?

1: 2.2e-16
2: 11.7885
3: 0.9969728
4: .8310296

Selection: 2

| You nailed it! Good job!

|================================================================================================ |81%
| So the test statistic is 11.79 which is quite large so we REJECT the null hypothesis that the true mean of the difference was
| 0 (if you ran the test on the difference sheight-fheight) or that the true difference in means was 0 (if you ran the test on
| the two separate but paired columns).

...

|=================================================================================================|82%
| The test statistic tell us what?

1: the sample mean
2: the true variance
3: the true mean
4: the number of estimated std errors between the sample and hypothesized means

Selection: 4

| You are doing so well!

|===================================================================================================|83%
| We can test this by multiplying the t statistic (11.7885) by the standard deviation of the data divided by the square root of
| the sample size. Specifically run 11.7885 * sd(fs$sheight-fs$fheight)/sqrt(1078).

> 11.7885 * sd(fs$sheight-fs$fheight)/sqrt(1078)
[1] 0.9969686

| Keep working like that and you'll get there!
 
 |==================================================================================================== |84%
 | This should give you a close match to the mean of x which t.test gave you, 0.9969728.
 
 ...
 
 |====================================================================================================== |86%
 | Note the 95% confidence interval, 0.8310296 1.1629160, returned by t.test. It does not contain the hypothesized population
 | mean 0 so we're pretty confident we can safely reject the hypothesis. This tells us that either our hypothesis is wrong or
| we're making a mistake (Type 1) in rejecting it.
 
 ...
 
 |=======================================================================================================|87%
 | You've probably noticed the strong similarity between the confidence intervals we studied in the last lesson and these
| hypothesis tests. That's because they're equivalent!

...

|=========================================================================================================|88%
| If you set alpha to some value (say .05) and ran many tests checking alternative hypotheses against H_0, that mu=mu_0, the set
| of all possible values for which you fail to reject H_0 forms the (1-alpha)% (that is 95%) confidence interval for mu_0.

...

|========================================================================================================== |89%
| Similarly, if a (1-alpha)% interval contains mu_0, then we fail to reject H_0.

...

|============================================================================================================ |90%
| Let's see how hypothesis testing works with binomial distributions by considering the example from the slides. A family has 8
 | children, 7 of whom are girls and none are twins. Let the null hypothesis be that either gender is equally likely, like an iid
 | coin flip.
 
 ...
 
 |=============================================================================================================|92%
 | So our H_0 is that p=.5, where p is the probability of a girl. We want to see if we should reject H_0 based on this sample of
 | size 8. Our H_a is that p>.5, so we'll do a one-sided test, i.e., look at only the right tail of the distribution.

...

|============================================================================================================== |93%
| Let's set alpha, the level of our test, to .05 and find the probabilities associated with different rejection regions, where a
 | rejection region i has at least i-1 girls out of a possible 8.
 
 ...
 
 |================================================================================================================ |94%
 | We've defined for you a 9-long vector, mybin, which shows nine probabilities, the i-th of which is the probability that there
| are at least i-1 girls out of the 8 possible children. Look at mybin now.

> mybin
[1] 1.00000000 0.99609375 0.96484375 0.85546875 0.63671875 0.36328125 0.14453125 0.03515625 0.00390625

| All that hard work is paying off!

|=================================================================================================================|95%
| So mybin[1]=1.0, meaning that with probability 1 there are at least 0 girls, and mybin[2]=.996 is the probability that there's
 | at least 1 girl out of the 8, and so forth. The probabilities decrease as i increases. What is the least value of i for which
 | the probability is less than .05?
 
 > 8
 [1] 8
 
 | All that hard work is paying off!
 
 |===================================================================================================================|96%
 | So mybin[8]=.03 is the probability of having at least 7 girls out of a sample of size 8 under H_0 (if p actually is .5) which
 | is what our sample has. This is less than .05 so our sample falls in this region of rejection. Does that mean we accept or
 | reject H_0, (that either gender is equally likely) based on this sample of size 8?
 
 1: accept H_0
 2: reject H_0
 
 Selection: 2
 
 | You are amazing!
 
 |==================================================================================================================== |98%
 | Finally, we note that a 2-sided test would mean that our alternative hypothesis is that p is not equal to .5, and it's not
| obvious how to do this with a binomial distribution. Don't worry, though, because the next lesson on p-values will make this
 | clearer. It's interesting that for discrete distributions such as binomial and Poisson, inverting 2-sided tests is how R
| calculates exact tests. (It doesn't rely on the CLT.)

...

|====================================================================================================================== |99%
| Congrats! We confidently hypothesize that you're happy to have finished this lesson. Can we test this?

...

|=======================================================================================================================| 100%
| Would you like to receive credit for completing this course on Coursera.org?

1: Yes
2: No

Selection: 1
What is your email address? enrique.sedes@gmail.com
What is your assignment token? 9zLYAhov9nuSEfG3
Grade submission succeeded!

| You are really on a roll!

| You've reached the end of this lesson! Returning to the main menu...

| Please choose a course, or type 0 to exit swirl.

1: Statistical Inference
2: Take me to the swirl course repository!

Selection: 1

| Please choose a lesson, or type 0 to return to course menu.

1: Introduction 2: Probability1 3: Probability2 4: ConditionalProbability
5: Expectations 6: Variance 7: CommonDistros8: Asymptotics 
9: T Confidence Intervals10: Hypothesis Testing11: P Values12: Power 
13: Multiple Testing14: Resampling

Selection: 11

| Attempting to load lesson dependencies...

| Package ‘ggplot2’ loaded correctly!

| | 0%

| P_Values. (Slides for this and other Data Science courses may be found at github
 | https://github.com/DataScienceSpecialization/courses/. If you care to use them, they must be downloaded as a zip file and
 | viewed locally. This lesson corresponds to 06_Statistical_Inference/10_pValues.)

...

|===| 2%
| In this lesson, as the name suggests, we'll discuss p-values which have nothing to do with urological testing. Instead they
| are the most common measure of statistical significance.

...

|====== | 5%
| However, because they're popular they're used a lot, and often they're misused or misinterpreted. In this lecture we'll focus
| on how to generate them and interpret them correctly.

...

|======== | 7%
| The question motivating p-values is this. Given that we have some null hypothesis concerning our data (for example, its mean),
| how unusual or extreme is the sample value we get from our data? Is our test statistic consistent with our hypothesis? So
| there are, implicitly, three steps we have to take to answer these types of questions.

...

|===========|10%
| What do you think the first step is?

1: Compare the test statistic to a Z or t quantile
2: Consult your crystal ball
3: Create a null hypothesis
4: Calculate a test statistic from the data

Selection: 3

| You got it right!

|============== |12%
| So we have to begin with a null hypothesis which is a reasoned guess at some distribution of a data summary (a statistic).
| Recall from the last lesson that the null hypothesis H_0 is a baseline against which we'll measure an alternative hypothesis
| using the actual observed data.

...

|=================|14%
| So you propose a null hypothesis. What's the next step?

1: Reject H_0
2: Calculate a test statistic from the given data
3: Go back to the crystal ball
4: Compare the test statistic to a Z or t score

Selection: 2

| All that hard work is paying off!

|==================== |17%
| Now you have a proposed statistic (from your reasoned hypothesis) and a test statistic computed from your gathered data.
| What's the final step?

1: Calculate a test statistic from the given data
2: Reject H_0
3: Compare the test statistic to the hypothetical distribution
4: Go back to the crystal ball

Selection: 3

| Perseverance, that's the answer.

|=======================|19%
| Your comparison tells you how "extreme" the test value is toward the alternative hypothesis. The p-value is the probability
| under the null hypothesis of obtaining evidence as or more extreme than your test statistic (obtained from your observed data)
| in the direction of the alternative hypothesis.

...

|========================== |21%
| So if the p-value (probability of seeing your test statistic) is small, then one of two things happens. EITHER H_0 is true and
| you have observed a rare event (in this unusual test statistic) OR H_0 is false. Let's go through an example.

...

|============================ |24%
| Suppose that you get a t statistic of 2.5 with 15 df testing H_0, (that mu = mu_0) versus an alternative H_a (that mu > mu_0).
| We want to find the probability of getting a t statistic as large as 2.5.

...

|===============================|26%
| R can help us! We can use the R function pt, the distribution function of the t distribution. This function returns one of two
| probabilities, EITHER the probability of X > q (if lower.tail is FALSE) OR X <= q (if lower.tail is TRUE), where q is a
| quantile argument. Here we'll set q=2.5, df=15, lower.tail=FALSE since H_a says that mu>mu_0. We have to gauge the extremity
| in the direction of H_a. Run this now.

> pt(2.5,15,lower.tail = FALSE)
[1] 0.0122529

| You got it!

|================================== |29%
| This result tells us that, if H_0 were true, we would see this large a test statistic with probability 1% which is rather a
| small probability.

...

|=====================================|31%
| What should we do?

1: Consult the crystal ball
2: Fail to reject H_0
3: Reject H_0

Selection: 2

| Keep trying!

| 1% is less than the usual benchmark of 5%

1: Fail to reject H_0
2: Consult the crystal ball
3: Reject H_0

Selection: 3

| Keep working like that and you'll get there!

|======================================== |33%
| Another way to think about a p-value is as an attained significance level. This is a fancy way of saying that the p-value is
| the smallest value of alpha at which you will reject the null hypothesis.

...

|========================================== |36%
| Recall the example from our last lesson in which we computed a test statistic of 2. Our H_0 said that mu_0 = 30 and the
| alternative H_a that mu > 30. Assume we used a Z test (normal distribution). We rejected the one sided test when alpha was set
| to 0.05.

...

|=============================================|38%
| Why did we reject? Find the quantile associated with this test, that's the place to start. Use qnorm at the 95th percentile.

> qnorm(0.95)
[1] 1.644854

| That's correct!

|================================================ |40%
| We rejected H_0 because our data (the test statistic actually) favored H_a. The test statistic 2 (shown by the vertical blue
| line) falls in the shaded portion of this figure because it exceeds the quantile. As you know, the shaded portion represents
| 5% of the area under the curve.

...

|===================================================|43%
| Now try the 99th percentile to see if we would still reject H_0.

> qnorm(0.99)
[1] 2.326348

| Your dedication is inspiring!

|====================================================== |45%
| Would we reject H_0 if alpha were .01?

1: No
2: Yes

Selection: 1

| You got it!

|=========================================================|48%
| Again, a picture's worth a thousand words, right? The vertical line at the test statistic 2 is not in the region of rejection.

...

|============================================================ |50%
| So our data (the test statistic) tells us what the attained significance level is. We use the R function pnorm to give us this
| number. With the default values, specifically lower.tail=TRUE, this gives us the probability that a random draw from the
| distribution is less than or equal to the argument. Try it now with the test statistic value 2. Use the default values for all
| the other arguments.

> skip()

| Entering the following correct answer for you...

> pnorm(2)
[1] 0.9772499

| You are really on a roll!

|============================================================== |52%
| Just as we thought, somewhere between .95 (where we rejected) and .99 (where we failed to reject). That's reassuring.

...

|=================================================================|55%
| Now let's find the p value associated with this example. As before, we'll use pnorm. But this time we'll set the lower.tail
| argument to FALSE. This gives us the probability of X exceeding the test statistic, that is, the area under the curve to the
| right of test statistic. Try it now with the test statistic value 2.

> skip()

| Entering the following correct answer for you...

> pnorm(2,lower.tail=FALSE)
[1] 0.02275013

| You are really on a roll!

|==================================================================== |57%
| This tells us that the attained level of significance is about 2%.

...

|=======================================================================|60%
| By reporting a p-value, instead of an alpha level and whether or not you reject H_0, reviewers of your work can hypothesis
| test at any alpha level they choose. The general rule is that if the p-value is less than the specified alpha you reject the
| null hypothesis and if it's greater you fail to reject.

...

|========================================================================== |62%
| For a two sided hypothesis test, you have to double the smaller of the two one-sided p values. We'll see an example of this
| shortly. Most software assumes a two-sided test and automatically doubles the p value.

...

|============================================================================ |64%
| Now for the two-sided test. Recall the binomial example from the last lesson - the family with 8 children, 7 of whom are
| girls. You want to test H_0, that p=.5, where p is the probability of a girl (like a fair coin flip). H_a is that p is not
| equal to .5. It's either greater or less than .5.

...

|===============================================================================|67%
| This is a two-sided test. First we find the probability of having at least i girls, for i running from 0 to 8. We have a
| vector of these probabilities, mybin. Look at it now.

> mybin
[1] 1.00000000 0.99609375 0.96484375 0.85546875 0.63671875 0.36328125 0.14453125 0.03515625 0.00390625

| All that practice is paying off!

|================================================================================== |69%
| The second last value shows us that the probability of having at least 7 girls (out of 8 children) is .035, assuming that
| genders are equally likely (p=.5).You can verify this with the R function pbinom, with the arguments 6, size=8, prob=.5, and
| lower.tail=FALSE. (This last yields the probability that X>6.) Try this now.

> skip()

| Entering the following correct answer for you...

> pbinom(6,size=8,prob=.5,lower.tail=FALSE)
[1] 0.03515625

| Keep up the great work!

|=====================================================================================|71%
| We see a probability of about .03. Should we reject or fail to reject H_0 if alpha = .05?

1: Reject
2: Fail to reject

Selection: 1

| That's the answer I was looking for.

|======================================================================================== |74%
| We see a probability of about .03. Should we reject or fail to reject H_0 if alpha = .04?

1: Fail to reject
2: Reject

Selection: 2

| That's the answer I was looking for.

|===========================================================================================|76%
| We see a probability of about .03. Should we reject or fail to reject H_0 if alpha = .03?

1: Fail to reject
2: Reject

Selection: 1

| Keep up the great work!

|============================================================================================== |79%
| For the other side of the test we want the probability that X<=7, again out of a sample of size 8 with probability .5. Again,
| we use pbinom, this time with an argument of 7 and lower.tail=TRUE. Try this now.

> skip()

| Entering the following correct answer for you...

> pbinom(7,size=8,prob=.5,lower.tail=TRUE)
[1] 0.9960938

| You're the best!

|================================================================================================ |81%
| So it's pretty likely (probability .996) that out of 8 children you'll have at most 7 girls. The p value of this two sided
| test is 2*the smaller of the two one-sided values. In this case the lower value is .035, so 2*.035 is the p-value for this
| two-sided test.

...

|===================================================================================================|83%
| Now a final example using a Poisson distribution. Remember that this is discrete and it involves counts or rates of counts.
| The example from the slides involves rates of infections in a hospital.

...

|====================================================================================================== |86%
| Suppose that the hospital has an infection rate of 10 infections per 100 person/days at risk. This is a rate of 0.1.Assume
| that an infection rate of 0.05 is the benchmark. This is our alpha level, recognize it? With this model, could the observed
| rate (.1) be larger than the benchmark 0.05 by chance or does it indicate a problem?

...

|=========================================================================================================|88%
| In other words, H_0 says that lambda = 0.05 so lambda_0 * 100 = 5, and H_a says that lambda > 0.05. Is H_0 true and our
| observed rate (.1) is just a fluke OR should we reject H_0 ?

...

|============================================================================================================ |90%
| As before, R has the handy function ppois, which returns probabilities for Poisson distributions. We want the probability of
| seeing at least 9 infections using a lambda value of 5 and lower.tail=FALSE. As when we used pbinom we have to use 9 as the
| argument since we're looking for a probability of a value greater than the argument. Try this now.

> skip()

| Entering the following correct answer for you...

> ppois(9,5,lower.tail=FALSE)
[1] 0.03182806

| You got it!

|============================================================================================================== |93%
| We see a probability of about .03. Should we reject or fail to reject H_0? (Remember those helpful pictures with shaded areas.
| Smaller areas mean smaller probabilities and vice versa.)

1: Reject
2: Fail to reject

Selection: 1

| Perseverance, that's the answer.

|=================================================================================================================|95%
| So we reject the infection rate hypothesized by H_0 since the data favors H_a, indicating that the rate is much higher.

...

|==================================================================================================================== |98%
| Congrats! You finished this lesson. We hope you p-valued it.