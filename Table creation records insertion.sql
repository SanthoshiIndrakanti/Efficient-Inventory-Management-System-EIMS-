-- Creating the Database
CREATE DATABASE INVENTORY;
USE INVENTORY;

-- Creating tables

-- CREATING SUPPLIER DETAILS TABLE
CREATE TABLE SUPPLIER
(SID CHAR(5) PRIMARY KEY CHECK (SID LIKE 'S__'),
SNAME VARCHAR(30) NOT NULL);

-- CREATING SUPPLIER TABLE
CREATE TABLE SUPPLIER_DETAILS
(SID CHAR(5) PRIMARY KEY CHECK (SID LIKE 'S__'),
SADDR VARCHAR(60) NOT NULL,
SCITY VARCHAR(30) DEFAULT ('DALLAS'),
SPHONE CHAR(14) UNIQUE,
SMAIL VARCHAR(50) UNIQUE);

-- CREATING PRODUCT TABLE
CREATE TABLE PRODUCT
(PID CHAR(5) PRIMARY KEY CHECK (PID LIKE 'P__'),
PDESC VARCHAR(50) NOT NULL);

-- CREATING PRODUCT DESC TABLE
CREATE TABLE PRODUCT_DESC
(PID CHAR(5) PRIMARY KEY CHECK (PID LIKE 'P__'),
PRICE INT,
CATEGORY VARCHAR(50),
SID CHAR(5),
FOREIGN KEY(SID) REFERENCES SUPPLIER(SID));

-- CREATING CUSTOMER TABLE
CREATE TABLE CUSTOMER
(CID CHAR(5) PRIMARY KEY CHECK (CID LIKE 'C__'),
CNAME VARCHAR(30) NOT NULL);

-- CREATING CUSTOMER DETAILS TABLE
CREATE TABLE CUSTOMER_DETAILS
(CID CHAR(5) PRIMARY KEY CHECK (CID LIKE 'C__'),
CADDR VARCHAR(60) NOT NULL,
CCITY VARCHAR(30) NOT NULL,
CPHONE CHAR(14) NOT NULL,
CMAIL VARCHAR(60) NOT NULL,
DOB DATE CHECK (DOB < '28-04-2023'));

-- CREATING ORDERS TABLE
CREATE TABLE ORDERS
(OID CHAR(5) PRIMARY KEY CHECK (OID LIKE 'O__'),
ODATE DATE,
CID CHAR(5), 
PID CHAR(5), 
FOREIGN KEY(CID) REFERENCES CUSTOMER(CID),
FOREIGN KEY(PID) REFERENCES PRODUCT(PID),
OQTY INT CHECK(OQTY >= 1));

-- CREATING STOCK TABLE
CREATE TABLE STOCK
(PID CHAR(5),
FOREIGN KEY(PID) REFERENCES PRODUCT(PID),
SQTY INT CHECK (SQTY >= 0),
ROL INT CHECK (ROL > 0),
MOQ INT CHECK (MOQ >= 5));

-- VIEWING ALL TABLES
SELECT * FROM SUPPLIER;
SELECT * FROM SUPPLIER_DETAILS;
SELECT * FROM PRODUCT;
SELECT * FROM PRODUCT_DESC;
SELECT * FROM CUSTOMER;
SELECT * FROM CUSTOMER_DETAILS;
SELECT * FROM ORDERS;
SELECT * FROM STOCK;

-- Inserting records into the customer table 
INSERT INTO customer (CID, CNAME) VALUES ('C01', 'John Doe');
INSERT INTO customer (CID, CNAME) VALUES ('C02', 'Jane Smith');
INSERT INTO customer (CID, CNAME) VALUES ('C03', 'Bob Johnson');
INSERT INTO customer (CID, CNAME) VALUES ('C04', 'Alice Lee');
INSERT INTO customer (CID, CNAME) VALUES ('C05', 'Mark Brown');
INSERT INTO customer (CID, CNAME) VALUES ('C06', 'Emily Davis');
INSERT INTO customer (CID, CNAME) VALUES ('C07', 'David Wilson');
INSERT INTO customer (CID, CNAME) VALUES ('C08', 'Karen Anderson');
INSERT INTO customer (CID, CNAME) VALUES ('C09', 'Brian Taylor');
INSERT INTO customer (CID, CNAME) VALUES ('C10', 'Laura Martinez');
INSERT INTO customer (CID, CNAME) VALUES ('C11', 'Chris Hernandez');
INSERT INTO customer (CID, CNAME) VALUES ('C12', 'Sara Perez');
INSERT INTO customer (CID, CNAME) VALUES ('C13', 'Kevin Chen');
INSERT INTO customer (CID, CNAME) VALUES ('C14', 'John David');
INSERT INTO customer (CID, CNAME) VALUES ('C15', 'Amy Patel');
INSERT INTO customer (CID, CNAME) VALUES ('C16', 'Jason Gupta');
INSERT INTO customer (CID, CNAME) VALUES ('C17', 'Michelle Lee');
INSERT INTO customer (CID, CNAME) VALUES ('C18', 'Michael Kim');
INSERT INTO customer (CID, CNAME) VALUES ('C19', 'Kelly Thompson');
INSERT INTO customer (CID, CNAME) VALUES ('C20', 'Daniel Davis');
INSERT INTO customer (CID, CNAME) VALUES ('C21', 'Linda Miller');
INSERT INTO customer (CID, CNAME) VALUES ('C22', 'Eric Johnson');
INSERT INTO customer (CID, CNAME) VALUES ('C23', 'Jenny Wilson');
INSERT INTO customer (CID, CNAME) VALUES ('C24', 'Tom Baker');


