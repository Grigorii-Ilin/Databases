--8.	»нструкци€ SELECT, использующа€ скал€рные подзапросы в выражени€х столбцов.


SELECT p.ProductID,
	p.UnitPrice,

	(SELECT AVG(od.UnitPrice)
	FROM  [Northwind].dbo.[Order Details] AS od
	WHERE od.ProductID=p.ProductID
	) AS AvgPrice,

	(SELECT MIN(od.UnitPrice)
	FROM  [Northwind].dbo.[Order Details] AS od
	WHERE od.ProductID=p.ProductID
	) AS MinPrice,

	p.ProductName

FROM [Northwind].[dbo].[Products] AS p
WHERE p.CategoryID=6

