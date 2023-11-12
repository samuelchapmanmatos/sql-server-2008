IF DB_ID('testdb') IS NULL
	CREATE DATABASE testdb;
	
--������,������Employees(empid:��ԱID mgrid:����ID ssn:��ᱣ�պ�(social securuty number))
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

--Ϊ���������Լ��Primary Key Constraints
ALTER TABLE dbo.Employees
	ADD CONSTRAINT PK_Employees
	PRIMARY KEY(empid);
	
--Ϊ�����ΨһԼ��Unique Constraints �����ssn����
ALTER TABLE dbo.Employees
	ADD CONSTRAINT UNQ_Employees_ssn
	UNIQUE(ssn);
	
--���һ��Orders��
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
--������Լ��
ALTER TABLE dbo.Orders
	ADD CONSTRAINT FK_Orders_Employees
	FOREIGN KEY(empid)
	REFERENCES dbo.Employees(empid);

--�Լ����Լ�������Լ��
ALTER TABLE dbo.Employees
	ADD CONSTRAINT FK_Employees_Employees
	FOREIGN KEY(mgrid)
	REFERENCES Employees(empid);
	
--��Ӽ��Լ��(check)
ALTER TABLE dbo.Employees
	ADD CONSTRAINT CHK_Employees_salary
	CHECK(salary > 0);

--Ĭ�����ã��������ص�ǰ�����ں�ʱ��ֵ
ALTER TABLE dbo.Orders
	ADD CONSTRAINT DFT_Orders_orderts
	DEFAULT(CURRENT_TIMESTAMP) FOR orderts;