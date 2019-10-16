--3.	»нструкци€ SELECT, использующа€ предикат LIKE.
-- ѕолучить список категорий продуктов в описании которых присутствует слово 'drink'

USE [Northwind]
GO

SELECT DISTINCT [CategoryName]
FROM Categories JOIN Products ON Products.CategoryID=Categories.CategoryID
WHERE [Description] LIKE '%drink%'