-- Inserting into Customer_details.
INSERT INTO customer_details (CID, CADDR, CCITY, CPHONE, CMAIL, DOB) VALUES 
('C01', '123 Main St', 'Dallas', '555-1234', 'johndoe@example.com', '1990-01-01'),
('C02', '456 Elm St', 'Austin', '555-2345', 'janesmith@example.com', '1992-05-23'),
('C03', '789 Oak St', 'Houston', '555-3456', 'bobjohnson@example.com', '1985-09-12'),
('C04', '234 Pine St', 'San Antonio', '555-4567', 'alicelee@example.com', '1998-11-30'),
('C05', '567 Maple St', 'Houston', '555-5678', 'markbrown@example.com', '1977-07-07'),
('C06', '890 Cedar St', 'Austin', '555-6789', 'emilydavis@example.com', '1995-02-14'),
('C07', '432 Birch St', 'Dallas', '555-7890', 'davidwilson@example.com', '1982-12-05'),
('C08', '765 Cherry St', 'San Antonio', '555-8901', 'karenanderson@example.com', '1989-06-19'),
('C09', '987 Spruce St', 'Austin', '555-9012', 'briantaylor@example.com', '1993-08-31'),
('C10', '321 Oak St', 'Dallas', '555-0123', 'lauramartinez@example.com', '1997-04-16'),
('C11', '654 Pine St', 'Houston', '555-1234', 'chrishernandez@example.com', '1986-10-22'),
('C12', '987 Cedar St', 'San Antonio', '555-2345', 'saraperez@example.com', '1991-03-08'),
('C13', '234 Birch St', 'Austin', '555-3456', 'kevinchen@example.com', '1984-12-18'),
('C14', 'Fry street', 'Dallas', '555-4567', 'kimnguyen@example.com', '1981-02-28'),
('C15', '890 Pine St', 'Dallas', '555-5678', 'amypatel@example.com', '1996-07-11'),
('C16', '432 Oak St', 'San Antonio', '555-6789', 'jasongupta@example.com', '1990-09-30'),
('C17', '765 Cedar St', 'Austin', '555-7890', 'michellelee@example.com', '1979-04-25'),
('C18', '987 Birch St', 'Houston', '555-8901', 'michaelkim@example.com', '1976-12-13'),
('C19', '321 Maple St', 'Dallas', '555-9012', 'kellythompson@example.com', '1999-01-02'),
('C20', '654 Oak St', 'San Antonio', '555-0123', 'danieldavis@example.com', '1994-06-28'),
('C21', '987 Pine St', 'Austin', '555-1234', 'lindamiller@example.com', '2020-08-18'),
('C22', '987 Pine St', 'Austin', '555-1234', 'lindamiller@example.com', '2020-08-18'),
('C23', '987 Pine St', 'Austin', '555-1234', 'lindamiller@example.com', '2020-08-18'),
('C24', '987 Pine St', 'Austin', '555-1234', 'lindamiller@example.com', '2020-08-18');

-- Inserting records into Orders. 

