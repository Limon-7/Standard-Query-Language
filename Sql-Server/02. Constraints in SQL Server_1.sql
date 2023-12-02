use FastgameonDb
Create Table Student(
Id int constraint s_id Unique,
Name nvarchar(max) not null,
Email nvarchar(10),
City varchar(50) Default'Dhaka',
Constraint e_mail Unique(Email)
)
alter table Student drop constraint s_id
alter table Student drop column Id
alter table Student add Id int identity(1,1)
alter table BranchDetails Drop Constraint city_bc_unique
alter table BranchDetails Add Constraint Uni_Branchcode Unique(Branchcode)
alter table 
CREATE TABLE BranchDetails 
( 
    City           VARCHAR(50), 
    Branchcode     VARCHAR(10), 
    Branchlocation VARCHAR (30), 
    CONSTRAINT city_bc_unique UNIQUE(City, Branchcode) 
)
drop table BranchDetails

CREATE TABLE Customer 
( 
    Cid    INT PRIMARY KEY, 
    Cname  VARCHAR(40), 
    Cmobno CHAR(10) 
)
INSERT INTO Customer VALUES (1, 'AA', '9853977973') 
INSERT INTO Customer VALUES (2, 'BB', '8895558077') 
INSERT INTO Customer VALUES (3, 'CC', '7021801173') 
CREATE TABLE Products 
( 
    Pcode INT PRIMARY KEY, 
    Pname VARCHAR(20), 
    Price MONEY 
) 
INSERT INTO Products VALUES (10,'C',500) 
INSERT INTO Products VALUES (20,'C++',1000) 
INSERT INTO Products VALUES (30,'.NET',3500) 
INSERT INTO Products VALUES (40,'SQL',1800) 

CREATE TABLE Orders 
( 
    Odid     INT PRIMARY KEY, 
    Ordate   DATE, 
    Quantity INT, 
    Cid      INT, 
    Pcode    INT FOREIGN KEY REFERENCES Products(Pcode), 
	FOREIGN KEY (Cid) REFERENCES Customer(Cid),
)
alter table Orders drop constraint PK__Orders__45F069CBB6A6FF8F
alter table Orders drop constraint FK__Orders__Cid__32E0915F
alter table Orders Add Constraint FK_Orders_Cid_Cus_Id Foreign Key (Cid) references Customer(Cid)
alter table Orders Add Constraint pk_orders_odid Primary key (Odid)
INSERT INTO Orders VALUES (101,'2017/12/20',9,1,10) 
INSERT INTO Orders VALUES (102,'2017/12/20',10,2,10) 
INSERT INTO Orders VALUES (103,'2017/12/21',6,3,20) 
INSERT INTO Orders VALUES (104,'2017/12/22',11,1,40) 
INSERT INTO Orders VALUES (105,'2017/12/23',8,1,30) 