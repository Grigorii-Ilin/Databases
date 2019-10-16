
--6.	»нструкци€ SELECT, использующа€ предикат сравнени€ с квантором.
-- ѕолучить список продуктов, цена которых больше цены любого продукта категории 4
SELECT p.ProductID, p.ProductName, p.UnitPrice
FROM [Northwind].dbo.Products AS p
WHERE P.UnitPrice>ALL
	(SELECT p4.UnitPrice
	FROM [Northwind].dbo.Products AS p4
	WHERE p4.CategoryID=4
	)
