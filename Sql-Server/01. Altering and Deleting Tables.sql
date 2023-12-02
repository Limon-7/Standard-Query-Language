create database limondb
alter database limondb modify Name=FastgameonDb
Execute sp_renamedb "limonDb","newDatabaseName"
drop database databsename

Use FastgameonDb
--drop a column
alter table student Drop column FullName
--create a column in existing table 
alter Table student Add FullName varchar(50) not null
--null to not null
ALTER TABLE Student ALTER COLUMN Id INT not NULL 
--  not null to null
ALTER TABLE Student ALTER COLUMN Id INT NULL 
-- alter column type
alter table Student alter Column Name varchar(max)
--store procedure
Execute sp_renamedb "limonDb","newDatabaseName"
-- rename a column name
Execute sp_rename "Student.Name","FullName"
Execute sp_rename "Student","StudentTable"
Create table Student (
Id int,
Name varchar(20),
Salary decimal(6,2)
)



