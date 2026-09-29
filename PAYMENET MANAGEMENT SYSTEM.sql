CREATE TABLE PURPLE_PAYMENT (
    Payment_ID NUMBER PRIMARY KEY,
    Order_ID NUMBER,
    Payment_Method VARCHAR2(30),
    Payment_Status VARCHAR2(20),
    Payment_Date DATE,
    Amount NUMBER(10,2),
    FOREIGN KEY (Order_ID)
    REFERENCES PURPLE_ORDERS(Order_ID)
);

Table created.


INSERT INTO PURPLE_PAYMENT
VALUES (1, 101, 'UPI', 'Successful', '20-SEP-2026', 5000);

1 row created.

INSERT INTO PURPLE_PAYMENT
VALUES (2, 102, 'Credit Card', 'Successful', '21-SEP-2026', 1800);

1 row created.

INSERT INTO PURPLE_PAYMENT
VALUES (3, 103, 'Debit Card', 'Failed', '22-SEP-2026', 3200);

1 row created.

INSERT INTO PURPLE_PAYMENT
VALUES (4, 104, 'Cash', 'Successful', '23-SEP-2026', 1500);

1 row created.

INSERT INTO PURPLE_PAYMENT
VALUES (5, 105, 'UPI', 'Failed', '23-SEP-2026', 4500);

1 row created.

INSERT INTO PURPLE_PAYMENT
VALUES (6, 106, 'Net Banking', 'Successful', '24-SEP-2026', 2750);

1 row created.


COMMIT;

Commit complete.


SELECT * FROM PURPLE_PAYMENT;

PAYMENT_ID  ORDER_ID  PAYMENT_METHOD  PAYMENT_STATUS  PAYMENT_DATE  AMOUNT
----------  --------  --------------  --------------  ------------  ------
1           101       UPI             Successful      20-SEP-26     5000
2           102       Credit Card     Successful      21-SEP-26     1800
3           103       Debit Card      Failed          22-SEP-26     3200
4           104       Cash            Successful      23-SEP-26     1500
5           105       UPI             Failed          23-SEP-26     4500
6           106       Net Banking     Successful      24-SEP-26     2750


SELECT *
FROM PURPLE_PAYMENT
WHERE Payment_Status = 'Successful';

PAYMENT_ID  ORDER_ID  PAYMENT_METHOD  PAYMENT_STATUS  PAYMENT_DATE  AMOUNT
----------  --------  --------------  --------------  ------------  ------
1           101       UPI             Successful      20-SEP-26     5000
2           102       Credit Card     Successful      21-SEP-26     1800
4           104       Cash            Successful      23-SEP-26     1500
6           106       Net Banking     Successful      24-SEP-26     2750


SELECT *
FROM PURPLE_PAYMENT
WHERE Payment_Status = 'Failed';

PAYMENT_ID  ORDER_ID  PAYMENT_METHOD  PAYMENT_STATUS  PAYMENT_DATE  AMOUNT
----------  --------  --------------  --------------  ------------  ------
3           103       Debit Card      Failed          22-SEP-26     3200
5           105       UPI             Failed          23-SEP-26     4500


UPDATE PURPLE_PAYMENT
SET Payment_Status = 'Successful'
WHERE Payment_ID = 5;

1 row updated.


COMMIT;

Commit complete.


SELECT
    Payment_Method,
    COUNT(*) AS Total_Transactions
FROM PURPLE_PAYMENT
GROUP BY Payment_Method
ORDER BY Payment_Method;

PAYMENT_METHOD  TOTAL_TRANSACTIONS
--------------  -----------------
Cash            1
Credit Card     1
Debit Card      1
Net Banking     1
UPI             2


SELECT
    Payment_Method,
    SUM(Amount) AS Total_Amount
FROM PURPLE_PAYMENT
GROUP BY Payment_Method
ORDER BY Payment_Method;

PAYMENT_METHOD  TOTAL_AMOUNT
--------------  ------------
Cash            1500
Credit Card     1800
Debit Card      3200
Net Banking     2750
UPI             9500


SELECT
    p.Payment_ID,
    p.Order_ID,
    o.Customer_ID,
    p.Payment_Method,
    p.Payment_Status,
    p.Payment_Date,
    p.Amount
FROM PURPLE_PAYMENT p
JOIN PURPLE_ORDERS o
ON p.Order_ID = o.Order_ID
ORDER BY p.Payment_ID;

PAYMENT_ID  ORDER_ID  CUSTOMER_ID  PAYMENT_METHOD  PAYMENT_STATUS  PAYMENT_DATE  AMOUNT
----------  --------  -----------  --------------  --------------  ------------  ------
1           101       1            UPI             Successful      20-SEP-26     5000
2           102       2            Credit Card     Successful      21-SEP-26     1800
3           103       3            Debit Card      Failed          22-SEP-26     3200
4           104       4            Cash            Successful      23-SEP-26     1500
5           105       5            UPI             Successful      23-SEP-26     4500
6           106       6            Net Banking     Successful      24-SEP-26     2750
