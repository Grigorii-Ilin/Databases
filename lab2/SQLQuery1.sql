--1.	Инструкция SELECT, использующая предикат сравнения.

USE [Northwind]
GO

SELECT DISTINCT C1.City, C1.CompanyName
FROM Customers C1 JOIN Customers AS C2 ON C2.City=C1.City
WHERE C2.CustomerID<>C1.CustomerID AND C1.Country=N'Mexico'