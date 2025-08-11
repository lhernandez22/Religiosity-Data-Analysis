** Summary Statistics
* Name: Lissette Hernandez
* Date: 4/2/2025

* Load in file path for GSS data, we'll be using data from 2016
use "C:\Users\lherna22\My Files\Temporary Files\GSS2016.dta", clear

* 1: Summarize the key independent and dependent variables, and controls if possible
sum attend facebook instagrm twitter snapchat
sum attend facebook instagrm twitter snapchat age income
* Dependent Variable (Y): attend
* Independent Variables (X): facebook, instagrm, twitter, snapchat
tabstat facebook instagrm twitter snapchat, by(attend) statistics(mean sd)
tabstat facebook instagrm twitter snapchat, by(attend) statistics(n mean sd) columns(statistics)
* Regression Model: attend = b0 + b1(facebook) + b2(instagrm) + b3(twitter) + b4(snapchat) + e
* b0 = intercept; the expected value of attend when all social media usage is 0
* b1,b2,b3,b4 =  coefficients for each social media; represents the effect of each on attend
* e = error term; represents the variation in attend explained by the independent variables
regress attend facebook instagrm twitter snapchat
regress attend facebook instagrm twitter snapchat age income
* create dummy variables for relig
* relig is categorical, not numeric
* relig_2, or catholic is the reference group
tabulate relig, generate(relig_)
regress attend facebook instagrm twitter snapchat age income relig_1 relig_3 relig_4 relig_5 relig_6 relig_7 relig_8 relig_9 relig_10 relig_11 relig_12 relig_13
* 1 protestant, 2 catholic, 3 jewish, 4 none, 5 other, 6 buddhism, 7 hinduism, 8 other eastern religions, 9 muslim/islam, 10 orthodox-christian, 11 christian, 12 native american, 13 inter-nondenominational
* Facebook x Religion
*regress attend i.relig##c.facebook instagrm twitter snapchat age income
*margins relig, at(facebook=(0(1)5))
*marginsplot
* Instagram x Religion
*regress attend i.relig##c.instagrm facebook twitter snapchat age income
*margins relig, at(instagrm=(0(1)5))
*marginsplot
* Twitter x Religion
regress attend i.relig##c.twitter facebook instagrm snapchat age income
margins relig, at(twitter=(0(1)5))
marginsplot
* Snapchat x Religion
*regress attend i.relig##c.snapchat facebook instagrm twitter age income
*margins relig, at(snapchat=(0(1)5))
*marginsplot


********************************************************************************


