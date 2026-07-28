SQL> CREATE TABLE CUSTOMER2 (
  2      Customer_ID NUMBER PRIMARY KEY,
  3      CustomerName VARCHAR2(20),
  4      Email VARCHAR2(30),
  5      Address VARCHAR2(40),
  6      Phone NUMBER(10)
  7  );

Table created.

SQL> 
SQL> INSERT INTO CUSTOMER2 VALUES (201,'Arjun Kumar','arjun@gmail.com','Chennai',9876543211);

1 row created.

SQL> INSERT INTO CUSTOMER2 VALUES (202,'Rahul Sharma','rahul@gmail.com','Delhi',9876543212);

1 row created.

SQL> INSERT INTO CUSTOMER2 VALUES (203,'Karthik Raj','karthik@gmail.com','Coimbatore',9876543213);

1 row created.

SQL> INSERT INTO CUSTOMER2 VALUES (204,'Vikram Singh','vikram@gmail.com','Mumbai',9876543214);

1 row created.

SQL> INSERT INTO CUSTOMER2 VALUES (205,'Suresh Kumar','suresh@gmail.com','Madurai',9876543215);

1 row created.

SQL> INSERT INTO CUSTOMER2 VALUES (206,'Rohit Verma','rohit@gmail.com','Pune',9876543216);

1 row created.

SQL> INSERT INTO CUSTOMER2 VALUES (207,'Ajay Patel','ajay@gmail.com','Ahmedabad',9876543217);

1 row created.

SQL> INSERT INTO CUSTOMER2 VALUES (208,'Manoj Nair','manoj@gmail.com','Kochi',9876543218);

1 row created.

SQL> INSERT INTO CUSTOMER2 VALUES (209,'Deepak Reddy','deepak@gmail.com','Hyderabad',9876543219);

1 row created.

SQL> INSERT INTO CUSTOMER2 VALUES (210,'Naveen Iyer','naveen@gmail.com','Bengaluru',9876543220);

1 row created.

SQL> 
SQL> SELECT * FROM CUSTOMER2;

CUSTOMER_ID CUSTOMERNAME         EMAIL
----------- -------------------- ------------------------------
ADDRESS                                       PHONE
---------------------------------------- ----------
        201 Arjun Kumar          arjun@gmail.com
Chennai                                  9876543211

        202 Rahul Sharma         rahul@gmail.com
Delhi                                    9876543212

        203 Karthik Raj          karthik@gmail.com
Coimbatore                               9876543213


CUSTOMER_ID CUSTOMERNAME         EMAIL
----------- -------------------- ------------------------------
ADDRESS                                       PHONE
---------------------------------------- ----------
        204 Vikram Singh         vikram@gmail.com
Mumbai                                   9876543214

        205 Suresh Kumar         suresh@gmail.com
Madurai                                  9876543215

        206 Rohit Verma          rohit@gmail.com
Pune                                     9876543216


CUSTOMER_ID CUSTOMERNAME         EMAIL
----------- -------------------- ------------------------------
ADDRESS                                       PHONE
---------------------------------------- ----------
        207 Ajay Patel           ajay@gmail.com
Ahmedabad                                9876543217

        208 Manoj Nair           manoj@gmail.com
Kochi                                    9876543218

        209 Deepak Reddy         deepak@gmail.com
Hyderabad                                9876543219


CUSTOMER_ID CUSTOMERNAME         EMAIL
----------- -------------------- ------------------------------
ADDRESS                                       PHONE
---------------------------------------- ----------
        210 Naveen Iyer          naveen@gmail.com
Bengaluru                                9876543220


10 rows selected.

SQL> 
SQL> UPDATE CUSTOMER2
  2  SET CustomerName = 'Arjun Sharma'
  3  WHERE Customer_ID = 201;

1 row updated.

SQL> 
SQL> UPDATE CUSTOMER2
  2  SET Email = 'rahul123@gmail.com'
  3  WHERE Customer_ID = 202;

1 row updated.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> SELECT * FROM CUSTOMER2;

CUSTOMER_ID CUSTOMERNAME         EMAIL
----------- -------------------- ------------------------------
ADDRESS                                       PHONE
---------------------------------------- ----------
        201 Arjun Sharma         arjun@gmail.com
Chennai                                  9876543211

        202 Rahul Sharma         rahul123@gmail.com
Delhi                                    9876543212

        203 Karthik Raj          karthik@gmail.com
Coimbatore                               9876543213


CUSTOMER_ID CUSTOMERNAME         EMAIL
----------- -------------------- ------------------------------
ADDRESS                                       PHONE
---------------------------------------- ----------
        204 Vikram Singh         vikram@gmail.com
Mumbai                                   9876543214

        205 Suresh Kumar         suresh@gmail.com
Madurai                                  9876543215

        206 Rohit Verma          rohit@gmail.com
Pune                                     9876543216


CUSTOMER_ID CUSTOMERNAME         EMAIL
----------- -------------------- ------------------------------
ADDRESS                                       PHONE
---------------------------------------- ----------
        207 Ajay Patel           ajay@gmail.com
Ahmedabad                                9876543217

        208 Manoj Nair           manoj@gmail.com
Kochi                                    9876543218

        209 Deepak Reddy         deepak@gmail.com
Hyderabad                                9876543219


CUSTOMER_ID CUSTOMERNAME         EMAIL
----------- -------------------- ------------------------------
ADDRESS                                       PHONE
---------------------------------------- ----------
        210 Naveen Iyer          naveen@gmail.com
Bengaluru                                9876543220


10 rows selected.

SQL> 
SQL> DELETE FROM CUSTOMER2
  2  WHERE Customer_ID = 210;

1 row deleted.

SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> SELECT * FROM CUSTOMER2;