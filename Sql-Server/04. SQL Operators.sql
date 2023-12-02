--Create database EmployeeDB
Create database EmployeeDB
Go
Use EmployeeDB
Go



--Create Table For BETWEEN LIKE IN
CREATE TABLE Employee
(
  ID INT PRIMARY KEY IDENTITY(1,1),
  Name VARCHAR(100),
  EmailID VARCHAR(100),
  Gender VARCHAR(100),
  Department VARCHAR(100),
  Salary INT,
  Age INT,
  CITY VARCHAR(100)
)

INSERT INTO Employee VALUES('Pranaya','Pranaya@g.com','Male', 'IT', 25000, 30,'Mumbai')
INSERT INTO Employee VALUES('Tarun','Tarun@g.com','Male', 'Payroll', 30000, 27,'Odisha')
INSERT INTO Employee VALUES('Priyanka','Priyanka@g.com','Female', 'IT', 27000, 25,'Bangalore')
INSERT INTO Employee VALUES('Preety','Preety@g.com','Female', 'HR', 35000, 26,'Bangalore')
INSERT INTO Employee VALUES('Ramesh','Ramesh@g.com','Male','IT', 26000, 27,'Mumbai')
INSERT INTO Employee VALUES('Pramod','Pramod@g.com','Male','HR', 29000, 28,'Odisha')
INSERT INTO Employee VALUES('Anurag','Anurag@g.com','Male', 'Payroll', 27000, 26,'Odisha')
INSERT INTO Employee VALUES('Hina','Hina@g.com','Female','HR', 26000, 30,'Mumbai')
INSERT INTO Employee VALUES('Sambit','Sambit@g.com','Male','Payroll', 30000, 25,'Odisha')
INSERT INTO Employee VALUES('Manoj','Manoj@g.com','Male','HR', 30000, 28,'Odisha')
INSERT INTO Employee VALUES('Sara',' Sara@g.com','Female', 'Payroll', 28000, 27,'Mumbai')
INSERT INTO Employee VALUES('Lima','Lima@g.com','Female','HR', 30000, 30,'Bangalore')
INSERT INTO Employee VALUES('Dipak','Dipak@g.com','Male','Payroll', 32000, 25,'Bangalore')
Go
---Create Table for ALL IN ANY EXISTS
CREATE TABLE PermanentEmployee
(
  EmployeeId INT,
  Name VARCHAR(50),
  Gender VARCHAR(50),
  Department varchar(50),
  Age INT
)
--Insert Rows into PermanentEmployee Table
INSERT INTO PermanentEmployee VALUES (1,'Pranaya','Male','IT',20)
INSERT INTO PermanentEmployee VALUES (2,'Priyanka','Female','IT',22)
INSERT INTO PermanentEmployee VALUES (3,'Sudhanshu','Male','HR',25)
INSERT INTO PermanentEmployee VALUES (4,'Subrat','Male','Sales',60)
INSERT INTO PermanentEmployee VALUES (5,'Tarun','Male','Sales',54)
INSERT INTO PermanentEmployee VALUES (6,'Lipika','Female','HR',27)
INSERT INTO PermanentEmployee VALUES (7,'Smita','Female','IT',40)
INSERT INTO PermanentEmployee VALUES (8,'Smith','Male','HR',29)

CREATE TABLE ContractEmployee
(
  EmployeeId INT,
  Name VARCHAR(50),
  Gender VARCHAR(50),
  Department varchar(50),
  Age INT
)
INSERT INTO ContractEmployee VALUES (9,'Anurag','Male','IT',33)
INSERT INTO ContractEmployee VALUES (10,'Sara','Female','IT',15)
INSERT INTO ContractEmployee VALUES (11,'Sambit','Male','HR',29)
INSERT INTO ContractEmployee VALUES (12,'James','Male','Sales',37)
INSERT INTO ContractEmployee VALUES (13,'Pam','Female','Sales',25)
GO
--SETS Table
CREATE TABLE EmployeeBd
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Gender VARCHAR(10),
  Department VARCHAR(50)
)

INSERT INTO EmployeeBd VALUES(1, 'Pranaya', 'Male','IT')
INSERT INTO EmployeeBd VALUES(2, 'Priyanka', 'Female','IT')
INSERT INTO EmployeeBd VALUES(3, 'Preety', 'Female','HR')
INSERT INTO EmployeeBd VALUES(4, 'Subrat', 'Male','HR')
INSERT INTO EmployeeBd VALUES(5, 'Anurag', 'Male','IT')

CREATE TABLE EmployeeUK
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Gender VARCHAR(10),
  Department VARCHAR(50)
)

INSERT INTO EmployeeUK VALUES(1, 'James', 'Male','IT')
INSERT INTO EmployeeUK VALUES(2, 'Priyanka', 'Female','IT')
INSERT INTO EmployeeUK VALUES(3, 'Sara', 'Female','HR')
INSERT INTO EmployeeUK VALUES(4, 'Subrat', 'Male','HR')
INSERT INTO EmployeeUK VALUES(5, 'Pam', 'Female','HR')
GO

--BETWEEN LIKE IN
SELECT * FROM Employee WHERE ID BETWEEN 3 AND 7
SELECT * FROM Employee WHERE ID NOT BETWEEN 3 AND 7
SELECT * FROM Employee WHERE Name LIKE '_______'
SELECT * FROM Employee WHERE Name LIKE '%an%'
SELECT * FROM Employee WHERE Department IN('hr')
SELECT * FROM Employee WHERE Department NOT IN('hr');
Go
--ALL ANY SOME EXISTS
SELECT * FROM PermanentEmployee WHERE Age > (SELECT MAX(AGE) FROM ContractEmployee)
SELECT * FROM PermanentEmployee WHERE Age > ALL(SELECT AGE FROM ContractEmployee)

SELECT * FROM PermanentEmployee WHERE Age > (SELECT MIN(AGE) FROM ContractEmployee)
SELECT * FROM PermanentEmployee WHERE Age > ANY(SELECT MIN(AGE) FROM ContractEmployee)
SELECT * FROM PermanentEmployee WHERE Age > ANY(SELECT Age FROM ContractEmployee)
--ANY and SOME are same
SELECT * FROM PermanentEmployee WHERE Age > SOME(SELECT Age FROM ContractEmployee)

--Exist
SELECT * FROM PermanentEmployee as PEmp WHERE EXISTS (SELECT  *FROM ContractEmployee as CEmp WHERE PEmp.EmployeeId=CEmp.EmployeeId)
SELECT * FROM PermanentEmployee as PEmp WHERE NOT EXISTS (SELECT  *FROM ContractEmployee as CEmp WHERE PEmp.EmployeeId=CEmp.EmployeeId)
Go
--SETS
Go
--Union & UNION ALL
SELECT ID, Name, Gender FROM EmployeeBd UNION ALL Select ID, Name, Department FROM EmployeeUK
--Uninion remove all duplicate row
SELECT ID, Name, Gender, Department FROM EmployeeBd UNION Select ID, Name, Gender, Department FROM EmployeeUK
Go
--INTERSECT common data from two table
SELECT ID, Name, Gender, Department FROM EmployeeBd INTERSECT Select ID, Name, Gender, Department FROM EmployeeUK
Go
--except
SELECT ID, Name, Gender, Department FROM EmployeeBd EXCEPT Select ID, Name, Gender, Department FROM EmployeeUK
SELECT ID, Name, Gender, Department,Salary FROM Employee WHERE Salary>3000 EXCEPT (Select ID, Name, Gender, Department,Salary FROM Employee WHERE Salary>50000)