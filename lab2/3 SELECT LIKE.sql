--3.	���������� SELECT, ������������ �������� LIKE.
-- �������� ������ ��������� ��������� � �������� ������� ������������ ����� 'drink'

USE [Northwind]
GO

SELECT DISTINCT [CategoryName]
FROM Categories JOIN Products ON Products.CategoryID=Categories.CategoryID
WHERE [Description] LIKE '%drink%'
