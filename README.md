# Super-Store-Sales---PowerBI
Using PowerBI and R studio to do an EDA on a superstore dataset
## Executive Summary
### Overview of Findings:
Sales across all time periods shows a strong trend of **seasonality** with sales peaking in December and dropping by about **70%** in January. The **technology** sector generates the **highest number of sales** in any category and sector although it has the lowest order count. Amongst, the technology sector, mobile phones make up the majority of the **revenue by 40%**.
Although the business has a high customer retention rate of 0.98 which means **98%** of customers who have bought an item before has gone to purchase another item in the future, the number of new customers has been decreasing drastically over time.
In this report, we will explore the data and find the cause or ways to **attract new customer**s overtime.


### Sales Trends:

<img width="954" height="471" alt="image" src="https://github.com/user-attachments/assets/1ad0c2ea-d048-4a9e-b421-e587ed0ba051" />


The seasonality pattern is shown across all sectors, consumer, corporate and home office which indicates **increased spending** on holidays such as black Fridays in November purchases and Christmas in December. 

* There’s a positive trend in sales as sales go up on average **£1,200–1,500 per month** across 2015–2018. This equates to an approximate **£15K–18K annual growth.**

* Despite having the lowest amount of orders, the technology sector has the highest sales of **£830k** compared to Furniture and Office Supplies with sales of **£728k** and **£705k** respectively. 

* There seems to be a **spike in technology purchases** around March, unexplained by our previous findings and diving deeper into the data, it looks like the spike is more present in the home office and consumer line. In many markets, March is the end of a Fiscal year, and small businesses and individuals often make last minute purchases to claim tax deductions. This aligns with **bulk buying** of machines, accessories and office supplies, which could explain the spike in March sales.


### Customers

<img width="1076" height="579" alt="image" src="https://github.com/user-attachments/assets/531f0824-e6e1-41c2-b326-c2b5414f4d95" />


*	The number of new customers has **sharply decreased** over the years, yet the total number of customers and sales have **increased** over time indicating an extremely loyal base of customers and unfortunately, a fault in the synthetic data. 

*	This a big problem for the businesses’ future, new customers drive the continuous growth of businesses and we need a way to **increase the number of new customers.**
So how can we introduce new customers?

### Recommendations

<img width="1654" height="327" alt="image" src="https://github.com/user-attachments/assets/18fe1d2a-cd09-4da5-a8d1-bf4c4ca920ae" />

Looking at the chart above, we see the number of **gateway customers** which is the number of new customers that purchased a product. The repeat customers after gateway means how many more products the new customers that bought that same product and went on to buy other products. It shows that 98% of new customers that bought a product also bought another product down the line. That’s quite impressive.

### What to do next (action plan)
#### Acquire new customers
*	Prioritize ads/SEO for **Staples / Staple envelope** (high gateway pull).
*	On those product pages and post-purchase emails, **cross-sell** the top “next items” you find (e.g., Paper, Binders, Tech accessories).
*	Track **Repeat Rate After Gateway** and **Avg Days to Second Purchase** monthly to see if campaigns improve stickiness.
*	A focus on advertising on the **West** and **East** region will increase new customers as the West and East region **combined** has historically **pulled 60%** of new customers.
*	Target **Consumer** in Q4; **Home Office** in March (fiscal year-end in several markets).
#### Merchandising & Inventory
*	**Seasonal calendar**:
*	Nov: Phones + accessories (Black Friday/Cyber Monday).
*	Dec: Machines/Accessories (year-end budgets).
*	Mar: Home-office bundles (chairs, printers, paper) for fiscal-year end.
*	**Stock planning:** Pull Tech inventory forward into Nov/Dec; ensure March supply for home-office demand.
*	**SKU hygiene:** De-emphasize low-gateway/low-repeat items; consider private-label for high-volume supplies
With these recommendations, the business will likely grow and become sustainable in the future.
However, we should the curious about the company’s future projection and growth if we never implement these steps, what could it look like a year from now.

