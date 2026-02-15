CREATE DATABASE IF NOT EXISTS salesData;
USE salesData;
select * from supperstore;

-- 1️⃣ Total Revenue
select sum(sales) as total_revenue
FROM supperstore;

-- 2️⃣ Total Number of Orders
select count(distinct `Order ID`) AS total_orders
FROM supperstore;

-- 3️⃣ Revenue by Region
select Region, sum(Sales) as revenue
from supperstore
group by Region
order by revenue desc;

-- 4️⃣ Revenue by Category
SELECT Category, SUM(Sales) AS revenue
FROM supperstore
GROUP BY Category
ORDER BY revenue DESC;

-- 5️⃣ Top 5 Products by Sales
select `Product Name`, sum(Sales) as total_sales
from supperstore
group by `Product Name`
order by total_sales desc
limit 5;

-- 6️⃣ Average Order Value
select sum(Sales)/count(distinct `Order ID`) AS avg_order_value
from supperstore;

-- 7️⃣ Average Sales per Customer
select AVG(customer_total) 
from(
select `Customer ID`, sum(Sales) AS customer_total
FROM supperstore
    GROUP BY `Customer ID`
) AS sub;

-- 8️⃣ Customers With More Than 5 Ordersw
select `Customer ID`, count(distinct `Order ID`) as order_count
from supperstore 
GROUP BY `Customer ID`
HAVING order_count > 5;

-- 9️⃣ Revenue by State
select State, sum(sales) as state_revenue
from supperstore
group by State
order by state_revenue;

-- 🔟 Monthly Revenue
SELECT date_format(STR_TO_DATE(`Order ID`, '%m%d%y'), '%y%m') as month, sum(Sales) as revenue
FROM supperstore
GROUP BY month
ORDER BY STR_TO_DATE(month, '%y%m');

-- 1️⃣1️⃣ Total Sales by Segment
select Segment, sum(Sales) as revenue
from supperstore
group by Segment
ORDER BY revenue DESC;

-- 1️⃣2️⃣ Most Profitable Region (by Sales proxy)
SELECT Region, SUM(Sales) AS total_sales
FROM supperstore
GROUP BY Region
ORDER BY total_sales DESC
LIMIT 1;

-- 1️⃣3️⃣ Orders Shipped by Mode
SELECT `Ship Mode`, COUNT(DISTINCT `Order ID`) AS total_orders
FROM supperstore
GROUP BY `Ship Mode`
ORDER BY total_orders DESC;

-- 1️⃣4️⃣ Cities Generating More Than 50,000 Revenue
select City, sum(Sales) as rev
from supperstore
group by City
having rev > 50000
ORDER BY rev DESC;

-- 1️⃣5️⃣ Top 5 Customers by Revenue
SELECT `Customer Name`, SUM(Sales) AS revenue
FROM supperstore
GROUP BY `Customer Name`
ORDER BY revenue DESC
LIMIT 5;
