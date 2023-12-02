Select Department, COUNT(*) as [NO of Employee],SUM(Salary) as [Total Salary],AVG(Salary) as[Average Salary],MIN(Salary) as[Minimum Salary],MAX(Salary) as [Maximum Salary] From Employee
GROUP BY Department

---without Over partition
Select TOP(7) Name, Salary, Employee.Department, 
  Department.DepartmentTotals,
  Department.TotalSalary, 
  Department.AvgSalary, 
  Department.MinSalary, 
  Department.MaxSalary
  FROM Employee
  INNER JOIN
  (Select Department, COUNT(Department) as DepartmentTotals,SUM(Salary) as [TotalSalary],AVG(Salary) as[AvgSalary],MIN(Salary) as[MinSalary],MAX(Salary) as [MaxSalary] From Employee
GROUP BY Department)as Department ON Department.Department=Employee.Department
--OVER with partition by
Select TOP(100) Name,Salary, Department, 
COUNT(Department)OVER(PARTITION BY Department) as [DEpartment Totals],
SUM(Salary) OVER(PARTITION BY Department) as [Total Salary],
AVG(Salary)OVER(PARTITION BY Department) as[Average Salary],
MIN(Salary) OVER(PARTITION BY Department) as[Minimum Salary],
MAX(Salary) OVER(PARTITION BY Department Order By Name) [Maximum Salary] From Employee

--Row Number
Select Name, Salary,Department, ROW_NUMBER()OVER(PARTITION BY Department Order By Department) as RowNumber From Employee
--Rank
SELECT Name, Department, Salary,
RANK() OVER ( PARTITION BY Department ORDER BY Salary DESC) AS [Rank]
FROM Employee
--Dense_Rank
SELECT Name, Department, Salary,
DENSE_RANK() OVER ( PARTITION BY Department ORDER BY Salary DESC) AS [Rank]
FROM Employee

-- Dense Rank Salary
WITH EmployeeCTE  AS
(
    SELECT Name, Department,Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS DenseRank_Salry
    FROM Employee
)
SELECT TOP 1 Name,Department, Salary FROM EmployeeCTE WHERE DenseRank_Salry = 2