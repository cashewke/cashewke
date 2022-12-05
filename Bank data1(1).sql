/* MySQL Project on Bank Management Database by Xingke Liu */

/* PART 1 
Create a database called 'Bank' */
DROP DATABASE IF EXISTS bank; 
CREATE DATABASE bank; USE bank; 

/* Create tables & add constraints
Table 1 - Branch*/
CREATE TABLE branch 
(Branch_id INTEGER(5) AUTO_INCREMENT, 
Branch_name VARCHAR(30) NOT NULL, 
Branch_adress VARCHAR(255) NOT NULL, 
PRIMARY KEY (Branch_id));

/*Table 2 - Customer*/
CREATE TABLE customer
(Customer_id INTEGER(5) AUTO_INCREMENT, 
First_name VARCHAR(15) NOT NULL, 
Last_name VARCHAR(15) NOT NULL, 
Phone_number CHAR(10) NOT NULL, 
Date_of_birth DATE NOT NULL,
Gender VARCHAR(6) Check(Gender IN('Female', 'Male', 'Others')), 
Address VARCHAR(255) NOT NULL, 
Email VARCHAR(25), 
Occupation VARCHAR(20), 
Customer_salary NUMERIC(10,2),
Branch_id INTEGER(5) , 
PRIMARY KEY (Customer_id),
FOREIGN KEY (Branch_id) REFERENCES branch (Branch_id)
 ON DELETE SET NULL);

/*Table 3 - Employee*/
CREATE TABLE employee 
(Employee_id INTEGER(5) AUTO_INCREMENT, 
Employee_name VARCHAR(30) NOT NULL, 
Date_of_join DATE NOT NULL, 
Position VARCHAR(20) NOT NULL, 
Branch_id INTEGER(5) , 
PRIMARY KEY (Employee_id),
FOREIGN KEY (Branch_id) REFERENCES branch (Branch_id)
ON DELETE SET NULL);

/*Table 4 - Position*/
CREATE TABLE position
(Position VARCHAR(20) NOT NULL, 
Salary NUMERIC(10,2) NOT NULL, 
PRIMARY KEY (Position));

/*Table 5 - Account*/
CREATE TABLE account_t
(Account_number INTEGER(6) AUTO_INCREMENT, 
Account_type VARCHAR(10) NOT NULL Check(Account_type IN('Saving', 'Checking', 'Others')), 
Balance NUMERIC(15,2) NOT NULL, 
Customer_id INTEGER(5) NOT NULL, 
PRIMARY KEY (Account_number),
FOREIGN KEY (Customer_id) REFERENCES Customer (Customer_id));

/*Table 6 - Loan*/
CREATE TABLE loan
(Loan_number INTEGER(6) AUTO_INCREMENT, 
Date_of_loan DATE NOT NULL, 
Loan_amount NUMERIC(15,2) NOT NULL, 
loan_interest NUMERIC(5,5) NOT NULL, 
Loan_type VARCHAR(20) NOT NULL, 
Customer_id INTEGER(5) NOT NULL,
PRIMARY KEY (Loan_number),
FOREIGN KEY (Customer_id) REFERENCES customer (Customer_id));

/*Table 7 - Account_Type*/
CREATE TABLE Account_Type
(Account_type VARCHAR(10) NOT NULL Check(Account_type IN('Saving', 'Checking', 'Others')), 
Account_description VARCHAR(255),
PRIMARY KEY (Account_type));

/*Table 8 - Loan_Type*/
CREATE TABLE Loan_Type
(loan_type VARCHAR(20) NOT NULL,
Loan_description VARCHAR(255) NOT NULL,
PRIMARY KEY (Loan_type));
 
 /*Table 9 - Payment_Type*/
CREATE TABLE payment
(payment_id INTEGER(6) AUTO_INCREMENT,
Loan_number INTEGER(10) NOT NULL, 
Payment_date DATE NOT NULL, 
Payment_amount NUMERIC(15,2) NOT NULL, 
Credit_Card_Number BIGINT(20) NOT NULL, 
PRIMARY KEY (payment_id),
FOREIGN KEY (Loan_number) REFERENCES loan (Loan_number));

