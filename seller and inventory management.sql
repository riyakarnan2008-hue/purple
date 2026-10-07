SQL> CREATE TABLE SELLER (
  2  SELLER_ID NUMBER PRIMARY KEY,
  3  SELLER_NAME VARCHAR2(50),
  4  PHONE VARCHAR2(15),
  5  EMAIL VARCHAR2(50),
  6  ADDRESS VARCHAR2(100)
  7  );

Table created.

SQL> CREATE TABLE INVENTORY (
  2  INVENTORY_ID NUMBER PRIMARY KEY,
  3  PRODUCT_ID NUMBER,
  4  PRODUCT_NAME VARCHAR2(50),
  5  QUANTITY NUMBER,
  6  PRICE NUMBER(10,2),
  7  SELLER_ID NUMBER,
  8  CONSTRAINT FK_INVENTORY_SELLER
  9  FOREIGN KEY (SELLER_ID)
 10  REFERENCES SELLER(SELLER_ID)
 11  );

Table created.

SQL> INSERT INTO SELLER
  2  VALUES (101,'RIYA','9876543210','riya@gmail.com','CHENNAI');

1 row created.

SQL> INSERT INTO SELLER
  2  VALUES (102,'ANU','9876543211','anu@gmail.com','COIMBATORE');

1 row created.

SQL> INSERT INTO SELLER
  2  VALUES (103,'PRIYA','9876543212','priya@gmail.com','MADURAI');

1 row created.

SQL> INSERT INTO SELLER
  2  VALUES (104,'DIVYA','9876543213','divya@gmail.com','SALEM');

1 row created.

SQL> INSERT INTO SELLER
  2  VALUES (105,'KAVIYA','9876543214','kaviya@gmail.com','TRICHY');

1 row created.

SQL> INSERT INTO SELLER
  2  VALUES (106,'NITHYA','9876543215','nithya@gmail.com','CHENNAI');

1 row created.

SQL> INSERT INTO INVENTORY
  2  VALUES (201,501,'LAPTOP',10,55000,101);

1 row created.

SQL> INSERT INTO INVENTORY
  2  VALUES (202,502,'MOBILE',20,25000,102);

1 row created.

SQL> INSERT INTO INVENTORY
  2  VALUES (203,503,'HEADPHONE',30,2000,103);

1 row created.

SQL> INSERT INTO INVENTORY
  2  VALUES (204,504,'SMART WATCH',15,5000,104);

1 row created.

SQL> INSERT INTO INVENTORY
  2  VALUES (205,505,'KEYBOARD',25,1500,105);

1 row created.

SQL> INSERT INTO INVENTORY
  2  VALUES (206,506,'MOUSE',40,800,106);

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM SELLER;

 SELLER_ID SELLER_NAME    PHONE          EMAIL
---------- -------------- -------------- --------------------
ADDRESS
--------------------------------------------------
       101 RIYA           9876543210     riya@gmail.com
CHENNAI

       102 ANU            9876543211     anu@gmail.com
COIMBATORE

       103 PRIYA          9876543212     priya@gmail.com
MADURAI

       104 DIVYA          9876543213     divya@gmail.com
SALEM

       105 KAVIYA         9876543214     kaviya@gmail.com
TRICHY

       106 NITHYA        9876543215     nithya@gmail.com
CHENNAI


6 rows selected.

SQL> SELECT * FROM INVENTORY;

INVENTORY_ID PRODUCT_ID PRODUCT_NAME       QUANTITY      PRICE  SELLER_ID
------------ ---------- -------------- ---------- ---------- ----------
         201        501 LAPTOP                   10      55000        101
         202        502 MOBILE                   20      25000        102
         203        503 HEADPHONE               30       2000        103
         204        504 SMART WATCH             15       5000        104
         205        505 KEYBOARD                 25       1500        105
         206        506 MOUSE                    40        800        106

6 rows selected.

SQL> SELECT SELLER_ID,SELLER_NAME
  2  FROM SELLER;

 SELLER_ID SELLER_NAME
---------- --------------
       101 RIYA
       102 ANU
       103 PRIYA
       104 DIVYA
       105 KAVIYA
       106 NITHYA

6 rows selected.

SQL> SELECT PRODUCT_NAME,QUANTITY
  2  FROM INVENTORY
  3  WHERE QUANTITY > 20;

PRODUCT_NAME       QUANTITY
-------------- ----------
HEADPHONE                30
KEYBOARD                 25
MOUSE                    40

3 rows selected.

SQL> SELECT PRODUCT_NAME,PRICE
  2  FROM INVENTORY
  3  WHERE PRICE > 5000;

PRODUCT_NAME          PRICE
-------------- ----------
LAPTOP                55000
MOBILE                25000

2 rows selected.

SQL> SELECT S.SELLER_NAME,I.PRODUCT_NAME,
  2  I.QUANTITY,I.PRICE
  3  FROM SELLER S
  4  JOIN INVENTORY I
  5  ON S.SELLER_ID=I.SELLER_ID;

SELLER_NAME    PRODUCT_NAME       QUANTITY      PRICE
-------------- -------------- ---------- ----------
RIYA           LAPTOP                   10      55000
ANU            MOBILE                   20      25000
PRIYA          HEADPHONE                30       2000
DIVYA          SMART WATCH              15       5000
KAVIYA         KEYBOARD                 25       1500
NITHYA         MOUSE                    40        800

6 rows selected.

SQL> SELECT COUNT(*) AS TOTAL_SELLERS
  2  FROM SELLER;

TOTAL_SELLERS
-------------
            6

SQL> SELECT SUM(QUANTITY) AS TOTAL_STOCK
  2  FROM INVENTORY;

TOTAL_STOCK
-----------
        140

SQL> SELECT AVG(PRICE) AS AVERAGE_PRICE
  2  FROM INVENTORY;

AVERAGE_PRICE
-------------
     15550

SQL> SELECT MAX(PRICE) AS MAXIMUM_PRICE,
  2  MIN(PRICE) AS MINIMUM_PRICE
  3  FROM INVENTORY;

MAXIMUM_PRICE MINIMUM_PRICE
------------- -------------
        55000           800

SQL> SELECT S.SELLER_NAME,
  2  I.PRODUCT_NAME
  3  FROM SELLER S, INVENTORY I
  4  WHERE S.SELLER_ID=I.SELLER_ID
  5  AND I.QUANTITY < 20;

SELLER_NAME    PRODUCT_NAME
-------------- --------------
RIYA           LAPTOP
DIVYA          SMART WATCH

2 rows selected.