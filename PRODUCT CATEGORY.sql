CREATE TABLE PURPLE_CATEGORY (
    Category_ID NUMBER PRIMARY KEY,
    Category_Name VARCHAR2(50) UNIQUE
);

Table created.


CREATE TABLE PURPLE_PRODUCT (
    Product_ID NUMBER PRIMARY KEY,
    Product_Name VARCHAR2(100),
    Brand VARCHAR2(50),
    Price NUMBER(10,2),
    Stock NUMBER,
    Category_ID NUMBER,
    FOREIGN KEY (Category_ID)
    REFERENCES PURPLE_CATEGORY(Category_ID)
);

Table created.


INSERT INTO PURPLE_CATEGORY
VALUES (1, 'Skincare');

1 row created.

INSERT INTO PURPLE_CATEGORY
VALUES (2, 'Makeup');

1 row created.

INSERT INTO PURPLE_CATEGORY
VALUES (3, 'Haircare');

1 row created.

INSERT INTO PURPLE_CATEGORY
VALUES (4, 'Fragrance');

1 row created.

COMMIT;

Commit complete.


SELECT * FROM PURPLE_CATEGORY;

CATEGORY_ID  CATEGORY_NAME
-----------  ------------------
1            Skincare
2            Makeup
3            Haircare
4            Fragrance


INSERT INTO PURPLE_PRODUCT
VALUES (101, 'Face Serum', 'Purple', 1999, 25, 1);

1 row created.

INSERT INTO PURPLE_PRODUCT
VALUES (102, 'Lipstick', 'Purple', 899, 40, 2);

1 row created.

INSERT INTO PURPLE_PRODUCT
VALUES (103, 'Hair Serum', 'Purple', 1299, 30, 3);

1 row created.

INSERT INTO PURPLE_PRODUCT
VALUES (104, 'Perfume', 'Purple', 2499, 20, 4);

1 row created.

INSERT INTO PURPLE_PRODUCT
VALUES (105, 'Face Cream', 'Purple', 1499, 35, 1);

1 row created.

INSERT INTO PURPLE_PRODUCT
VALUES (106, 'Foundation', 'Purple', 1199, 15, 2);

1 row created.

COMMIT;

Commit complete.


SELECT * FROM PURPLE_PRODUCT;

PRODUCT_ID  PRODUCT_NAME   BRAND    PRICE  STOCK  CATEGORY_ID
----------  -------------  -------  -----  -----  -----------
101         Face Serum     Purple   1999   25     1
102         Lipstick       Purple   899    40     2
103         Hair Serum     Purple   1299   30     3
104         Perfume        Purple   2499   20     4
105         Face Cream     Purple   1499   35     1
106         Foundation     Purple   1199   15     2

SELECT
    p.Product_ID,
    p.Product_Name,
    p.Brand,
    p.Price,
    p.Stock,
    c.Category_Name
FROM PURPLE_PRODUCT p
JOIN PURPLE_CATEGORY c
ON p.Category_ID = c.Category_ID
ORDER BY p.Product_ID;

PRODUCT_ID  PRODUCT_NAME   BRAND    PRICE  STOCK  CATEGORY_NAME
----------  -------------  -------  -----  -----  -------------
101         Face Serum     Purple   1999   25     Skincare
102         Lipstick       Purple   899    40     Makeup
103         Hair Serum     Purple   1299   30     Haircare
104         Perfume        Purple   2499   20     Fragrance
105         Face Cream     Purple   1499   35     Skincare
106         Foundation     Purple   1199   15     Makeup
