--3.	���������� SELECT, ������������ �������� LIKE.
USE [Northwind]
GO

SELECT DISTINCT [CategoryName]
FROM Categories JOIN Products ON Products.CategoryID=Categories.CategoryID
WHERE [Description] LIKE '%drink%'
