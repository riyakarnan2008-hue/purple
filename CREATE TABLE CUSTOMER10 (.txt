CREATE TABLE CUSTOMER10 (
    Customer_ID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(20),
    Email VARCHAR2(30),
    Address VARCHAR2(40),
    Phone NUMBER(10)
);

INSERT INTO CUSTOMER10 VALUES (101,'Ananya Sharma','ananya@gmail.com','Bengaluru',9876543210);
INSERT INTO CUSTOMER10 VALUES (102,'Priya Nair','priya@gmail.com','Chennai',9123456780);
INSERT INTO CUSTOMER10 VALUES (103,'Sneha Reddy','sneha@gmail.com','Hyderabad',9988776655);
INSERT INTO CUSTOMER10 VALUES (104,'Meera Iyer','meera@gmail.com','Chennai',9876123456);
INSERT INTO CUSTOMER10 VALUES (105,'Aisha Khan','aisha@gmail.com','Kolkata',9012345678);
INSERT INTO CUSTOMER10 VALUES (106,'Riya Patel','riya@gmail.com','Ahmedabad',9876541230);
INSERT INTO CUSTOMER10 VALUES (107,'Neha Verma','neha@gmail.com','Lucknow',9765432109);
INSERT INTO CUSTOMER10 VALUES (108,'Kavya Menon','kavya@gmail.com','Kochi',9345678901);
INSERT INTO CUSTOMER10 VALUES (109,'Pooja Singh','pooja@gmail.com','Jaipur',9898989898);
INSERT INTO CUSTOMER10 VALUES (110,'Diya Joshi','diya@gmail.com','Pune',9789012345);

SELECT * FROM CUSTOMER10;

UPDATE CUSTOMER10
SET CustomerName = 'Riya Sharma'
WHERE Customer_ID = 101;

UPDATE CUSTOMER10
SET Email = 'aisha@gmail.com'
WHERE Customer_ID = 105;

COMMIT;

SELECT * FROM CUSTOMER10;

DELETE FROM CUSTOMER10
WHERE Customer_ID = 101;

COMMIT;

SELECT * FROM CUSTOMER10;