/* PART 2
Insert data for each table */

USE bank; 

INSERT INTO branch (Branch_ID, Branch_Name, Branch_adress) VALUES
(00001, 'FL_branch','7606 W Newberry Rd, Gainesville, FL, 32607'),
(00002, 'DC_branch', '3100 14th St NW STE 101, Washington, DC,20006'),
(00003, 'MD_branch', '12099 Rockville Pike, Rockville, MD, 20847'),
(00004, 'DC_branch', '3 Dupont Cir NW, Washington, DC, 20009'),
(00005, 'FL_branch','1116 W University Ave, Orlando, FL, 32805'),
(00006, 'CA_branch','3650 Rosecrans Street, San Diego, CA, 91945'),
(00007, 'VA_branch','3215 East Broad Street, Richmond, VA, 23221'),
(00008, 'VA_branch','8128 Arlington Blvd, Falls Church, VA, 22044'),
(00009, 'NC_branch','100 North Tryon Street, Charlotte, NC, 28255'),
(00010, 'IL_branch','135 S. LaSalle Street, Chicago, IL, 60603'),
(00011, 'NY_branch','One Bryant Park, New York, NY, 10036'),
(00012, 'CA_branch','315 Montgomery Street, San Francisco, CA, 94104');

INSERT INTO customer (Customer_ID, Last_Name, First_Name, Phone_Number, Date_of_Birth, Gender, address, Email, Occupation, Customer_Salary, Branch_ID) VALUES
(00001, 'Bob', 'Joe', '3528938475', '1978-08-23', 'Female', '1257 SW 107th Dr, Gainesville, FL，32608', 'joe123@gmail.com', 'doctor', '12000.00', 00001),
(00002, 'Ramsunar','Amber','7772581476','1980-02-12','Male','2573 SW 78th St, Gainesville, FL， 32601','aa212@ufl.edu.com','manager','5000.00',00005),
(00003, 'Alex', 'John', '3522350834', '1998-05-03', 'Male', '7825 Howard St, Falls Church, VA，22040', 'john456@gmail.com', 'teacher', '2000.00', 00007),
(00004, 'Alford', 'Oliver', '3527819876', '1990-07-17', 'Male', '1134 Allen St, Rockville, MD，20840', 'bdsfi@ufl.edu.com', 'policeman', '4000.11', 00003),
(00005, 'Rav', 'Obama', '7456258741', '1997-12-01', 'Female', '8765 Branch Rd, Annandale, VA，22045', 'fhnfr@ufl.edu.com', 'lawyer', '3500.00', 00008),
(00006, 'Santhakumar', 'Muhanmorde','3521234532', '1988-08-08', 'Male', '441 14th St NW, Washington DC，20005', 'adkkdfccc@gmail.com', 'taxi driver', '2045.14',00004),
(00007, 'Shibo', 'Mark', '3528739754', '1983-05-30', 'Female', '1299 Pennsylvania Avenue, Washington DC，20009', 'shibo@gmail.com', 'architect', '4550.00',00002),
(00008, 'Micheal', 'Jim', '7478927632', '1986-04-12', 'Male', '1805 Bladensburg Rd NE, Washington DC，20008', 'hdsbh@ufl.edu', 'bus driver', '3000.00', 00004),
(00009, 'Anthony', 'Stephanie', '2124567890', '1985-03-10', 'Female', '135 S. LaSalle Street, Chicago, IL，60605', 'shibo@gmail.com', 'bus driver', '4550.00',00010),
(00010, 'Donald', 'Michelle', '7478927632', '1994-09-12', 'Male', '356 Montgomery Street, San Francisco, CA，94107', 'cuteMi@outlook.com', 'bus driver', '3000.00', 00012),
(00011, 'Paul', 'Emilyk', '3528739754', '1978-06-23', 'Female', 'One Bryant Park, New York, NY, 10036', 'Paul11@gmail.com', 'professor', '8550.00',00011),
(00012, 'Kevin', 'Jim', '2124509897', '1999-01-12', 'Male', '315 Montgomery Street, San Francisco, CA, 94104', 'Jimmmm@ufl.edu', 'lawyer', '30000.00', 00012),
(00013, 'Jack', 'Catherine', '4124567894', '1975-09-19', 'Female', '3215 East Broad Street, Richmond, VA', 'loveandpeace@gmail.com', 'manager', '2550.00',00007),
(00014, 'Tyler', 'Diane', '7478927604', '1998-11-12', 'Male', '356 Montgomery Street, San Francisco, CA，94107', 'sunny@outlook.com', 'doctor', '13000.00', 00012),
(00015, 'Henry', 'Virginia', '352873973', '1968-08-23', 'Female', 'One Bryant Park, New York, NY, 10036', 'henry1999@gmail.com', 'professor', '9550.00',00011);

