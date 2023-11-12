IF DB_ID('testdb') IS NULL
	CREATE DATABASE testdb;
	
--创建表,表名：Employees(empid:雇员ID mgrid:经理ID ssn:社会保险号(social securuty number))
USE testdb;
IF OBJECT_ID('dbo.Employees','U') IS NOT NULL
	DROP TABLE dbo.Employees;
CREATE TABLE dbo.Employees
(
	empid INT NOT NULL,
	firstname VARCHAR(30) NOT NULL,
	lastname VARCHAR(30) NOT NULL,
	hiredate DATE NOT NULL,
	mgrid INT NULL,
	ssn VARCHAR(20) NOT NULL,
	salary MONEY NOT NULL
);

--为表添加主键约束Primary Key Constraints
ALTER TABLE dbo.Employees
	ADD CONSTRAINT PK_Employees
	PRIMARY KEY(empid);
	
--为表添加唯一约束Unique Constraints 添加在ssn列上
ALTER TABLE dbo.Employees
	ADD CONSTRAINT UNQ_Employees_ssn
	UNIQUE(ssn);
	
--添加一个Orders表
IF OBJECT_ID('dbo.Orders','U') IS NOT NULL
	DROP TABLE dbo.Orders;
CREATE TABLE dbo.Orders
(
	orderid	INT			NOT NULL,
	empid	INT			NOT NULL,
	custid	VARCHAR(10) NOT NULL,
	orderts DATETIME	NOT NULL,
	qty		INT			NOT NULL,
	CONSTRAINT PK_Orders
		PRIMARY KEY(orderid)
);
--添加外键约束
ALTER TABLE dbo.Orders
	ADD CONSTRAINT FK_Orders_Employees
	FOREIGN KEY(empid)
	REFERENCES dbo.Employees(empid);

--自己给自己添加外键约束
ALTER TABLE dbo.Employees
	ADD CONSTRAINT FK_Employees_Employees
	FOREIGN KEY(mgrid)
	REFERENCES Employees(empid);
	
--添加检查约束(check)
ALTER TABLE dbo.Employees
	ADD CONSTRAINT CHK_Employees_salary
	CHECK(salary > 0);

--默认设置，由它返回当前的日期和时间值
ALTER TABLE dbo.Orders
	ADD CONSTRAINT DFT_Orders_orderts
	DEFAULT(CURRENT_TIMESTAMP) FOR orderts;