--5.	���������� SELECT, ������������ �������� EXISTS � ��������� �����������.
-- �������� ������ ���������, ������� ����� ������� �� ���������

USE [Northwind]
GO

SELECT p.ProductID, p.ProductName
FROM Products AS p
WHERE EXISTS
(SELECT Products.ProductID
	FROM Products LEFT OUTER JOIN [Order Details]
		ON Products.ProductID=[Order Details].ProductID
	WHERE [Order Details].ProductID IS NULL)
