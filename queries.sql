CREATE TABLE orders_data (
    Row_ID INT,
    Order_ID VARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code INT,
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales FLOAT,
    Quantity INT,
    Discount FLOAT,
    Profit FLOAT
);

SELECT
    ROUND(SUM(CAST(Sales AS FLOAT)),2) AS Total_Sales
FROM orders_data;

SELECT
    ROUND(SUM(CAST(Profit AS FLOAT)),2) AS Total_Profit
FROM orders_data;

SELECT
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM orders_data;

SELECT
    ROUND(
    (SUM(CAST(Profit AS FLOAT)) /
    SUM(CAST(Sales AS FLOAT))) * 100,2
    ) AS Profit_Margin_Percentage
FROM orders_data;

SELECT
    Region,
    ROUND(SUM(CAST(Sales AS FLOAT)),2) AS Revenue
FROM orders_data
GROUP BY Region
ORDER BY Revenue DESC;

SELECT TOP 10
    Product_Name,
    ROUND(SUM(CAST(Sales AS FLOAT)),2) AS Revenue
FROM orders_data
GROUP BY Product_Name
ORDER BY Revenue DESC;

SELECT
    MONTH(CAST(Order_Date AS DATE)) AS Month_Number,
    ROUND(SUM(CAST(Sales AS FLOAT)),2) AS Monthly_Sales
FROM orders_data
GROUP BY MONTH(CAST(Order_Date AS DATE))
ORDER BY Month_Number;

SELECT
    Category,
    ROUND(SUM(CAST(Profit AS FLOAT)),2) AS Total_Profit
FROM orders_data
GROUP BY Category
ORDER BY Total_Profit DESC;

SELECT
    Segment,
    COUNT(Order_ID) AS Total_Orders
FROM orders_data
GROUP BY Segment
ORDER BY Total_Orders DESC;