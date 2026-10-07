
CREATE TABLE PurpleCategory (
    Category_ID NUMBER PRIMARY KEY,
    Category_Name VARCHAR2(100) NOT NULL
);

INSERT INTO PurpleCategory VALUES (1, 'Lipstick');
INSERT INTO PurpleCategory VALUES (2, 'Foundation');
INSERT INTO PurpleCategory VALUES (3, 'Eyeliner');
INSERT INTO PurpleCategory VALUES (4, 'Blush');
INSERT INTO PurpleCategory VALUES (5, 'Mascara');

COMMIT;


CREATE TABLE PurpleProduct (
    Product_ID NUMBER PRIMARY KEY,
    Product_Name VARCHAR2(100) NOT NULL,
    Brand VARCHAR2(50) NOT NULL,
    Price NUMBER(10,2) NOT NULL,
    Stock NUMBER NOT NULL,
    Category_ID NUMBER,
    FOREIGN KEY (Category_ID)
        REFERENCES PurpleCategory(Category_ID)
);

INSERT INTO PurpleProduct
VALUES (1, 'Matte Lipstick', 'Purple', 499, 50, 1);

INSERT INTO PurpleProduct
VALUES (2, 'Liquid Foundation', 'Purple', 799, 40, 2);

INSERT INTO PurpleProduct
VALUES (3, 'Waterproof Eyeliner', 'Purple', 349, 60, 3);

INSERT INTO PurpleProduct
VALUES (4, 'Glow Blush', 'Purple', 599, 35, 4);

INSERT INTO PurpleProduct
VALUES (5, 'Volume Mascara', 'Purple', 449, 45, 5);

COMMIT;


CREATE TABLE PurpleCustomer (
    Customer_ID NUMBER PRIMARY KEY,
    Customer_Name VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100),
    Phone VARCHAR2(15)
);

INSERT INTO PurpleCustomer VALUES
(1, 'Arun', 'arun@gmail.com', '9876543210');

INSERT INTO PurpleCustomer VALUES
(2, 'Kavin', 'kavin@gmail.com', '9876543211');

INSERT INTO PurpleCustomer VALUES
(3, 'Priya', 'priya@gmail.com', '9876543212');

INSERT INTO PurpleCustomer VALUES
(4, 'Anu', 'anu@gmail.com', '9876543213');

INSERT INTO PurpleCustomer VALUES
(5, 'Riya', 'riya@gmail.com', '9876543214');

COMMIT;


CREATE TABLE PurpleReview (
    Review_ID NUMBER PRIMARY KEY,
    Customer_ID NUMBER,
    Product_ID NUMBER,
    Review_Text VARCHAR2(500),
    Review_Date DATE,
    FOREIGN KEY (Customer_ID)
        REFERENCES PurpleCustomer(Customer_ID),
    FOREIGN KEY (Product_ID)
        REFERENCES PurpleProduct(Product_ID)
);

INSERT INTO PurpleReview VALUES
(1, 1, 1, 'Good product and nice quality', SYSDATE);

INSERT INTO PurpleReview VALUES
(2, 2, 2, 'Very useful and worth the price', SYSDATE);

INSERT INTO PurpleReview VALUES
(3, 3, 3, 'Quality is excellent', SYSDATE);

INSERT INTO PurpleReview VALUES
(4, 4, 4, 'Average product', SYSDATE);

INSERT INTO PurpleReview VALUES
(5, 5, 5, 'Really satisfied with the product', SYSDATE);

COMMIT;

SELECT * FROM PurpleReview;

REVIEW_ID  CUSTOMER_ID  PRODUCT_ID  REVIEW_TEXT                         REVIEW_DATE
1          1            1           Good product and nice quality       07-OCT-26
2          2            2           Very useful and worth the price     07-OCT-26
3          3            3           Quality is excellent                07-OCT-26
4          4            4           Average product                     07-OCT-26
5          5            5           Really satisfied with the product   07-OCT-26
