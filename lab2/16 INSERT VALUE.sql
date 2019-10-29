--16.	ќднострочна€ инструкци€ INSERT, выполн€юща€ вставку в таблицу одной строки значений.

INSERT [Northwind].dbo.Products (ProductName, 
	SupplierID, 
	CategoryID,
	QuantityPerUnit,
	ReorderLevel,
	Discontinued)
VALUES('Eggs',
	  NULL,
	  NULL,
	  '12 Pieces',
	  DEFAULT,
	  DEFAULT)