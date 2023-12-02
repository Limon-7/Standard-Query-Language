---Create a procedure
--Get all employee
CREATE PROCEDURE getALLEmployee
	---procedure header
AS
BEGIN
	---Procedure body
	SELECT *FROM Employee
END
--calling procedure
EXECUTE getALLEmployee

Go
--get procedure text
sp_helptext getALLEmployee 
GO

--INPUT 
--CREATE
CREATE PROCEDURE AddNumbers(@num1 INT, @Num2 INT)
AS
BEGIN
	declare @result INT
	SET @result = @num1+@num2
	print('Result is '+ CAST(@result as VARCHAR))
END
--calling AddNumbers Procedure
EXECUTE AddNumbers 15,20
EXECUTE AddNumbers @num1=10,@num2=15
DECLARE @No1 INT,@No2 INT
SET @No1=15
SET @No2=30
EXECUTE AddNumbers @No1, @No2
GO
--Get EMPLOYEE By condition
CREATE PROCEDURE getEmployeeBYGenderDEPARTMENT
(
	@Gender varchar(20),
	@Department varchar(20)
)
AS
BEGIN
SELECT *FROM Employee WHERE Gender=@Gender AND Department=@Department
END

DECLARE @gen varchar(20),@dept varchar(30)
SET @gen='FeMale' SET @dept='IT'
EXECUTE getEmployeeBYGenderDEPARTMENT @gen,@dept

Go
--Update employee
CREATE PROCEDURE updateEmployee(
@ID INT,@Name varchar(50),@EmailID varchar(50),@Gender varchar(50),@City varchar(50)
)
AS
BEGIN
	UPDATE Employee SET Name=@Name, EmailID=@EmailID,Gender=@Gender,CITY=@City WHERE ID=@ID
END
--calling store procedure
EXEC updateEmployee 1,'limon','','Male','Dhaka'

GO
Create PROC upDateRange(
@Salary INT, @range1 INT, @range2 INT,@city varchar(50)
)
AS
BEGIN
	UPDATE Employee SET Salary=@Salary,CITY=@city where ID BETWEEN @range1 AND @range2
END

EXEC upDateRange 20000,2,5,'Dhanmondi'

GO
--output example
CREATE PROC sp_output(
@gender varchar(20), @TotalSalary INT OUTPUT,@maxsalary INT OUTPUT,@Totalemployee INT OUTPUT
)
as
begin
SELECT @Totalemployee=COUNT(*), @TotalSalary=SUM(Salary),@maxsalary=MAX(Salary) from Employee Where Gender=@gender
end
GO
DECLARE @TotalSalary INT DECLARE @maxsalary INT DECLARE @Totalemployee INT
EXEC sp_output 'Male',@TotalSalary OUT,@maxsalary OUT,@Totalemployee OUTPUT
if(@TotalSalary & @maxsalary &@Totalemployee IS NULL)
	print('Not found')
Else
	Print('Total Employee:'+ CAST(@Totalemployee as varchar)+'P  ' +'Total Salary:'+ CAST(@TotalSalary as varchar)+'k  ' +'Highest Salary:'+ CAST(@maxsalary as varchar)+'K')
	--Print(@TotalSalary)
	--print(@maxsalary)
GO
--RETURN TYPE
CREATE PROC sp_input(
@gender varchar(20)
)
as
begin
RETURN (SELECT SUM(Salary)AS TotalSalary from Employee Where Gender=@gender)
end
GO
DECLARE @Salary INT
EXEC @Salary=sp_input 'Male'
print(@Salary)