INSERT INTO employee (Employee_ID,Employee_Name,Date_of_Join,Position,Branch_ID) VALUES
(1,'Lucida Joe','2005-10-01','Loan processor','00001'),
(2,'Anderson Lee','2021-05-02','Mortgage consultant','00005'),
(3,'Subbarao Dean','2015-09-20', 'Investment banker','00004'),
(4,'Mukesh James','2020-03-17','Banker','00007'),
(5,'McDen Rovena','2017-09-25','Loan processor','00003'),
(6,'Ivan Hu','2015-11-02','Credit analyst','00006'),
(7,'Benjamin Trump','2009-06-30','Investment banker','00002'),
(8,'Yiyi Huang','2020-05-17','Banker','00010'),
(9,'Gary Amy','2011-11-25','Loan processor','00011'),
(10,'Eric Shirley','2017-1-02','Credit analyst','00012'),
(11,'Justin Emma','2010-03-18','Loan processor','00008'),
(12,'Brandon Helen','2011-11-05','Accountant','00009');

INSERT INTO loan (Loan_Number, Date_of_Loan, Loan_Amount, Loan_Interest, Loan_Type, Customer_ID) VALUES
(100001, '2018-01-19', 50000.00, 0.031, 'Car loan', 00005),
(100002, '2016-04-30', 60000.00, 0.036, 'Car Loan', 00001),
(100003, '2015-03-23', 700000.00, 0.035, 'Mortgage', 00003),
(100004, '2012-11-07', 300000.00, 0.041, 'Mortgage', 00008),
(100005, '2013-07-17', 40000.00, 0.029, 'Car loan', 00007),
(100006, '2020-02-18', 35000.00, 0.035, 'Car loan', 00004),
(100007, '2013-03-23', 700000.00, 0.035, 'Mortgage', 00003),
(100008, '2010-11-07', 1300000.00, 0.041, 'Mortgage', 00010),
(100009, '2009-07-17', 20000.00, 0.029, 'Car loan', 00005),
(100010, '2020-11-07', 1500000.00, 0.041, 'Mortgage', 00002),
(100011, '2009-07-18', 2000.00, 0.029, 'Car loan', 00005);

INSERT INTO account_type (Account_type, Account_description) VALUES
('checking', 'Commonly used payment and remittance accounts'),
('saving', 'savings account, the deposits in this account are provided with interest');

INSERT INTO Loan_type (Loan_type, Loan_description) VALUES
('Car loan','loans granted by lenders to borrowers who apply for the purchase of a car'),
('Mortgage', 'an agreement between you and a lender that gives the lender the right to take your property'),
('Others', 'Other type of loan');

INSERT INTO position (Position,salary) VALUES
('Loan processor', 2500.00),
('Banker', 5000.00),
('Investment banker', 3350.00),
('Credit analyst', 3800.00),
('Accountant', 4800.00),
('Mortgage consultant', 3750.00);

INSERT INTO account_t (Account_number, Account_type, Balance, Customer_ID) VALUES
(0001, 'Checking', 60000.00, 00001),
(0002, 'Saving', 126850.00, 00002),
(0003, 'Checking', 60000.00, 00003),
(0004, 'Checking', 90000.00, 00004),
(0005, 'Saving', 105000.00, 00005),
(0006, 'Checking', 100000.00, 00006),
(0007, 'Checking', 90000.00, 00003),
(0008, 'Checking', 190000.00, 00004),
(0009, 'Saving', 45000.00, 00005);

