--2.	���������� SELECT, ������������ �������� BETWEEN.

USE [Northwind]
GO

SELECT DISTINCT CustomerID, OrderDate
FROM Orders
WHERE OrderDate BETWEEN '19970101' AND '19971231'
