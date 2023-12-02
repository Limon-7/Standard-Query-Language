---SCALER FUNCTIONS
/*
 CREATE FUNCTION fun_NAME(
	@variable1 DATATYPE,
	@variable2 DATATYPE,
	@variable3 DATATYPE,
 )
 RETURNS <RETURN Attribute DATATYPE>
 AS
 BEGIN
	--FUNCTION BODY
	RETURN<RETURN DATATYPE>
END
---CALLING THE FUNCTION
SELECT dbo.<FUNCTION_NAME>(VALUE)

ALTER FUNCTION fun_ADD(@num1 INT,@num2 INT,@num3 INT)
RETURNs INT
AS
BEGIN
RETURN(@num1+@num2+@num3)
END

SELECT dbo.fun_ADD(10,20,20)

sp_helptext fun_ADD

*/
--INLINE TABLE FUNCTION
CREATE FUNCTION func_Name(@variable1 datatype)
RETURNS TABLE
AS
RETURN(query)
---calling function
SELECT *FROM func_Name(parameter)

Alter FUNCTION func_INLINE(@Salary INT)
RETURNS TABLE
AS
RETURN (SELECT e.ID,e.Name,e.EmailID,e.DepartmentID,g.Gender as Gender, e.Salary,e.Age,e.CITY FROM Employee as e
		JOIN GENDER as g on e.GenderID=g.ID where e.Salary>@Salary)

SELECT Name, EmailId as Email, DepartmentName as Department,Salary, Gender FROM func_INLINE(26500) Emp JOIN Department Dept on Dept.ID = Emp.DepartmentID


--MULTI line function
ALTER FUNCTION func_MULTI()
RETURNS @Table  TABLE(ID INT,Name varchar(30),Salary INT)
AS
BEGIN
	INSERT INTO @Table SELECT ID, Name, Salary FROM Employee
	RETURN
END
SELECT *FROM func_MULTI()

