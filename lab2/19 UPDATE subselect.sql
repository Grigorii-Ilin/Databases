--19.	»нструкци€ UPDATE со скал€рным подзапросом в предложении SET.

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