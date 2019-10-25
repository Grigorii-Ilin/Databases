--9.	Инструкция SELECT, использующая простое выражение CASE.

USE [Northwind]
GO

SELECT CompanyName, OrderID,
	CASE YEAR(OrderDate)
		WHEN YEAR(GETDATE())-21 THEN '21 y. ago'
		WHEN YEAR(GETDATE())-22 THEN '22 y. ago'
		ELSE CAST(DATEDIFF(year, OrderDate, GETDATE()) AS varchar(6))+' years ago'
	END AS 'When'
FROM Orders JOIN Customers ON Orders.CustomerID=Customers.CustomerID 
GO