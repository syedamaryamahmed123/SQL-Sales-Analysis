-- =====================================================
-- SQL BUSINESS CASE - DAY 2
-- Data Analyst Practical Scenario
-- =====================================================

-- Business Scenario:
-- You are hired as a Data Analyst in an e-commerce company.
-- Management wants insights about revenue, customers, and sales trends.


USE salesdata;

-- =====================================================
-- 1️⃣ Top 5 Revenue Generating Products
-- =====================================================

SELECT p.`Product Name`,
       SUM(od.Sales) AS Total_Revenue
FROM Products p
INNER JOIN Order_Details od
    ON p.`Product ID` = od.`Product ID`
GROUP BY p.`Product Name`
ORDER BY Total_Revenue DESC
LIMIT 5;

-- Explanation:
-- We join Products with Order_Details and calculate total revenue per product.

-- Business Insight:
-- Top-performing products should be prioritized in marketing campaigns,
-- inventory planning, and promotional strategies.



-- =====================================================
-- 2️⃣ High-Value Customers (Spending > 1000)
-- =====================================================

SELECT c.`Customer Name`,
       SUM(od.Sales) AS Total_Spent
FROM Customers c
INNER JOIN Orders o
    ON c.`Customer ID` = o.`Customer ID`
INNER JOIN Order_Details od
    ON o.`Order ID` = od.`Order ID`
GROUP BY c.`Customer Name`
HAVING SUM(od.Sales) > 1000
ORDER BY Total_Spent DESC;

-- Explanation:
-- We calculate total spending per customer and filter customers
-- who spent more than 1000 using HAVING clause.

-- Business Insight:
-- High-value customers should be targeted for loyalty programs,
-- premium offers, and retention strategies.



-- =====================================================
-- 3️⃣ Monthly Sales Trend
-- =====================================================

SELECT DATE_FORMAT(o.`Order Date`, '%Y-%m') AS Month,
       SUM(od.Sales) AS Monthly_Revenue
FROM Orders o
INNER JOIN Order_Details od
    ON o.`Order ID` = od.`Order ID`
GROUP BY DATE_FORMAT(o.`Order Date`, '%Y-%m')
ORDER BY Month;

-- Explanation:
-- Sales are grouped by month to analyze time-based trends.

-- Business Insight:
-- Identifies seasonal trends and peak sales months,
-- useful for forecasting and budgeting.



-- =====================================================
-- 4️⃣ Customers With No Purchases
-- =====================================================

SELECT c.`Customer Name`
FROM Customers c
LEFT JOIN Orders o
    ON c.`Customer ID` = o.`Customer ID`
WHERE o.`Order ID` IS NULL;

-- Explanation:
-- LEFT JOIN ensures all customers appear.
-- Customers without orders will have NULL values.

-- Business Insight:
-- These customers can be re-targeted with promotional campaigns.



-- =====================================================
-- 5️⃣ Average Order Value (AOV)
-- =====================================================

SELECT 
    SUM(od.Sales) / COUNT(DISTINCT o.`Order ID`) AS Average_Order_Value
FROM Orders o
INNER JOIN Order_Details od
    ON o.`Order ID` = od.`Order ID`;

-- Explanation:
-- Total revenue divided by total number of unique orders.

-- Business Insight:
-- AOV helps evaluate pricing strategy and upselling performance.

-- =====================================================
-- END OF BUSINESS CASE
-- =====================================================
