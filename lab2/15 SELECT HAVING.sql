--15.	���������� SELECT, ��������������� ������ � ������� ����������� GROUP BY 
--�  ����������� HAVING.

-- �������� ������ ��������� ���������, ������� ���� ������� ������ ��� ����� ����� �������
-- ���� ���������

USE [Northwind]
GO

SELECT CategoryID,
	AVG(UnitPrice) AS N'������� ����'
FROM Products
GROUP BY CategoryID
HAVING AVG(UnitPrice)<=
	(SELECT AVG(UnitPrice)-- AS N'������� ���� 2'
	FROM Products
	)
 GO

