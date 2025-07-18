SELECT * FROM balaji_sales

----EDA and cleaning data
--removing nulls
ALTER TABLE balaji_sales
DROP COLUMN column11,column12,column13 ;--removing the columns I will notbe using during the data analysis process

--checking if other rows and columns have nulls
SELECT * FROM balaji_sales WHERE order_id IS NULL
SELECT * FROM balaji_sales WHERE [date] IS NULL
SELECT * FROM balaji_sales WHERE item_name IS NULL
SELECT * FROM balaji_sales WHERE item_type IS NULL
SELECT * FROM balaji_sales WHERE quantity IS NULL
SELECT * FROM balaji_sales WHERE transaction_amount IS NULL
SELECT * FROM balaji_sales WHERE transaction_type IS NULL
SELECT * FROM balaji_sales WHERE received_by IS NULL
SELECT * FROM balaji_sales WHERE time_of_sale IS NULL;


--Adding coloumns for the Date coloumn for trend analysis:-Day of the week ,Month

ALTER TABLE balaji_sales
ADD DayOfTheWeek as DATENAME(DW,[date]),
    MonthOfSale as DATENAME(MONTH,[date]);

SELECT * FROM balaji_sales


--Satndardizing values :gender column M to Male and F to female
SELECT Distinct(received_by) from balaji_sales -- making sure there are no other values

UPDATE balaji_sales
SET received_by='Male'
WHERE received_by='M'
UPDATE balaji_sales
SET received_by='Female'
WHERE received_by='F'


--checking for duplicated values
With dupls as (
SELECT order_id,date,item_name ,ROW_NUMBER() OVER(PARTITION BY order_id,date,item_name ORDER BY order_id) as RowNum FROM balaji_sales
)

SELECT * FROM dupls WHERE RowNum>1 




---CALCULATING KPIs
--1.Total Revenue For the Year
SELECT Round(SUM(transaction_amount),2) as [Total Revenue] FROM balaji_sales

--2.Revenue Generated from Food and beverages seperated
SELECT Round(SUM(transaction_amount),2) as [Total Revenue],item_type FROM balaji_sales GROUP BY item_type --which item typeshould we invest more resources on?
 

--3.Total Meals and beverages sold during the year
SELECT SUM(quantity) as [QauntitySold],item_type FROM balaji_sales GROUP BY item_type


--4.Total number of orders
SELECT COUNT(order_id) as [Total Orders] FROM balaji_sales

--5.Total number of orders for each type
SELECT COUNT(order_id) as [Total Orders],item_type FROM balaji_sales GROUP BY item_type

--6.Average Order value
SELECT  SUM(transaction_amount)/COUNT(order_id) as [Avg Order Value] FROM balaji_sales 

--7 Average Order for Meals and bevrages
SELECT  SUM(transaction_amount)/COUNT(order_id) as [Avg Order Value],item_type FROM balaji_sales  GROUP BY item_type



----ANALYSIS
--Trend Analysis
--1.Monthly sales
SELECT SUM(transaction_amount) AS [Sales],YEAR([date]) as [Year],MonthOfSale  FROM balaji_sales GROUP BY YEAR([date]),MonthOfSale Order by YEAR([date])
---1.1 Month with the most Sales
SELECT SUM(transaction_amount) AS [Sales],YEAR([date]) as [Year],MonthOfSale 
FROM balaji_sales GROUP BY YEAR([date]),MonthOfSale
Order by SUM(transaction_amount)  DESC

--2.Daily Sales
SELECT SUM(transaction_amount) AS [Sales],DayOfTheWeek 
FROM balaji_sales 
GROUP BY DayOfTheWeek 
ORDER BY SUM(transaction_amount) DESC


--2.2 Time of Day sales

SELECT SUM(transaction_amount) AS [Sales],time_of_sale
FROM balaji_sales 
GROUP BY time_of_sale
ORDER BY SUM(transaction_amount) DESC



--ANALYSIS
--Gender and buying power
SELECT SUM(transaction_amount) AS [Sales],received_by
FROM balaji_sales 
GROUP BY received_by
ORDER BY SUM(transaction_amount) DESC

--Trasansaction type and affects on sales
SELECT SUM(transaction_amount) AS [Sales],transaction_type
FROM balaji_sales 
GROUP BY transaction_type
ORDER BY SUM(transaction_amount) DESC

--Looking at the top meals that generated most sales
SELECT SUM(transaction_amount) as [Sales],item_name 
FROM balaji_sales 
WHERE item_type='Fastfood' 
GROUP BY item_name 
ORDER BY SUM(transaction_amount) DESC


--Looking at the top beverages that generated most sales
SELECT SUM(transaction_amount) as [Sales],item_name 
FROM balaji_sales 
WHERE item_type='Beverages' 
GROUP BY item_name 
ORDER BY SUM(transaction_amount) DESC


--Looking at the top meals that were bought the most
SELECT SUM(quantity) as [Items Sold],item_name 
FROM balaji_sales 
WHERE item_type='Fastfood' 
GROUP BY item_name 
ORDER BY SUM(quantity) DESC

--Looking at the top beverages that were bought the most
SELECT SUM(quantity) as [Items Sold],item_name 
FROM balaji_sales 
WHERE item_type='Beverages' 
GROUP BY item_name 
ORDER BY SUM(quantity) DESC


SELECT * FROM balaji_sales