-- CATEGORY DATA
INSERT INTO PurpleCategory
SELECT 1, 'Skincare' FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM PurpleCategory WHERE Category_ID = 1
);

INSERT INTO PurpleCategory
SELECT 2, 'Makeup' FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM PurpleCategory WHERE Category_ID = 2
);

INSERT INTO PurpleCategory
SELECT 3, 'Haircare' FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM PurpleCategory WHERE Category_ID = 3
);

-- PRODUCT DATA
INSERT INTO PurpleProduct
SELECT 101, 'Face Wash', 'GlowCare', 299, 30, 1
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM PurpleProduct WHERE Product_ID = 101
);

INSERT INTO PurpleProduct
SELECT 102, 'Lipstick', 'ColorPop', 499, 20, 2
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM PurpleProduct WHERE Product_ID = 102
);

INSERT INTO PurpleProduct
SELECT 103, 'Sunscreen', 'SunSafe', 399, 15, 1
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM PurpleProduct WHERE Product_ID = 103
);

INSERT INTO PurpleProduct
SELECT 104, 'Shampoo', 'HairGlow', 249, 25, 3
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM PurpleProduct WHERE Product_ID = 104
);

INSERT INTO PurpleProduct
SELECT 105, 'Compact Powder', 'ColorPop', 599, 10, 2
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM PurpleProduct WHERE Product_ID = 105
);

-- CUSTOMER DATA
INSERT INTO PurpleCustomer
SELECT 201, 'Anu', 'anu@gmail.com', '9876543210'
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM PurpleCustomer WHERE Customer_ID = 201
);

INSERT INTO PurpleCustomer
SELECT 202, 'Priya', 'priya@gmail.com', '9876543211'
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM PurpleCustomer WHERE Customer_ID = 202
);

INSERT INTO PurpleCustomer
SELECT 203, 'Kavi', 'kavi@gmail.com', '9876543212'
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM PurpleCustomer WHERE Customer_ID = 203
);

INSERT INTO PurpleCustomer
SELECT 204, 'Nila', 'nila@gmail.com', '9876543213'
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM PurpleCustomer WHERE Customer_ID = 204
);

COMMIT;

-- ORDER DATA
INSERT INTO PurpleOrder
SELECT 301, 201, DATE '2026-10-01'
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM PurpleOrder WHERE Order_ID = 301
)
AND EXISTS (
    SELECT 1 FROM PurpleCustomer WHERE Customer_ID = 201
);

INSERT INTO PurpleOrder
SELECT 302, 202, DATE '2026-10-02'
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM PurpleOrder WHERE Order_ID = 302
)
AND EXISTS (
    SELECT 1 FROM PurpleCustomer WHERE Customer_ID = 202
);

INSERT INTO PurpleOrder
SELECT 303, 203, DATE '2026-10-03'
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM PurpleOrder WHERE Order_ID = 303
)
AND EXISTS (
    SELECT 1 FROM PurpleCustomer WHERE Customer_ID = 203
);

COMMIT;

-- ORDER ITEM DATA
INSERT INTO PurpleOrderItem
SELECT 401, 301, 101, 1, 299
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM PurpleOrderItem WHERE OrderItem_ID = 401
)
AND EXISTS (
    SELECT 1 FROM PurpleOrder WHERE Order_ID = 301
)
AND EXISTS (
    SELECT 1 FROM PurpleProduct WHERE Product_ID = 101
);

INSERT INTO PurpleOrderItem
SELECT 402, 301, 102, 1, 499
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM PurpleOrderItem WHERE OrderItem_ID = 402
)
AND EXISTS (
    SELECT 1 FROM PurpleOrder WHERE Order_ID = 301
)
AND EXISTS (
    SELECT 1 FROM PurpleProduct WHERE Product_ID = 102
);

INSERT INTO PurpleOrderItem
SELECT 403, 302, 103, 1, 399
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM PurpleOrderItem WHERE OrderItem_ID = 403
)
AND EXISTS (
    SELECT 1 FROM PurpleOrder WHERE Order_ID = 302
)
AND EXISTS (
    SELECT 1 FROM PurpleProduct WHERE Product_ID = 103
);

INSERT INTO PurpleOrderItem
SELECT 404, 303, 104, 1, 249
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM PurpleOrderItem WHERE OrderItem_ID = 404
)
AND EXISTS (
    SELECT 1 FROM PurpleOrder WHERE Order_ID = 303
)
AND EXISTS (
    SELECT 1 FROM PurpleProduct WHERE Product_ID = 104
);

INSERT INTO PurpleOrderItem
SELECT 405, 303, 102, 1, 499
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM PurpleOrderItem WHERE OrderItem_ID = 405
)
AND EXISTS (
    SELECT 1 FROM PurpleOrder WHERE Order_ID = 303
)
AND EXISTS (
    SELECT 1 FROM PurpleProduct WHERE Product_ID = 102
);

COMMIT;

SELECT * FROM PurpleProduct;
PRODUCT_ID  PRODUCT_NAME       BRAND     PRICE  STOCK  CATEGORY_ID
----------  -----------------  --------  -----  -----  -----------
101         Face Wash          GlowCare  299    30     1
102         Lipstick           ColorPop  499    20     2
103         Sunscreen          SunSafe   399    15     1
104         Shampoo            HairGlow  249    25     3
105         Compact Powder     ColorPop  599    10     2

SELECT Product_ID, Product_Name, Price
FROM PurpleProduct;
PRODUCT_ID  PRODUCT_NAME       PRICE
----------  -----------------  -----
101         Face Wash          299
102         Lipstick           499
103         Sunscreen          399
104         Shampoo            249
105         Compact Powder     599

