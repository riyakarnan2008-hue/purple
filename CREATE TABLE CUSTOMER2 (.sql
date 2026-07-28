CREATE TABLE CUSTOMER2 (
    Customer_ID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(20),
    Email VARCHAR2(30),
    Address VARCHAR2(40),
    Phone NUMBER(10)
);

INSERT INTO CUSTOMER2 VALUES (201,'Arjun Kumar','arjun@gmail.com','Chennai',9876543211);
INSERT INTO CUSTOMER2 VALUES (202,'Rahul Sharma','rahul@gmail.com','Delhi',9876543212);
INSERT INTO CUSTOMER2 VALUES (203,'Karthik Raj','karthik@gmail.com','Coimbatore',9876543213);
INSERT INTO CUSTOMER2 VALUES (204,'Vikram Singh','vikram@gmail.com','Mumbai',9876543214);
INSERT INTO CUSTOMER2 VALUES (205,'Suresh Kumar','suresh@gmail.com','Madurai',9876543215);
INSERT INTO CUSTOMER2 VALUES (206,'Rohit Verma','rohit@gmail.com','Pune',9876543216);
INSERT INTO CUSTOMER2 VALUES (207,'Ajay Patel','ajay@gmail.com','Ahmedabad',9876543217);
INSERT INTO CUSTOMER2 VALUES (208,'Manoj Nair','manoj@gmail.com','Kochi',9876543218);
INSERT INTO CUSTOMER2 VALUES (209,'Deepak Reddy','deepak@gmail.com','Hyderabad',9876543219);
INSERT INTO CUSTOMER2 VALUES (210,'Naveen Iyer','naveen@gmail.com','Bengaluru',9876543220);

SELECT * FROM CUSTOMER2;

UPDATE CUSTOMER2
SET CustomerName = 'Arjun Sharma'
WHERE Customer_ID = 201;

UPDATE CUSTOMER2
SET Email = 'rahul123@gmail.com'
WHERE Customer_ID = 202;

COMMIT;

SELECT * FROM CUSTOMER2;

DELETE FROM CUSTOMER2
WHERE Customer_ID = 210;

COMMIT;

SELECT * FROM CUSTOMER2;