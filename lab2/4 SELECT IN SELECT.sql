--4.	Инструкция SELECT, использующая предикат IN с вложенным подзапросом.
-- Получить список заказов для клиентов из Мадрида, оформленных через сотрудника 1

USE [Northwind]
GO

SELECT OrderID, CustomerID, EmployeeID, OrderDate
FROM Orders
WHERE CustomerID IN
	(
	SELECT CustomerID
	FROM Customers
	WHERE City='Berlin'
	) AND EmployeeID=1
