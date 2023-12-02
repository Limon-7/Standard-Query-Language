--Sql Server Clause
Use TestSchool
--where and Order by with fetch and offset
Select ID, Name, EmailID, Salary from Employee where salary>1000 order by ID ASC , EmailId desc  OFFSET 5 ROWS FETCH NEXT 2 Rows ONLY
Go
---
Select Top(2) ID, Name, EmailID, Salary  from Employee order by Name


CREATE TABLE Person
(
  ID INT PRIMARY KEY IDENTITY(1,1),
  Name VARCHAR(50),
  Salary int
)
INSERT INTO Person VALUES('PRANAYA', 20000)
INSERT INTO Person VALUES('KUMAR', 30000)
INSERT INTO Person VALUES('ROUT', 25000)
INSERT INTO Person VALUES('PRANAYA', 25000)
INSERT INTO Person VALUES('KUMAR', 30000)
INSERT INTO Person VALUES('ROUT', 25000)
INSERT INTO Person VALUES('PRIYANKA', 20000)
INSERT INTO Person VALUES('PREETY', 30000)

SELECT TOP (3) Name FROM Person ORDER BY Name
SELECT TOP (70) PERCENT Name, Salary FROM Person ORDER BY Name
SELECT TOP (3) WITH TIES Name, Salary FROM Person ORDER BY Name
UPDATE TOP(3) Person SET Salary=10000
DELETE TOP(2) FROM Person


--GROUPBY and Having Clause
CREATE TABLE EmployeeForHaving
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
GO
--Insert some test data into Employee table
INSERT INTO EmployeeForHaving VALUES('PRANAYA','PRANAYA@G.COM','Male', 'IT', 25000, 30,'MUMBAI'),('TARUN','TARUN@G.COM','Male', 'Payroll', 30000, 27,'ODISHA'),('PRIYANKA','PRIYANKA@G.COM','Female', 'IT', 27000, 25,'BANGALORE'),('PREETY','PREETY@G.COM','Female', 'HR', 35000, 26,'BANGALORE'),
('RAMESH','RAMESH@G.COM','Male','IT', 26000, 27,'MUMBAI'),
('PRAMOD','PRAMOD@G.COM','Male','HR', 29000, 28,'ODISHA'),
('ANURAG','ANURAG@G.COM','Male', 'Payroll', 27000, 26,'ODISHA'),
('HINA','HINA@G.COM','Female','HR', 26000, 30,'MUMBAI'),
('SAMBIT','HINA@G.COM','Male','Payroll', 30000, 25,'ODISHA'),
('MANOJ','MANOJ@G.COM','Male','HR', 30000, 28,'ODISHA'),
('SWAPNA','SWAPNA@G.COM','Female', 'Payroll', 28000, 27,'MUMBAI'),
('LIMA','LIMA@G.COM','Female','HR', 30000, 30,'BANGALORE'),
('DIPAK','DIPAK@G.COM','Male','Payroll', 32000, 25,'BANGALORE')
GO
SELECT [Department], COUNT(ID) AS [Total Employee] FROM EmployeeForHaving GROUP BY Department

SELECT Gender,  City, SUM(Salary) as TotalSalary, COUNT(ID) as TotalEmployees FROM EmployeeForHaving where Salary>30000  GROUP BY  CITY, Gender Order BY TotalSalary OFFSET 1 ROWS 
FETCH NEXT 1 ROWS ONLY;

SELECT Department, CITY, AVG(Salary) AS 'Average salary' FROM EmployeeForHaving GROUP BY Department, CITY HAVING AVG(Salary) > 27000;

SELECT Department, CITY, AVG(Salary) AS 'Average salary' FROM EmployeeForHaving GROUP BY Department, CITY HAVING CITY In ('MUMBAI') ORDER BY Department OFFSET 1 ROWS 
FETCH NEXT 1 ROWS ONLY; 