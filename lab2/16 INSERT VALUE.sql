--16.	������������ ���������� INSERT, ����������� ������� � ������� ����� ������ ��������.

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