### Time Series Analysis – Forecasting Future Sales
#### Objective
To project the company’s sales for the next 12 months, a time series forecasting approach was applied using monthly aggregated sales data from 2015–2018. The analysis focuses on detecting seasonality, trend, and uncertainty in future sales to support inventory, marketing, and financial planning.
Methodology
1.	**Data Preparation**
*	Sales were aggregated at the monthly level.
*	Built a time series model with frequency = 12 to capture monthly seasonality.
2.	**Models Applied**
*	ARIMA (Auto-Regressive Integrated Moving Average): Captures trend, autocorrelation, and seasonal patterns.
*	ETS (Error-Trend-Seasonality Exponential Smoothing): Provides smoothed forecasts emphasizing seasonality and trend.
*	An ETS Model is chosen for the forecast as while ARIMA captures short-term volatility, the ETS model provides a smoother forecast that aligned more closely with our highly seasonal data.
3.	**Forecast Horizon**
*	12 months ahead (2019-01 to 2019-12).
*	Forecasts include 80% and 95% confidence intervals to quantify uncertainty.

### Results
<img width="786" height="821" alt="image" src="https://github.com/user-attachments/assets/bb65ae14-f4bc-4c8c-ac9a-518ea043d26c" />


<img width="469" height="738" alt="image" src="https://github.com/user-attachments/assets/b036aba1-5cf6-4a9d-b544-4197a3e53f12" />


### Overall Insights
Q1 Growth is very positive and very strong in February and dips in Oct and Nov due to the high spike in 2018 which an ETS model is limited in.
The model overall, projects **weaker sales in Q3 and Q4** but shows a stronger projection in December, possibly explained by the overall positive trend.

### Visual Insights (ETS Forecast Plot)
*	The **black line** shows historical sales (2015–2018).
*	The **blue fan chart** represents the **forecast for 2019**, with wider shading indicating growing uncertainty.
*	Sales show **clear seasonality:** peaks in Nov–Dec, sharp declines in Jan, and occasional March surges.
*	The **point forecast** for Dec 2019 reaches ~£98.8K, consistent with historical holiday spikes.

<img width="940" height="667" alt="image" src="https://github.com/user-attachments/assets/8a0c1150-e6ab-41ed-a002-89b723e87e74" />


### Model Diagnostics
When deciding what model to use for the time series analysis, there were two models that were described above that I had to choose from. An Arima(0,1,1)(0,1,1)[12] model or an ETS model.
**ARIMA Model (0,1,1)(0,1,1)[12]**
**Residual Analysis:**
*	Residuals show some autocorrelation at multiple lags in the ACF plot → suggests the model has not captured all seasonal structure.
*	Residual histogram is slightly skewed, not fully Gaussian.
**Training Accuracy:**
*	RMSE = 9390.5
*	MAE = 6362.7
*	MAPE = 14.3%
**Interpretation:**
*	While ARIMA captures short-term volatility, it leaves more unexplained structure in the residuals.
*	Forecasts are less smooth and harder to interpret for executives.

<img width="839" height="1202" alt="image" src="https://github.com/user-attachments/assets/dd6a9a83-3a27-4f10-ae59-d6562a0e1fbe" />

### ETS Model (A,N,A) — Additive Error, No Trend, Additive Seasonality**Residual Analysis:**
*	Residuals look more randomly scattered, closer to white noise.
*	Ljung–Box test (Q* = 15.857, p-value = 0.1038) fails to reject null hypothesis → residuals are not significantly autocorrelated.
*	Histogram of residuals is closer to normal.
**Training Accuracy:**
*	RMSE = 9749.9
*	MAE = 7799.3
*	MAPE = 21.9% (slightly worse on training error than ARIMA).
**Interpretation:**
*	Despite slightly higher training error, ETS produces cleaner residuals and passes the diagnostic checks.
*	Forecasts align closely with the known seasonal pattern (Nov–Dec peaks, Jan dips), making them easier to communicate

<img width="833" height="1203" alt="image" src="https://github.com/user-attachments/assets/6763072c-d4d0-4bb8-8b67-1735f7f25359" />

### Final Choice: ETS Model
ETS was chosen as the final forecasting model because:
*	Residuals are well-behaved (white noise, no strong autocorrelation).
*	Seasonality is captured explicitly and transparently.
*	Produces smoother, interpretable forecasts aligned with known business cycles.
*	Slightly higher error is outweighed by stronger diagnostics and interpretability.