SELECT Product_ID, Product_Name, Price
FROM PurpleProduct
ORDER BY Price ASC;
PRODUCT_ID  PRODUCT_NAME       PRICE
----------  -----------------  -----
104         Shampoo            249
101         Face Wash          299
103         Sunscreen          399
102         Lipstick           499
105         Compact Powder     599

CATEGORY_NAME
-------------
Skincare
Makeup
Haircare
SELECT Product_ID, Product_Name, Price
FROM PurpleProduct
WHERE Price > 300;
PRODUCT_ID  PRODUCT_NAME       PRICE
----------  -----------------  -----
102         Lipstick           499
103         Sunscreen          399
105         Compact Powder     599
SELECT Product_ID, Product_Name, Category_ID
FROM PurpleProduct
WHERE Category_ID = 2;
PRODUCT_ID  PRODUCT_NAME       CATEGORY_ID
----------  -----------------  -----------
102         Lipstick           2
105         Compact Powder     2
SELECT * FROM PurpleCustomer;
CUSTOMER_ID  CUSTOMER_NAME  EMAIL             PHONE
-----------  -------------  ----------------  ------------
201          Anu            anu@gmail.com     9876543210
202          Priya          priya@gmail.com   9876543211
203          Kavi            kavi@gmail.com    9876543212
204          Nila            nila@gmail.com    9876543213
SELECT Customer_ID, Customer_Name, Email, Phone
FROM PurpleCustomer
WHERE Customer_Name = 'Priya';
CUSTOMER_ID  CUSTOMER_NAME  EMAIL             PHONE
-----------  -------------  ----------------  ------------
202          Priya          priya@gmail.com   9876543211
SELECT Product_ID, Product_Name, Price, Stock
FROM PurpleProduct
WHERE Price > 300 AND Stock > 10;
PRODUCT_ID  PRODUCT_NAME  PRICE  STOCK
----------  ------------  -----  -----
102         Lipstick      499    20
103         Sunscreen     399    15
SELECT Product_ID, Product_Name, Price, Stock
FROM PurpleProduct
WHERE Price < 300 OR Stock > 20;
PRODUCT_ID  PRODUCT_NAME  PRICE  STOCK
----------  ------------  -----  -----
101         Face Wash     299    30
104         Shampoo       249    25
SELECT Product_ID, Product_Name, Price, Category_ID
FROM PurpleProduct
WHERE Category_ID IN (1, 2);
PRODUCT_ID  PRODUCT_NAME       PRICE  CATEGORY_ID
----------  -----------------  -----  -----------
101         Face Wash          299    1
102         Lipstick           499    2
103         Sunscreen          399    1
105         Compact Powder     599    2
SELECT Product_ID, Product_Name, Price
FROM PurpleProduct
WHERE Price BETWEEN 300 AND 500;
PRODUCT_ID  PRODUCT_NAME  PRICE
----------  ------------  -----
103         Sunscreen     399
102         Lipstick      499
SELECT Product_ID, Product_Name, Price
FROM PurpleProduct
ORDER BY Price ASC;
PRODUCT_ID  PRODUCT_NAME       PRICE
----------  -----------------  -----
104         Shampoo            249
101         Face Wash          299
103         Sunscreen          399
102         Lipstick           499
105         Compact Powder     599
SELECT C.Customer_ID, C.Customer_Name,
       O.Order_ID, O.Order_Date
FROM PurpleCustomer C
JOIN PurpleOrder O
ON C.Customer_ID = O.Customer_ID
ORDER BY O.Order_ID;
CUSTOMER_ID  CUSTOMER_NAME  ORDER_ID  ORDER_DATE
-----------  -------------  --------  -----------
201          Anu            301       01-OCT-26
202          Priya          302       02-OCT-26
203          Kavi            303       03-OCT-26
SELECT OI.Order_ID, P.Product_ID,
       P.Product_Name, OI.Quantity,
       OI.Unit_Price
FROM PurpleOrderItem OI
JOIN PurpleProduct P
ON OI.Product_ID = P.Product_ID
ORDER BY OI.Order_ID;
ORDER_ID  PRODUCT_ID  PRODUCT_NAME  QUANTITY  UNIT_PRICE
--------  ----------  ------------  --------  ----------
301       101         Face Wash     1         299
301       102         Lipstick      1         499
302       103         Sunscreen     1         399
303       104         Shampoo       1         249
303       102         Lipstick      1         499
SELECT C.Customer_ID, C.Customer_Name,
       COUNT(O.Order_ID) AS Total_Orders
FROM PurpleCustomer C
LEFT JOIN PurpleOrder O
ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name
ORDER BY C.Customer_ID;
CUSTOMER_ID  CUSTOMER_NAME  TOTAL_ORDERS
-----------  -------------  ------------
201          Anu            1
202          Priya          1
203          Kavi           1
204          Nila           0
SELECT C.Customer_ID, C.Customer_Name,
       NVL(SUM(OI.Quantity * OI.Unit_Price), 0)
       AS Total_Purchase_Amount
FROM PurpleCustomer C
LEFT JOIN PurpleOrder O
ON C.Customer_ID = O.Customer_ID
LEFT JOIN PurpleOrderItem OI
ON O.Order_ID = OI.Order_ID
GROUP BY C.Customer_ID, C.Customer_Name
ORDER BY C.Customer_ID;
CUSTOMER_ID  CUSTOMER_NAME  TOTAL_PURCHASE_AMOUNT
-----------  -------------  ---------------------
201          Anu            798
202          Priya          399
203          Kavi           748
204          Nila           0
