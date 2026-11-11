SET SERVEROUTPUT ON;
SET LINESIZE 150;
SET PAGESIZE 50;

-- 1. SUBQUERIES AND NESTED QUERIES

SELECT Order_ID,
       SUM(Quantity * Unit_Price) AS Total_Amount
FROM PurpleOrderItem
GROUP BY Order_ID
HAVING SUM(Quantity * Unit_Price) >
(
    SELECT AVG(Total_Amount)
    FROM
    (
        SELECT SUM(Quantity * Unit_Price) AS Total_Amount
        FROM PurpleOrderItem
        GROUP BY Order_ID
    )
);

-- OUTPUT:
-- ORDER_ID   TOTAL_AMOUNT
-- --------   ------------
-- 1          6098


-- 2. PRODUCTS ABOVE AVERAGE PRICE

SELECT Product_ID, Product_Name, Price
FROM PurpleProduct
WHERE Price >
(
    SELECT AVG(Price)
    FROM PurpleProduct
);

-- OUTPUT:
-- PRODUCT_ID  PRODUCT_NAME       PRICE
-- ----------  -----------------  -----
-- 2           Liquid Foundation  799
-- 4           Glow Blush          599


-- 2.1 PRODUCTS BELOW AVERAGE PRICE

SELECT Product_ID, Product_Name, Price
FROM PurpleProduct
WHERE Price <
(
    SELECT AVG(Price)
    FROM PurpleProduct
);

-- OUTPUT:
-- PRODUCT_ID  PRODUCT_NAME       PRICE
-- ----------  -----------------  -----
-- 1           Matte Lipstick      499
-- 3           Waterproof Eyeliner 349
-- 5           Volume Mascara      449


-- 3. CUSTOMER-WISE PURCHASE

SELECT O.Customer_ID,
       SUM(I.Quantity * I.Unit_Price) AS Total_Purchase
FROM PurpleOrder O
JOIN PurpleOrderItem I
ON O.Order_ID = I.Order_ID
GROUP BY O.Customer_ID
ORDER BY O.Customer_ID;

-- OUTPUT:
-- CUSTOMER_ID  TOTAL_PURCHASE
-- -----------  --------------
-- 1            6098
-- 2            3000
-- 3            2400
-- 4            1800


-- 3.1 MAXIMUM CUSTOMER PURCHASE

SELECT MAX(Total_Purchase) AS Maximum_Purchase
FROM
(
    SELECT SUM(I.Quantity * I.Unit_Price) AS Total_Purchase
    FROM PurpleOrder O
    JOIN PurpleOrderItem I
    ON O.Order_ID = I.Order_ID
    GROUP BY O.Customer_ID
);

-- OUTPUT:
-- MAXIMUM_PURCHASE
-- ----------------
-- 6098


-- 3.2 CUSTOMER DETAILS WITH MAXIMUM PURCHASE

SELECT C.Customer_ID,
       C.Customer_Name,
       SUM(I.Quantity * I.Unit_Price) AS Total_Purchase
FROM PurpleCustomer C
JOIN PurpleOrder O
ON C.Customer_ID = O.Customer_ID
JOIN PurpleOrderItem I
ON O.Order_ID = I.Order_ID
GROUP BY C.Customer_ID, C.Customer_Name
HAVING SUM(I.Quantity * I.Unit_Price) =
(
    SELECT MAX(Total_Purchase)
    FROM
    (
        SELECT SUM(I.Quantity * I.Unit_Price) AS Total_Purchase
        FROM PurpleOrder O
        JOIN PurpleOrderItem I
        ON O.Order_ID = I.Order_ID
        GROUP BY O.Customer_ID
    )
);

-- OUTPUT:
-- CUSTOMER_ID  CUSTOMER_NAME  TOTAL_PURCHASE
-- -----------  -------------  --------------
-- 1            Arun           6098


-- 4. CUSTOMERS WITH ABOVE AVERAGE ORDER VALUE

SELECT C.Customer_ID,
       C.Customer_Name,
       O.Order_ID,
       SUM(I.Quantity * I.Unit_Price) AS Order_Amount
FROM PurpleCustomer C
JOIN PurpleOrder O
ON C.Customer_ID = O.Customer_ID
JOIN PurpleOrderItem I
ON O.Order_ID = I.Order_ID
GROUP BY C.Customer_ID, C.Customer_Name, O.Order_ID
HAVING SUM(I.Quantity * I.Unit_Price) >
(
    SELECT AVG(Total_Amount)
    FROM
    (
        SELECT SUM(Quantity * Unit_Price) AS Total_Amount
        FROM PurpleOrderItem
        GROUP BY Order_ID
    )
);

