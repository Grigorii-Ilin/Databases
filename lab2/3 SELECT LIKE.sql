--3.	Инструкция SELECT, использующая предикат LIKE.
USE [Northwind]
GO

SELECT DISTINCT [CategoryName]
FROM Categories JOIN Products ON Products.CategoryID=Categories.CategoryID
WHERE [Description] LIKE '%drink%'
