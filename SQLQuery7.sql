--SQL Queries Data Analysis for Customer Shopping Trends 

-- Find all 
SELECT *
FROM ['Customer Shopping trends$'];

-- Find all categories
SELECT *
FROM ['Customer Shopping trends$']
order by Category;

--List all items purchased in the "Clothing" category with a purchase amount greater than $25
SELECT * 
FROM ['Customer Shopping trends$']
WHERE Category = 'Clothing' AND [Purchase Amount (USD)] > 25;

-- Find all Location
SELECT *
FROM ['Customer Shopping trends$']
order by Location;

SELECT * 
FROM ['Customer Shopping trends$']
WHERE Location = 'Rhode Island';

-- Find all customers ordered by Gender then Item Purchased
SELECT *
from ['Customer Shopping trends$']
ORDER BY Gender, [Item Purchased];

--customer ID that has the highest number of purchases and the total number of purchases made by that customer
SELECT [Customer ID], COUNT(*) AS TotalPurchases
FROM ['Customer Shopping trends$']
GROUP BY [Customer ID]
ORDER BY TotalPurchases DESC

--Total amount spent using each payment method.
SELECT [Payment Method], SUM([Purchase Amount (USD)]) AS TotalAmount
FROM ['Customer Shopping trends$']
GROUP BY [Payment Method]
ORDER BY TotalAmount DESC;

--Average spending for each payment method.
SELECT [Payment Method], AVG([Purchase Amount (USD)]) AS AvgAmount
FROM ['Customer Shopping trends$']
GROUP BY [Payment Method]
ORDER BY AvgAmount DESC;

-- How often customers use promo codes with different payment methods.
SELECT [Payment Method], COUNT(DISTINCT [Promo Code Used]) AS NumberOfPromoUses
FROM ['Customer Shopping trends$']
WHERE [Promo Code Used] = 'Yes'
GROUP BY [Payment Method]
ORDER BY NumberOfPromoUses DESC;

--Review rating for all satisfaction level across all purchases.
SELECT AVG([Review Rating]) AS OverallAvgRating
FROM ['Customer Shopping trends$'];

--Review average satisfaction level for each product category.
SELECT Category, AVG([Review Rating]) AS AvgRating
FROM ['Customer Shopping trends$']
GROUP BY Category
ORDER BY AvgRating DESC;

-- Review ratings associated with purchases made using different payment methods.
SELECT [Payment Method], AVG([Review Rating]) AS AvgRating
FROM ['Customer Shopping trends$']
GROUP BY [Payment Method]
ORDER BY AvgRating DESC;

--List all purchases made by customers who use "Venmo" as their payment method
SELECT * 
FROM ['Customer Shopping trends$']
WHERE [Payment Method] = 'Venmo';

--The most payment method used and the total number of tranactions made
SELECT [Payment Method], COUNT(*) AS TotalTransactions
FROM ['Customer Shopping trends$']
GROUP BY [Payment Method]
ORDER BY TotalTransactions DESC

--Find the total number of items purchased in each category
SELECT Category, COUNT(*) AS TotalItems
FROM ['Customer Shopping trends$']
GROUP BY Category;

SELECT COUNT(DISTINCT Gender)
FROM ['Customer Shopping trends$'];

-- Find all gender by category
SELECT Gender, COUNT(DISTINCT Category) AS TotalCategoriesPurchased
FROM ['Customer Shopping trends$']
GROUP BY Gender
ORDER BY TotalCategoriesPurchased DESC;

--All the categories
SELECT Category, COUNT(*) AS CategoryCount
FROM ['Customer Shopping trends$']
GROUP BY Category
ORDER BY CategoryCount DESC;

--Category with the most sales
SELECT Category, SUM([Purchase Amount (USD)]) AS TotalSales
FROM ['Customer Shopping trends$']
GROUP BY Category
ORDER BY TotalSales DESC

--
SELECT COUNT(*) AS TotalPurchases
FROM ['Customer Shopping trends$'];


-- Total number of purchases made by individuals aged 20-30.
SELECT COUNT(*) AS TotalPurchases
FROM ['Customer Shopping trends$']
WHERE Age BETWEEN 20 AND 30;

