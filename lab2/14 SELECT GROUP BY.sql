--14.	���������� SELECT, ��������������� ������ � ������� ����������� GROUP BY, �� ��� ����������� HAVING.

-- ��� ������� ����������� �������� ��������� 2 �������� ��� ����, ������� ����,
-- ������������ ���� � �������� ��������

USE [Northwind]
GO

SELECT p.ProductID, 
	p.UnitPrice, 
	p.ProductName,
	AVG(od.UnitPrice) AS AvgPrice,
	MAX(od.UnitPrice) AS MaxPrice
FROM Products p LEFT OUTER JOIN [Order Details] od ON p.ProductID=od.ProductID
WHERE CategoryID=2
--GROUP BY p.ProductID, p.UnitPrice, p.ProductName

GO
