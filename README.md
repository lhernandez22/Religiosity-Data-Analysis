# Religiosity-Data-Analysis
**Goal**: Explore the relationship between social media usage and church attendance in the U.S. Using data from the General Social Survey, I examine whether engagement with digital platforms substitutes or complements traditional religious participation.

## Tools & Technologies
- R, OLS Regression, General Social Survey (GSS)

## Dataset
- Source: General Social Survey 
- 1,367 observations
- Key variables:
  - `attend` — frequency of attending religious services (dependent variable)
  - `instagrm`, `facebook`, `twitter`, `snapchat` — social media usage (independent variables)
  - `age`, `income` — control variables
  - `relig` — religious affiliation
## Methods 
Two main OLS regression models:
1. Univariate model: `attend ~ instagrm + snapchat + twitter + facebook`
2. Multivariate model: same as above + `age` + `income`
Also ran interaction models to test whether the effect of social media usage varies by religious affiliation, with 'Catholic' as the reference group.

## Findings
- Univariate regression: No statistically significant relationship between any social media platform and church attendance.
- Multivariate regression:
  - Age is positively associated with attendance (p < 0.05).
  - Social media usage remains non-significant overall.
- Interaction analysis:  
  - Facebook use is more negatively associated with attendance for non-traditional religious groups and people with no religion.
  - Other platforms show small or inconsistent effects.
  Media narratives suggesting that social media “pulls people away from church” are not strongly supported by the data.
- Age remains the most significant predictor; older individuals attend more frequently.
- Platform effects differ across religious groups, with Facebook showing the most variation.

## Files
- Report: 'Religiosity Research Analysis'
- STATA Code: A12Final.do
- Dataset: GSS2016
