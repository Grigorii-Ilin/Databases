--15.	Инструкция SELECT, консолидирующая данные с помощью предложения GROUP BY 
--и  предложения HAVING.

-- Получить список категорий продуктов, средняя цена которых МЕНЬШЕ ИЛИ РАВНА общей средней
-- цены продуктов

USE [Northwind]
GO

SELECT CategoryID,
	AVG(UnitPrice) AS N'Средняя цена'
FROM Products
GROUP BY CategoryID
HAVING AVG(UnitPrice)<=
	(SELECT AVG(UnitPrice)-- AS N'Средняя цена 2'
	FROM Products
	)
 GO

