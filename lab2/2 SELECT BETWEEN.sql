--2.	Инструкция SELECT, использующая предикат BETWEEN.
-- Получить список клиентов, сделавших заказы между '1997-01-01' и '1997-12-31'

USE [Northwind]
GO

SELECT DISTINCT CustomerID, OrderDate
FROM Orders
WHERE OrderDate BETWEEN '19970101' AND '19971231'