-- OUTPUT:
-- CUSTOMER_ID  CUSTOMER_NAME  ORDER_ID  ORDER_AMOUNT
-- -----------  -------------  --------  ------------
-- 1            Arun           1         6098


-- 5. PRODUCTS WHOSE SALES ARE ABOVE AVERAGE

SELECT P.Product_ID,
       P.Product_Name,
       SUM(I.Quantity * I.Unit_Price) AS Total_Sales
FROM PurpleProduct P
JOIN PurpleOrderItem I
ON P.Product_ID = I.Product_ID
GROUP BY P.Product_ID, P.Product_Name
HAVING SUM(I.Quantity * I.Unit_Price) >
(
    SELECT AVG(Total_Sales)
    FROM
    (
        SELECT SUM(Quantity * Unit_Price) AS Total_Sales
        FROM PurpleOrderItem
        GROUP BY Product_ID
    )
)
ORDER BY Total_Sales DESC;

-- OUTPUT:
-- PRODUCT_ID  PRODUCT_NAME       TOTAL_SALES
-- ----------  -----------------  -----------
-- 1           Matte Lipstick      4598
-- 3           Waterproof Eyeliner 3000


-- 6. CUSTOMER PURCHASE REPORT

SELECT C.Customer_ID,
       C.Customer_Name,
       COUNT(DISTINCT O.Order_ID) AS Total_Orders,
       NVL(SUM(I.Quantity * I.Unit_Price),0) AS Total_Purchase,
       NVL(SUM(I.Quantity * I.Unit_Price),0) /
       NULLIF(COUNT(DISTINCT O.Order_ID),0) AS Average_Order_Value
FROM PurpleCustomer C
LEFT JOIN PurpleOrder O
ON C.Customer_ID = O.Customer_ID
LEFT JOIN PurpleOrderItem I
ON O.Order_ID = I.Order_ID
GROUP BY C.Customer_ID, C.Customer_Name
ORDER BY C.Customer_ID;

-- OUTPUT:
-- CUSTOMER_ID CUSTOMER_NAME TOTAL_ORDERS TOTAL_PURCHASE AVERAGE_ORDER_VALUE
-- ----------- ------------- ------------ -------------- -------------------
-- 1           Arun          1            6098           6098
-- 2           Kavin         1            3000           3000
-- 3           Priya         1            2400           2400
-- 4           Anu           1            1800           1800
-- 5           Riya          1            0              0


-- 7. ADVANCED PRODUCT SALES REPORT

SELECT P.Product_ID,
       P.Product_Name,
       COUNT(DISTINCT I.Order_ID) AS Total_Orders,
       SUM(I.Quantity) AS Total_Quantity,
       SUM(I.Quantity * I.Unit_Price) AS Total_Sales,
       AVG(I.Unit_Price) AS Average_Price
FROM PurpleProduct P
JOIN PurpleOrderItem I
ON P.Product_ID = I.Product_ID
GROUP BY P.Product_ID, P.Product_Name
ORDER BY Total_Sales DESC;

-- OUTPUT:
-- PRODUCT_ID PRODUCT_NAME       TOTAL_ORDERS TOTAL_QUANTITY TOTAL_SALES AVERAGE_PRICE
-- ---------- ----------------- ------------ -------------- ----------- -------------
-- 1          Matte Lipstick     1            2              4598        2299
-- 3          Waterproof Eyeliner 1           3              3000        1000
-- 4          Glow Blush         1            2              2400        1200
-- 5          Volume Mascara     1            1              1800        1800
-- 2          Liquid Foundation  1            1              1500        1500


-- 8. CATEGORY-WISE ADVANCED SALES REPORT

SELECT C.Category_ID,
       SUM(I.Quantity) AS Total_Quantity,
       SUM(I.Quantity * I.Unit_Price) AS Total_Sales
FROM PurpleCategory C
JOIN PurpleProduct P
ON C.Category_ID = P.Category_ID
JOIN PurpleOrderItem I
ON P.Product_ID = I.Product_ID
GROUP BY C.Category_ID
ORDER BY C.Category_ID;

-- OUTPUT:
-- CATEGORY_ID  TOTAL_QUANTITY  TOTAL_SALES
-- -----------  --------------  -----------
-- 1            2               4598
-- 2            1               1500
-- 3            3               3000
-- 4            2               2400
-- 5            1               1800
