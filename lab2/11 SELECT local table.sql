--11.	Создание новой временной локальной таблицы из результирующего набора данных 
--инструкции SELECT. 

USE [Northwind]
GO

SELECT o.ProductID,
	SUM(o.Quantity) AS 'Sum quantity',
	CAST(SUM(o.UnitPrice*o.Quantity*(1.0-o.Discount)) AS money) AS 'Sum money'
INTO BestSells
FROM [Order Details] AS o
WHERE o.ProductID IS NOT NULL
GROUP BY o.ProductID
GO