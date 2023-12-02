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

SELECT Department, COUNT(*)as [Total Employee], SUM(Salary) as [Total Salary],AVG(Salary) as [Avarage Salary],MIN(Salary) as [Lowest Salary], MAX(Salary) as [Highest Salary] from Employee 
GROUP BY Department
GO
-- Now We want the toatal employee with their salary
SELECT [Name],[Salary],[Gender],D.Department,D.[Total Employee],D.[Total Salary],D.[Avarage Salary],D.[Highest Salary],D.[Lowest Salary] from Employee as Emp Left JOIN 
(Select Department, COUNT(*)as [Total Employee], SUM(Salary) as [Total Salary],AVG(Salary) as [Avarage Salary],
MIN(Salary) as [Lowest Salary], MAX(Salary) as [Highest Salary] from Employee 
GROUP BY Department) as D On Emp.Department=D.Department
GO
---We can make these with OVER and partinoing
SELECT ID, Name, Gender, Salary, Department, 
COUNT(Department) OVER (PARTITION BY Department) as [Department Totals],
SUM(Salary) OVER (PARTITION BY Department) as [Total Salary],
AVG(Salary) OVER (PARTITION BY Department) as [Avarage Salary],
MIN(Salary) OVER (PARTITION BY Department) as [Lowest Salary], 
MAX(Salary) OVER (PARTITION BY Department) as [Highest Salary]
FROM Employee ;
GO
--ROW_NUMBER()
SELECT ID, Name, Gender, Salary, Department, ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Name) as [Row Number]
FROM Employee ;
SELECT ID, Name, Gender, Salary, Department, ROW_NUMBER() OVER ( ORDER BY Name) as [Row Number]
FROM Employee ;

SELECT ID, Name, Gender, Salary, Department, RANK() OVER (PARTITION BY Department ORDER BY Salary) as [Rank]
FROM Employee ;
SELECT ID, Name, Gender, Salary, Department, RANK() OVER ( ORDER BY Salary DESC) as [Rank]
FROM Employee ;
SELECT ID, Name, Gender, Salary, Department, DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary) as [Rank]
FROM Employee ;
SELECT ID, Name, Gender, Salary, Department, DENSE_RANK() OVER (ORDER BY Salary DESC) as [Rank]
FROM Employee ;