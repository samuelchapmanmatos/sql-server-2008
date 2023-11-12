--开始用一个USE语句来设置会话(session)的数据库上下文,如果会话已经位于需要查询的数据库上下文中,则
--不需要再使用USE语句
USE InsideTSQL2008;

SELECT empid,YEAR(orderdate) AS orderyear,COUNT(*) AS numorders
	FROM Sales.Orders
	WHERE custid = 71
	GROUP BY empid,YEAR(orderdate)
	HAVING COUNT(*) > 1
	ORDER BY empid,orderyear;

--如何修改架构名测试
--USE Test01;
--EXEC sp_changeobjectowner 'dbo.test1','guest';

--简单的查询
SELECT orderid,custid,empid,orderdate,freight 
	FROM Sales.Orders;
	
--WHERE 子句练习
SELECT orderid,empid,orderdate,freight
	FROM Sales.Orders
	WHERE custid = 71;
	
--GROUP BY 子句练习
 SELECT empid,YEAR(orderdate) AS orderyear 
	FROM Sales.Orders
	WHERE custid = 71
	GROUP BY empid,YEAR(orderdate);
--GROUP BY的错误操作	
 SELECT freight,empid,YEAR(orderdate) AS orderyear 
	FROM Sales.Orders
	WHERE custid = 71
	GROUP BY empid,YEAR(orderdate);
	
--GROUP BY 的正确操作
SELECT
	empid,
	YEAR(orderdate) AS orderyear,
	SUM(freight) AS totalfreight,
	COUNT (*) AS numorders
FROM Sales.Orders
WHERE custid = 71
GROUP BY empid,YEAR(orderdate);	

--DISTINCT的使用
SELECT
	empid,
	YEAR(orderdate) AS numcusts,
	COUNT(DISTINCT custid) AS numcusts
FROM Sales.Orders
GROUP BY empid,YEAR(orderdate)

--HAVING 子句练习
SELECT empid,YEAR(orderdate) AS orderyear
FROM Sales.Orders
WHERE custid = 71
GROUP BY empid,YEAR(orderdate)
HAVING COUNT(*) > 1

--ORDER BY 子句练习
SELECT empid,YEAR(orderdate) AS orderyear,COUNT(*) AS numorders
	FROM Sales.Orders
	WHERE custid = 71
	GROUP BY empid,YEAR(orderdate)
	HAVING COUNT(*) > 1
	ORDER BY empid,orderyear;