-- Total number of purchases made by each age group, sorted by total purchases.
SELECT 
    CASE 
        WHEN Age BETWEEN 10 AND 20 THEN '10-20'
        WHEN Age BETWEEN 21 AND 30 THEN '21-30'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        WHEN Age BETWEEN 51 AND 60 THEN '51-60'
        ELSE '61 and above'
    END AS AgeGroup,
    COUNT(*) AS TotalPurchases
FROM ['Customer Shopping trends$']
GROUP BY Age
ORDER BY TotalPurchases DESC;

--Average made by each age group
SELECT 
    CASE 
        WHEN Age BETWEEN 10 AND 20 THEN '10-20'
        WHEN Age BETWEEN 21 AND 30 THEN '21-30'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        WHEN Age BETWEEN 51 AND 60 THEN '51-60'
        ELSE '61 and above'
    END AS AgeGroup,
    AVG(1.0) AS AveragePurchases
FROM ['Customer Shopping trends$']
GROUP BY Age
ORDER BY AveragePurchases DESC;

--Total number of purchases by location. 
SELECT Location, COUNT(*) AS TotalPurchases
FROM ['Customer Shopping trends$']
GROUP BY Location
ORDER BY TotalPurchases DESC

-- Total purchase amount for each location and category
SELECT Location, Category, SUM([Purchase Amount (USD)]) AS TotalPurchaseAmount
FROM ['Customer Shopping trends$']
GROUP BY Location, Category
ORDER BY Location, TotalPurchaseAmount DESC;

--Average total purchase amount for each location and category
SELECT Location, Category, AVG([Purchase Amount (USD)]) AS AveragePurchaseAmount
FROM ['Customer Shopping trends$']
GROUP BY Location, Category
ORDER BY Location, AveragePurchaseAmount DESC;

--Total purchase amount by category
SELECT Category, SUM("Purchase Amount (USD)") AS TotalPurchaseAmount
FROM ['Customer Shopping trends$']
GROUP BY Category;

--Revenue rating by gender
SELECT Gender, AVG("Review Rating") AS AvgReviewRating
FROM ['Customer Shopping trends$']
GROUP BY Gender;

--Highest number of previous purchases
SELECT "Customer ID", "Previous Purchases"
FROM ['Customer Shopping trends$']
ORDER BY "Previous Purchases" DESC;

--
SELECT Season, MAX([Previous Purchases]) AS HighestPreviousPurchases
FROM ['Customer Shopping trends$']
GROUP BY Season
ORDER BY HighestPreviousPurchases DESC

--Average spending during each season.
SELECT Season, AVG([Purchase Amount (USD)]) AS AvgPurchase
FROM ['Customer Shopping trends$']
GROUP BY Season
ORDER BY AvgPurchase DESC;

--How often customers make purchases in different seasons.
SELECT Season, [Frequency of Purchases], COUNT(*) AS Count
FROM ['Customer Shopping trends$']
GROUP BY Season, [Frequency of Purchases]
ORDER BY Season, Count DESC;

-- Average review ratings by season 
SELECT Season, AVG([Review Rating]) AS AvgRating
FROM ['Customer Shopping trends$']
GROUP BY Season
ORDER BY AvgRating DESC;


-- Total previous purchases for each season
SELECT Season, SUM([Previous Purchases]) AS TotalPreviousPurchases
FROM ['Customer Shopping trends$']
GROUP BY Season
ORDER BY Season;

--Total sales for each season
SELECT Season, SUM([Purchase Amount (USD)]) AS TotalSales
FROM ['Customer Shopping trends$']
GROUP BY Season
ORDER BY TotalSales DESC;

--Total count of the "Previous Purchases"
SELECT COUNT([Previous Purchases]) AS TotalPreviousPurchases
FROM ['Customer Shopping trends$'];

--Number of purchases by season
SELECT Season, COUNT(*) AS NumberOfPurchases
FROM ['Customer Shopping trends$']
GROUP BY Season;

--Average purchase amount for different shipping types
SELECT "Shipping Type", AVG("Purchase Amount (USD)") AS AvgPurchaseAmount
FROM ['Customer Shopping trends$']
GROUP BY "Shipping Type";

-- Most Purchased Colors
SELECT Color, COUNT(*) AS NumberOfPurchases
FROM ['Customer Shopping trends$']
GROUP BY Color
ORDER BY NumberOfPurchases DESC;

