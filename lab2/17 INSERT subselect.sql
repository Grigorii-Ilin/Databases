-- 17.	������������� ���������� INSERT, ����������� ������� � ������� 
--��������������� ������ ������ ���������� ����������.

INSERT [Northwind].dbo.[Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discount)
SELECT(
	SELECT MAX(OrderID)
	FROM Northwind.dbo.Orders
	WHERE CustomerID=N'ALFKI'
	) , ProductID, UnitPrice, 11, 0.15
FROM [Northwind].dbo.Products
WHERE ProductName=N'Tofu'
