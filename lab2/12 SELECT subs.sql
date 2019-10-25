--12.	���������� SELECT, ������������ ��������� ��������������� ���������� 
--� �������� ����������� ������ � ����������� FROM.

USE [Northwind]
GO

SELECT 'By units' AS '��������', ProductName AS '������ �������' 
FROM Products p JOIN
	(SELECT TOP 1 ProductID, SUM(Quantity) AS SQ
	FROM [Order Details]
	GROUP BY ProductID
	ORDER BY SQ DESC
	) AS od ON od.ProductID=p.ProductID

UNION

SELECT 'By units' AS '��������', ProductName AS '������ �������'
FROM Products p JOIN
	(SELECT TOP 1 ProductID, SUM(UnitPrice*Quantity*(1.0-Discount)) AS SR
	FROM [Order Details]
	GROUP BY ProductID
	ORDER BY SR DESC
	) AS od ON od.ProductID=p.ProductID

GO