--Group by category and calculate average purchase amount
SELECT Category, AVG("Purchase Amount (USD)") AS AvgPurchaseAmount
FROM ['Customer Shopping trends$']
GROUP BY Category;

--Group by season and gender, and count the number of purchases for each combination
SELECT Season, Gender, COUNT(*) AS NumberOfPurchases
FROM ['Customer Shopping trends$']
GROUP BY Season, Gender;

--Gender that buy the most
SELECT Gender, COUNT(*) AS TotalPurchases
FROM ['Customer Shopping trends$']
GROUP BY Gender
ORDER BY TotalPurchases DESC;

--Filter groups with average review rating
SELECT Category, AVG("Review Rating") AS AvgReviewRating
FROM ['Customer Shopping trends$']
GROUP BY Category
HAVING AVG("Review Rating") < 4.5;

SELECT [Item Purchased], AVG("Review Rating") AS AvgReviewRating
FROM ['Customer Shopping trends$']
GROUP BY [Item Purchased]
HAVING AVG("Review Rating") < 4;

SELECT Season, AVG("Review Rating") AS AvgReviewRating
FROM ['Customer Shopping trends$']
GROUP BY Season
HAVING AVG("Review Rating") < 5;

--Count the number of purchases for customers
SELECT "Customer ID", COUNT(*) AS NumberOfPurchases
FROM ['Customer Shopping trends$']
GROUP BY "Customer ID"
HAVING COUNT(*) > 1;

--Calculate the average purchase amount for customers with annually subscribed frequency
SELECT "Frequency of Purchases", AVG("Purchase Amount (USD)") AS AvgPurchaseAmount
FROM ['Customer Shopping trends$']
WHERE "Subscription Status" = 'Yes' AND "Frequency of Purchases" = 'Annually'
GROUP BY "Frequency of Purchases";

--customers fall into each frequency category (eg, weekly, quarterly, monthly, fortnightly, etc)
SELECT [Frequency of Purchases], COUNT(*) AS NumberOfCustomers
FROM ['Customer Shopping trends$']
GROUP BY [Frequency of Purchases]
ORDER BY NumberOfCustomers DESC;

--Total purchase amount for each frequency category.
SELECT [Frequency of Purchases], SUM([Purchase Amount (USD)]) AS TotalPurchaseAmount
FROM ['Customer Shopping trends$']
GROUP BY [Frequency of Purchases]
ORDER BY TotalPurchaseAmount DESC;

-- The average purchase amount for each frequency category.
SELECT [Frequency of Purchases], AVG([Purchase Amount (USD)]) AS AveragePurchaseAmount
FROM ['Customer Shopping trends$']
GROUP BY [Frequency of Purchases]
ORDER BY AveragePurchaseAmount DESC;

-- Ratings review for each frequency category.
SELECT [Frequency of Purchases], AVG([Review Rating]) AS AverageReviewRating
FROM ['Customer Shopping trends$']
GROUP BY [Frequency of Purchases]
ORDER BY AverageReviewRating DESC;

-- How many purchases utilized promo codes versus those that didn't.
SELECT 
    [Promo Code Used],
    COUNT(*) AS NumberOfPurchases
FROM ['Customer Shopping trends$']
GROUP BY [Promo Code Used];

--Total sales amounts for transactions with and without promo codes.
SELECT 
    [Promo Code Used],
    SUM([Purchase Amount (USD)]) AS TotalSales
FROM ['Customer Shopping trends$']
GROUP BY [Promo Code Used];

-- Average spending when promo codes are used.
SELECT 
    [Promo Code Used],
    AVG([Purchase Amount (USD)]) AS AvgPurchaseAmount
FROM ['Customer Shopping trends$']
WHERE [Promo Code Used] = 'Yes'
GROUP BY [Promo Code Used];

--Review ratings for purchases made with and without promo codes
SELECT 
    [Promo Code Used],
    AVG([Review Rating]) AS AvgRating
FROM ['Customer Shopping trends$']
GROUP BY [Promo Code Used];

--How promo code usage varies with payment methods:
SELECT 
    [Payment Method],
    COUNT(DISTINCT [Promo Code Used]) AS NumberOfPromoUses
FROM ['Customer Shopping trends$']
WHERE [Promo Code Used] = 'Yes'
GROUP BY [Payment Method]
ORDER BY NumberOfPromoUses DESC;











