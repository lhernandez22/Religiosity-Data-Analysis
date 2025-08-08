** Summary Statistics
* Name: Lissette Hernandez
* Date: 4/2/2025

* Load in file path for GSS data, we'll be using data from 2016
use "C:\Users\lherna22\My Files\Temporary Files\GSS2016.dta", clear


* 1: Summarize the key independent and dependent variables, and controls if possible
sum attend facebook instagrm twitter snapchat
* Dependent Variable (Y): attend
* Independent Variables (X): facebook, instagrm, twitter, snapchat
tabstat facebook instagrm twitter snapchat, by(attend) statistics(mean sd)
)
tabstat facebook instagrm twitter snapchat, by(attend) statistics(n mean sd) columns(statistics)
* Regression Model: attend = b0 + b1(facebook) + b2(instagrm) + b3(twitter) + b4(snapchat) + e
* b0 = intercept; the expected value of attend when all social media usage is 0
* b1,b2,b3,b4 =  coefficients for each social media; represents the effect of each on attend
* e = error term; represents the variation in attend explained by the independent variables

* 2: Include sample means and standard deviations.
* Attend -> mean: 3.400702 ; St.dv:  2.803773 ; Total Obs: 2,850
* Facebook -> mean: 1.255102 ; St.dv: .4360775 ; Total Obs: 1,372 
* Instagram -> mean: 1.691691 ; St.dv: .4619633; Total Obs: 1,372 
* Twitter -> mean: 1.81414 ; St.dv: .3891355 ; Total Obs: 1,372 
* Snapchat -> mean: 1.773324 ; St.dv: .4188342 ; Total Obs: 1,372 

********************************************************************************
* Make a new variable: socialmedia to account for all social platforms
gen socialmedia = .
replace socialmedia = facebook if year == 2016
replace socialmedia = instagrm if year == 2016
* Create graph of how total giving changes over time in California
graph bar (mean) total if state == 6, over(year)
* Verify mean total with given values
graph bar (mean) total if state == 6, over(year) blabel(bar)
*Tabulate command
tab trust
*Show observations where this variable is missing (like respondents who refused to answer, or years where this question wasn't asked
tab trust, missing
*The variable "trust" is stored as a number; stata knows different values mean different things. If you want to see the underlying numbers for trust, add "nolabel" to the end of the command:
tab trust, missing nolabel

*Let's make a new variable that equals 1 if people are trusting, and 0 otherwise. There are a few ways to do this. Here is one:
*Start making a variable that is missing everywhere.  Note one = sign:
generate cantrust = .  
replace cantrust = 1 if trust==1
replace cantrust = 0 if trust==2
replace cantrust = 0 if trust==3
 *now we have a variable that is 1 if people say you can trust others, 0 if the say something else, and missing if they weren't asked or didn't answer
 
*We can label our new variable too. Here is a simple way to do that:
label variable cantrust "=1 if people say you can trust others, 0 otherwise"

* Regress variables
regress attend facebook instagrm twitter snapchat

