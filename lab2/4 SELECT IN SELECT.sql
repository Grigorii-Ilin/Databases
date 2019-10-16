--4.	���������� SELECT, ������������ �������� IN � ��������� �����������.
-- �������� ������ ������� ��� �������� �� �������, ����������� ����� ���������� 1

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
