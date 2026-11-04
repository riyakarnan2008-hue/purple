-- 1. COUNT() - Total Orders
SELECT COUNT(*) AS Total_Orders
FROM PurpleOrder;

-- OUTPUT
TOTAL_ORDERS
------------
           5


-- 2. SUM() - Total Sales
SELECT SUM(Quantity * Unit_Price) AS Total_Sales
FROM PurpleOrderItem;

-- OUTPUT
TOTAL_SALES
-----------
      13298


-- 3. AVG() - Average Sales
SELECT AVG(Quantity * Unit_Price) AS Average_Sales
FROM PurpleOrderItem;

-- OUTPUT
AVERAGE_SALES
-------------
       2659.6


-- 4. MIN() - Minimum Product Price
SELECT MIN(Price) AS Minimum_Price
FROM PurpleProduct;

-- OUTPUT
MINIMUM_PRICE
-------------
          349


-- 5. MAX() - Maximum Product Price
SELECT MAX(Price) AS Maximum_Price
FROM PurpleProduct;

-- OUTPUT
MAXIMUM_PRICE
-------------
          799


-- 6. Generate Total Sales Reports
SELECT SUM(Quantity * Unit_Price) AS Total_Sales
FROM PurpleOrderItem;

-- OUTPUT
TOTAL_SALES
-----------
      13298


-- 7. Find Top Customers Based on Purchase Amount
SELECT C.Customer_ID,
       C.Customer_Name,
       SUM(OI.Quantity * OI.Unit_Price) AS Total_Purchase
FROM PurpleCustomer C
JOIN PurpleOrder O
ON C.Customer_ID = O.Customer_ID
JOIN PurpleOrderItem OI
ON O.Order_ID = OI.Order_ID
GROUP BY C.Customer_ID, C.Customer_Name
ORDER BY Total_Purchase DESC;

-- OUTPUT
CUSTOMER_ID  CUSTOMER_NAME  TOTAL_PURCHASE
-----------  -------------  --------------
1            Arun           6098
2            Kavin          3000
3            Priya          2400
4            Anu            1800


-- 8. Identify Best-Selling Products
SELECT P.Product_ID,
       P.Product_Name,
       SUM(OI.Quantity) AS Total_Quantity_Sold
FROM PurpleProduct P
JOIN PurpleOrderItem OI
ON P.Product_ID = OI.Product_ID
GROUP BY P.Product_ID, P.Product_Name
ORDER BY Total_Quantity_Sold DESC;

-- OUTPUT
PRODUCT_ID  PRODUCT_NAME          TOTAL_QUANTITY_SOLD
----------  --------------------  -------------------
3           Waterproof Eyeliner   3
1           Matte Lipstick        2
4           Glow Blush             2
2           Liquid Foundation     1
5           Volume Mascara         1


-- 9. Perform Category-wise Sales Analysis
SELECT C.Category_ID,
       C.Category_Name,
       SUM(OI.Quantity * OI.Unit_Price) AS Category_Sales
FROM PurpleCategory C
JOIN PurpleProduct P
ON C.Category_ID = P.Category_ID
JOIN PurpleOrderItem OI
ON P.Product_ID = OI.Product_ID
GROUP BY C.Category_ID, C.Category_Name
ORDER BY Category_Sales DESC;

-- OUTPUT
CATEGORY_ID  CATEGORY_NAME  CATEGORY_SALES
-----------  -------------  --------------
1            Lipstick       4598
3            Eyeliner       3000
4            Blush          2400
5            Mascara        1800
2            Foundation     1500
