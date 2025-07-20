-Project OverView
*Customer behaviour and sales analysis .
*Using SQL to clean data and calculate business KPIs an trend analysis
*Using Power BI to visualize the data amd answer Business Questions and draw insights


-Tools Used
*SQL 
*Power BI

-Data Extraction and Data Cleaning
*Extracted sales data from Kaggle:
*I then loaded the data in SQL server
*Used CTEs to check duplicated values from 1000 rows, Standardized
text using string functions, used date functions to standardize and
extract date column fields such as the day of the week and month
names to use during time series analysis
* Used Drop functionality in SQL server to remove unnecessary
columns which would not be of any use during the analysis process.
*Finally used Select statements to check for any null values in the
data set

-Exploratory Data Analysis and calculating KPIs
*Used Sql server and Tsql to calculate kpi and do a time series analysis
*Calculated KPIs in SQL sever:
1.Total Revenue For the Year
2.Total revenue on each item type
3.Total number of orders made
4.Total number of orders on each item type
5.Average order value
6.Average order value of each item type for the year
*Trend Analysis:looked at monthly trends and which months generated the most amount of sales ,same for daily trends
*Looked at customer behaviour and how this affected sales, using the gender of customers ,what food items they were peole spending more on and how many items were being bought on each order based on gender ,transaction type and the menu items themselves,
did this by using Sql functions such as sum() and group by to perfom these calculations


-Creating a restaurant sales dashboard in Power BI and Compiling business insights
*Connected Power BI to SQL server and fetched and further transformed the data in Power Query 
*Used DAX functions to calculate KPIs
*Created a sales dashboard analyzing overall sales for the different months and days and the time of day  most sales and orders were made and undersatnding these trends on what they infered on customer behaviour 
*Creted a second dashboard on customer bahaviour on most orders made, the type of menu items they mostly bought  base on revenue generated on each item and the number of orders made ,all of this further basing on also on customer characteristics such as gender and the transaction types they made.



-Business Insights and Incentives
*customer buying decision seemed to be based primarily on quality and preference with
the cheapest menu items making the least number of sales and orders. 
*As a business solution and an incentive geared towards this insight, the business/restaurant Balaji as a way to maximize sales :
1. They should aggressively promote the bestselling menu items like the Sandwich, the Frankie and the
Cold coffee beverage e.g. Highlighting the items on the menu as “Trending”,” Most Popular”,” People’s
favourites” as way to draw more people in.
3. Use Upselling methods as a way again to draw more people towards these items e.g. offer additional
items at lower prices for buying the popular items, like a person can get sugarcane juice priced at ₹20
for ₹15 if they buy with a Sandwich or another item.
3.Add varieties of the popular items to the menu e.g. to the popular items like the Sandwich, introduce
and offer different variations to the traditional popular Sandwich adding different ingredients and selling
it.
Further insight also suggested that most users were using cash with almost 60 % using cash and 40% using
card payments, to improve customer experience and boost positive reviews, in place there should be
procedures to increase service time, for cash users having change and training stuff members in
handling cash quicker to avoid delays in order time, for card users making sure all card machines are
reliable and process fast, buy more card machines. As we are a digitally evolving society it might be
better to encourage card payments, offer discounts for card payments e.g. “Spend more than R 250 on
card payment and get 15% off”