INSERT INTO orders (OID, ODATE, CID, PID, OQTY) VALUES 
('O01', '2022-01-15', 'C01', 'P01', 2),
('O02', '2022-02-20', 'C03', 'P03', 1),
('O03', '2022-03-05', 'C02', 'P04', 3),
('O04', '2022-04-10', 'C05', 'P01', 4),
('O05', '2022-05-20', 'C04', 'P02', 2),
('O06', '2022-06-01', 'C02', 'P03', 1),
('O07', '2022-07-12', 'C01', 'P05', 3),
('O08', '2022-08-25', 'C04', 'P01', 1),
('O09', '2022-09-08', 'C03', 'P02', 2),
('O10', '2022-10-10', 'C05', 'P04', 1),
('O11', '2022-11-15', 'C02', 'P01', 3),
('O12', '2022-12-20', 'C01', 'P03', 2),
('O13', '2023-01-03', 'C03', 'P02', 1),
('O14', '2023-02-08', 'C04', 'P05', 4),
('O15', '2023-03-15', 'C05', 'P03', 2),
('O16', '2023-04-01', 'C02', 'P04', 1),
('O17', '2023-05-12', 'C01', 'P02', 3),
('O18', '2023-06-17', 'C04', 'P01', 2),
('O19', '2023-07-22', 'C03', 'P05', 1),
('O20', '2023-08-30', 'C02', 'P04', 4),
('O21', '2023-09-05', 'C05', 'P03', 2),
('O22', '2023-10-15', 'C01', 'P02', 1),
('O23', '2023-11-20', 'C03', 'P05', 3),
('O24', '2023-12-25', 'C04', 'P01', 2);

-- Inserting product table 
INSERT INTO product (PID, PDESC) VALUES 
('P01', 'ear phones'),
('P02', 'Apple watch'),
('P03', 'Samsung laptop'),
('P04', 'HP laptop'),
('P05', 'Lenovo cell phone'),
('P06', 'Flipkart shoes products'),
('P07', 'Coka-cola products'),
('P08', 'Yamaha piano'),
('P09', 'Samsung phone'),
('P10', 'vaseline body lotion'),
('P11', 'Cisco calculator'),
('P12', 'Yamaha piano'),
('P13', 'Lenovo laptop'),
('P14', 'Apple ipods'),
('P15', 'HP laptop'),
('P16', 'Dell laptop'),
('P17', 'Apple ipods'),
('P18', 'Apple laptop'),
('P19', 'Yamaha piano'),
('P20', 'Samsung mobile'),
('P21', 'Apple desktop'),
('P22', 'Samsung tv'),
('P23', 'Lenovo phone'),
('P24', 'Samsung tv'),
('P25', 'Amazon products'),
('P26', 'Cisco calculator'),
('P27', 'Samsung phone'),
('P28', 'Cisco desktop');

-- Inserting product description table 

INSERT INTO product_desc (PID, PRICE, CATEGORY, SID) VALUES 
('P01', 100, 'Electronics', 'S01'),
('P02', 200, 'Electronics', 'S02'),
('P03', 50, 'Electronics', 'S03'),
('P04', 150, 'Electronics', 'S04'),
('P05', 300, 'Electronics', 'S05'),
('P06', 25, 'Footwear', 'S06'),
('P07', 75, 'Home & Kitchen', 'S01'),
('P08', 250, 'Electronics', 'S02'),
('P09', 80, 'Electronics', 'S03'),
('P10', 120, 'Skincare', 'S04'),
('P11', 175, 'Electronics', 'S05'),
('P12', 60, 'Electronics', 'S06'),
('P13', 90, 'Electronics', 'S01'),
('P14', 300, 'Electronics', 'S02'),
('P15', 40, 'Electronics', 'S03'),
('P16', 125, 'Electronics', 'S04'),
('P17', 150, 'Electronics', 'S05'),
('P18', 80, 'Electronics', 'S06'),
('P19', 200, 'Electronics', 'S01'),
('P20', 300, 'Electronics', 'S02');


-- Inserting records in Stock table

INSERT INTO stock (PID, SQTY, ROL, MOQ) VALUES 
('P01', 50, 20, 10),
('P02', 100, 30, 5),
('P03', 75, 25, 5),
('P04', 200, 50, 20),
('P05', 150, 40, 10),
('P06', 80, 30, 10),
('P07', 120, 40, 10),
('P08', 90, 25, 5),
('P09', 60, 20, 5),
('P10', 100, 30, 10),
('P11', 50, 20, 10),
('P12', 100, 30, 5),
('P13', 75, 25, 5),
('P14', 200, 50, 20),
('P15', 150, 40, 10),
('P16', 80, 30, 10),
('P17', 120, 40, 10),
('P18', 90, 25, 5),
('P19', 60, 20, 5),
('P20', 100, 30, 10),
('P21', 70, 25, 5),
('P22', 120, 35, 10),
('P23', 90, 30, 5),
('P24', 80, 20, 5),
('P25', 150, 45, 10),
('P26', 100, 25, 5),
('P27', 50, 15, 5),
('P28', 120, 30, 10);

