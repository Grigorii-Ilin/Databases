--18.	������� ���������� UPDATE.

USE [Northwind]
GO

UPDATE Products
SET UnitPrice=UnitPrice*0.98
WHERE ProductID=32
GO