--��ʼ��һ��USE��������ûỰ(session)�����ݿ�������,����Ự�Ѿ�λ����Ҫ��ѯ�����ݿ���������,��
--����Ҫ��ʹ��USE���
USE InsideTSQL2008;

SELECT empid,YEAR(orderdate) AS orderyear,COUNT(*) AS numorders
	FROM Sales.Orders
	WHERE custid = 71
	GROUP BY empid,YEAR(orderdate)
	HAVING COUNT(*) > 1
	ORDER BY empid,orderyear;

--����޸ļܹ�������
--USE Test01;
--EXEC sp_changeobjectowner 'dbo.test1','guest';

--�򵥵Ĳ�ѯ
SELECT orderid,custid,empid,orderdate,freight 
	FROM Sales.Orders;
	
--WHERE �Ӿ���ϰ
SELECT orderid,empid,orderdate,freight
	FROM Sales.Orders
	WHERE custid = 71;
	
--GROUP BY �Ӿ���ϰ
 SELECT empid,YEAR(orderdate) AS orderyear 
	FROM Sales.Orders
	WHERE custid = 71
	GROUP BY empid,YEAR(orderdate);
--GROUP BY�Ĵ������	
 SELECT freight,empid,YEAR(orderdate) AS orderyear 
	FROM Sales.Orders
	WHERE custid = 71
	GROUP BY empid,YEAR(orderdate);
	
--GROUP BY ����ȷ����
SELECT
	empid,
	YEAR(orderdate) AS orderyear,
	SUM(freight) AS totalfreight,
	COUNT (*) AS numorders
FROM Sales.Orders
WHERE custid = 71
GROUP BY empid,YEAR(orderdate);	

--DISTINCT��ʹ��
SELECT
	empid,
	YEAR(orderdate) AS numcusts,
	COUNT(DISTINCT custid) AS numcusts
FROM Sales.Orders
GROUP BY empid,YEAR(orderdate)

--HAVING �Ӿ���ϰ
SELECT empid,YEAR(orderdate) AS orderyear
FROM Sales.Orders
WHERE custid = 71
GROUP BY empid,YEAR(orderdate)
HAVING COUNT(*) > 1

--ORDER BY �Ӿ���ϰ
SELECT empid,YEAR(orderdate) AS orderyear,COUNT(*) AS numorders
	FROM Sales.Orders
	WHERE custid = 71
	GROUP BY empid,YEAR(orderdate)
	HAVING COUNT(*) > 1
	ORDER BY empid,orderyear;