-- Inserting records into supplier 

INSERT INTO supplier (SID, SNAME) VALUES 
('S01', 'Amazon'),
('S02', 'Apple'),
('S03', 'Samsung'),
('S04', 'Dell'),
('S05', 'Lenovo'),
('S06', 'Flipkart'),
('S07', 'Coka-cola'),
('S08', 'Yamaha'),
('S09', 'Samsung'),
('S10', 'Dell'),
('S11', 'Cisco'),
('S12', 'Yamaha'),
('S13', 'Lenovo'),
('S14', 'Apple'),
('S15', 'HP'),
('S16', 'Lenovo'),
('S17', 'Apple'),
('S18', 'Apple'),
('S19', 'Yamaha'),
('S20', 'Samsung'),
('S21', 'Apple'),
('S22', 'Samsung'),
('S23', 'Lenovo'),
('S24', 'Samsung'),
('S25', 'Amazon'),
('S26', 'Cisco'),
('S27', 'Samsung'),
('S28', 'Cisco');

-- Inserting records into supplier details.

INSERT INTO supplier_details (SID, SADDR, SCITY, SPHONE, SMAIL) VALUES 
('S01', '1921 W Hickory', 'DALLAS', '940-977-2540', 'Products@gmail.com'),
('S02', '1921 W Hickory', 'DALLAS', '940-977-2544', 'productsofall@gmail.com'),
('S03', '1701 Bernard St', 'DALLAS', '940-548-2650', 'productsin@gmail.com'),
('S04', '1751 Red Mesa trail', 'DALLAS', '970-566-8426', 'productofproducts@gmail.com'),
('S05', '1921 W Hickory', 'DALLAS', '851-954-9656', 'supplies@gmail.com'),
('S06', '1860 E Hickory', 'DALLAS', '654-985-2318', 'kelos@gmail.com'),
('S07', '1432 Across the St', 'DALLAS', '785-698-4748', 'fellowship@gmail.com'),
('S08', '1607 W Oak St', 'DALLAS', '365-955-8614', 'amazon@gmail.com'),
('S09', '1701 Bernard St', 'DALLAS', '659-894-3322', 'apple@gmail.com'),
('S10', '1702 fountains of denton', 'DALLAS', '789-514-2255', 'productsofproducts@gmail.com'),
('S11', '1512 cleveland St', 'DALLAS', '785-789-5667', 'allproducts2@gmail.com'),
('S12', '1607 W Oak St', 'DALLAS', '897-456-5645', 'cokacola@gmail.com'),
('S13', '1660 E Oak St', 'DALLAS', '965-224-6548', 'yamaha@gmail.com'),
('S14', '1921 W Hickory', 'DALLAS', '645-488-9867', 'lenovo@gmail.com'),
('S15', '1751 Red Mesa trail', 'DALLAS', '695-784-9632', 'samsung@gmail.com'),
('S16', '1660 E Oak St', 'DALLAS', '456-265-9658', 'samsungproducts@gmail.com'),
('S17', '1921 W Hickory', 'DALLAS', '654-962-7415', 'ciscoproducts@gmail.com'),
('S18', '1921 W Hickory', 'DALLAS', '2365-587-9654', 'cisco@gmail.com'),
('S19', '1607 W Oak St', 'DALLAS', '654-659-2458', 'productscisco@gmail.com'),
('S20', '1701 Bernard St', 'DALLAS', '564-897-3652', 'lenovoproducts@gmail.com'),
('S21', '1921 W Hickory', 'DALLAS', '459-852-7456', 'productsofall08@gmail.com'),
('S22', '1701 Bernard St', 'DALLAS', '425-896-7412', 'productofitems@gmail.com'),
('S23', '1660 E Oak St', 'DALLAS', '453-957-4562', 'productsofproducts01@gmail.com'),
('S24', '1701 Bernard St', 'DALLAS', '365-785-4125', 'appleproducts@gmail.com'),
('S25', '3521 Union Circle', 'DALLAS', '654-853-9578', 'items@gmail.com'),
('S26', '1512 cleveland St', 'DALLAS', '368-964-7458', 'saleofitems@gmail.com'),
('S27', '1701 Bernard St', 'DALLAS', '897-254-6589', 'allproducts@gmail.com'),
('S28', '1512 cleveland St', 'DALLAS', '456-158-9654', 'productofproducts09@gmail.com');
