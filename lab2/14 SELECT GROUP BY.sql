--14.	Инструкция SELECT, консолидирующая данные с помощью предложения GROUP BY, но без предложения HAVING.

-- Для каждого заказанного продукта категории 2 получить его цену, среднюю цену,
-- максимальную цену и название продукта

USE [Northwind]
GO

SELECT p.ProductID, 
	p.UnitPrice, 
	p.ProductName,
	AVG(od.UnitPrice) AS AvgPrice,
	MAX(od.UnitPrice) AS MaxPrice
FROM Products p LEFT OUTER JOIN [Order Details] od ON p.ProductID=od.ProductID
WHERE CategoryID=2
--GROUP BY p.ProductID, p.UnitPrice, p.ProductName

GO
