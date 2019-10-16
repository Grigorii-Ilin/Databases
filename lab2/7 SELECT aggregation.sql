
--7.	Инструкция SELECT, использующая агрегатные функции в выражениях столбцов.

SELECT AVG(TotalPrice) AS 'Default AVG',
	SUM(TotalPrice)/COUNT(OrderID) AS 'Calculated AVG'
FROM
	(SELECT OrderID, SUM(o.UnitPrice*o.Quantity*(1-o.Discount)) AS TotalPrice
	FROM [Northwind].dbo.[Order Details] AS o
	GROUP BY OrderID
	) AS TotOrders