INSERT INTO payment (payment_id, Loan_Number, Payment_Date, payment_Amount, Credit_Card_Number) VALUES
(1, 100001, '2021-05-21', 500.00, 4147207879878754),
(2, 100002, '2021-06-01', 700.00, 2147457809874756),
(3, 100003, '2021-05-11', 2500.00, 5147007879878754),
(4, 100004, '2021-05-28', 1800.00, 6147007643568789),
(5, 100005, '2021-06-15', 500.00, 5147457234976556),
(6, 100006, '2021-07-07', 3500.00, 4147207898532754),
(7, 100007, '2020-05-11', 2500.00, 8147007879876453),
(8, 100008, '2011-05-28', 1800.00, 7147007643536849),
(9, 100009, '2018-06-15', 5000.00, 4147207879878754),
(10, 100002, '2021-06-01', 700.00, 2147457809874756),
(11, 100011, '2021-05-11', 2000.00, 4147207879878754),
(12, 100008, '2021-05-28', 2800.00, 6147007643568789),
(13, 100005, '2021-06-15', 500.00, 5147457234976556),
(14, 100007, '2016-07-07', 13500.00, 4147207898532754),
(15, 100007, '2020-05-11', 12500.00, 8147007879876453),
(16, 100005, '2015-05-28', 7800.00, 7147007643536849);

/* PART 3 
Using DML command to manage database */

/* First let's view all the table exsisted */
SELECT * FROM employee;
SELECT * FROM Account_t;
SELECT * FROM customer;
SELECT * FROM branch;
SELECT * FROM payment;
SELECT * FROM loan;
SELECT * FROM account_type;
SELECT * FROM loan_type;
SELECT * FROM position;

/* Update the position of employee ID = 7 to Credit analyst */
UPDATE employee 
SET position = 'Credit analyst'
WHERE employee_id = '7';

/* The NC_branch(00009) was closed. Deleted it from branch table*/
SET SQL_SAFE_UPDATES = 0;
DELETE FROM branch
WHERE branch_id = '00009';
SET SQL_SAFE_UPDATES = 1;

/* Add a new BusinessType attribute in Branch table */
ALTER TABLE Branch
ADD BusinessType VARCHAR(10) DEFAULT "Commercial";

/* Update the balance of loan_amount*/
SET SQL_SAFE_UPDATES = 0;
UPDATE loan, payment
SET loan_amount = loan_amount - payment_amount
where payment.loan_number = loan.loan_number;
SET SQL_SAFE_UPDATES = 1;

/* PART 4
Create views to select information */

/* View the customer_id and his number of payments for customer who pays more than average payment times for a loan*/
SELECT customer_id, Npayments
FROM (SELECT customer.customer_id, count(payment_id) as Npayments
FROM payment, loan, customer 
WHERE payment.loan_number = loan.loan_number
AND customer.customer_id = loan.customer_id
GROUP BY customer_id
HAVING Npayments> 
(SELECT avg(N) as M
FROM (SELECT count(payment_id) as N
FROM payment
GROUP BY loan_number) as PA))as O;

/* view the customer name who applied loan and the loan amount >100000 */
SELECT first_name, last_name, loan_amount
FROM customer join loan on customer.customer_id = loan.customer_id
WHERE customer.customer_id in 
	(SELECT DISTINCT customer_id FROM loan)
HAVING loan_amount>100000
ORDER BY loan_amount DESC;

/* View the branch name, employee name and employee position who works in FL_branch. Also show the clients name in FL_brach*/
SELECT branch_name, employee_Name, position, customer_id
FROM branch,employee, customer
WHERE branch.branch_id = employee.branch_id And branch.branch_id = customer.branch_id
AND branch.branch_name='FL_branch';

/* View all the customerID's balance above the average */
SELECT customer_id, account_type, balance 
FROM account_T 
WHERE balance > 
(SELECT Avg(balance) as AVGbalance 
FROM account_T)
ORDER BY balance DESC;