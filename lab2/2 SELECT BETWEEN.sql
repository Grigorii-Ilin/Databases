--2.	���������� SELECT, ������������ �������� BETWEEN.
-- �������� ������ ��������, ��������� ������ ����� '1997-01-01' � '1997-12-31'

USE [Northwind]
GO

SELECT DISTINCT CustomerID, OrderDate
FROM Orders
WHERE OrderDate BETWEEN '19970101' AND '19971231'
