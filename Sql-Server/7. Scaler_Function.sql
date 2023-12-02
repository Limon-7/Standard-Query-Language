-- Create Table STUDENT
--DROP TABLE Student
CREATE TABLE Student
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  DOB DATETIME
)
INSERT INTO Student(ID, Name, DOB) VALUES(1, 'Limon', '1988-02-29 21:29:16.667')
INSERT INTO Student(ID, Name, DOB) VALUES(2, 'Likhon', '1989-03-27 21:29:16.667')
INSERT INTO Student(ID, Name, DOB) VALUES(3, 'TAREK', '1990-04-15 21:29:16.667')
GO
--create a scaller function

CREATE FUNCTION calcultedAge(
@DOB DATE)
RETURNS INT
AS
BEGIN
	DECLARE @age INT
	SET @age=DATEDIFF(YEAR,@DOB,GETDATE())-
	CASE
		WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE()))
		THEN 1
		ELSE 0
	END
	RETURN @age
END
GO
--calling a scaler function
SELECT dbo.calcultedAge('10/12/1994')
SELECT ID, Name,DOB , dbo.calcultedAge(DOB) as AGE From Student
SELECT ID, Name,DOB , dbo.calcultedAge(DOB) as AGE From Student WHERE dbo.cal_Studen_age(DOB)>=30

GO
--Inline function
CREATE TABLE Department
(
  ID INT PRIMARY KEY,
  DepartmentName VARCHAR(50)
)
GO
-- Populate the Department Table with test data
INSERT INTO Department VALUES(1, 'BCSE'),(2, 'EEE'),(3, 'BHTM')
--create table Teacher for inline table function
CREATE TABLE Teacher
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Gender VARCHAR(50),
  DOB DATETIME,
  DeptID INT FOREIGN KEY REFERENCES Department(ID) 
)
INSERT INTO Teacher VALUES(1, 'Pranaya', 'Male','1996-02-29 10:53:27.060', 1),(2, 'Priyanka', 'Female','1995-05-25 10:53:27.060', 2),(3, 'Anurag', 'Male','1995-04-19 10:53:27.060', 2)
,(4, 'Preety', 'Female','1996-03-17 10:53:27.060', 3),(5, 'Sambit', 'Male','1997-01-15 10:53:27.060', 1),(6, 'Hina', 'Female','1995-07-12 10:53:27.060', 2)
GO

CREATE FUNCTION f_Teacher(
@Id INT
)
RETURNS TABLE
AS
RETURN(SELECT *FROM Teacher where ID=@Id)
GO
--Simple
SELECT *FROM f_Teacher(2)
GO
--Complex use another scaller function
SELECT Name,Gender,dbo.calcultedAge(DOB) as [Date of Birth],Dept.DepartmentName FROM f_Teacher(1) as teacher Join Department as Dept ON Dept.ID=teacher.DeptID
GO
--create multiline function
CREATE FUNCTION MLTF_getTeachers()
RETURNS @t_variable Table(ID INT, Name varchar(50), AGE INT)
AS
BEGIN
INSERT INTO @t_variable SELECT ID,Name,dbo.calcultedAge(DOB) From Teacher
RETURN
END
GO
--calling multiline function
SELECT *FROM MLTF_getTeachers()