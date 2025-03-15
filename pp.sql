create database amazon;
Use amazon;
show databases;

Create View totalsales As
SELECT product_name, Region, SUM(Sales) AS Total_Sales
FROM amazon
GROUP BY product_name, Region
ORDER BY Total_Sales DESC;

Create View Top_best_selling_product As
SELECT product_name, SUM(Quantity) AS Total_Quantity_Sold
FROM amazon
GROUP BY product_name
ORDER BY Total_Quantity_Sold DESC
LIMIT 5;

Create View average_discount As
select category,avg(discount_percentage) as Avg_Discount
from amazon
group by category;

Create View revenue_impact_of_discount As
SELECT product_name,
    SUM(Sales) AS Discounted_Revenue,
    SUM(Quantity * actual_price) AS Potential_Revenue,
    (SUM(Quantity * actual_price) - SUM(Sales)) AS Revenue_Impact
FROM amazon
GROUP BY product_name;

Create View Average_rating_by_Product As
SELECT product_name, AVG(rating) AS Avg_Rating, SUM(rating_count) AS Total_Ratings
FROM amazon
GROUP BY product_name
ORDER BY Avg_Rating DESC;

Create View Most_Reviewed_Product As
SELECT product_name, COUNT(DISTINCT review_id) AS Review_Count
FROM amazon
GROUP BY product_name
ORDER BY Review_Count DESC
LIMIT 10;
# to change the exixting view
DROP VIEW IF EXISTS Most_active_reviewer;

Create View Most_active_reviewer As
SELECT user_name, COUNT(DISTINCT review_id) AS Review_Count
FROM amazon
GROUP BY user_name
ORDER BY Review_Count DESC
LIMIT 5;

Create View Sales_distribution_by_category As
SELECT category, SUM(Sales) AS Total_Sales, COUNT(DISTINCT user_id) AS Product_Count
FROM amazon
GROUP BY category
ORDER BY Total_Sales DESC;

#1 total sales by product and region
select * from totalsales;
#2 top 5 best selling product
select * from Top_best_selling_product;

#3 PRICE AND DISCOUNT ANALYSIS
#average discount % by category
select * from average_discount ;
#4Revenue Impact of Discounts
select * from revenue_impact_of_discount ;

#5CUSTOMER FEEDBACK ANALYSIS
#5 Average Rating by Product
select * from Average_rating_by_Product;
#6 Most Reviewd Product
select * from Most_Reviewed_Product;
#USER ENGAGMENT
#6 Most Reviewd Product\
select * from Most_active_reviewer;

#PRODUCT CATEGORY ANALYSIS
#7  Sales_distribution_by_category
select * from  Sales_distribution_by_category;














