--19.	���������� UPDATE �� ��������� ����������� � ����������� SET.

USE [Northwind]
GO

UPDATE Products
SET UnitPrice=(
	 SELECT AVG(UnitPrice)
	 FROM [Order Details]
	 WHERE ProductID=32
	)

WHERE ProductID=32
GO