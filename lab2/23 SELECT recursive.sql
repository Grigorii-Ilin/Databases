--23.	���������� SELECT, ������������ ����������� ���������� ��������� ���������.
DROP TABLE dbo.[My Employees];
GO

CREATE TABLE dbo.[My Employees](
	EmployeeID smallint NOT NULL,
	FirstName nvarchar(30) NOT NULL,
	LastName nvarchar(40) NOT NULL,
	Title nvarchar(45) NOT NULL,
	DeptID smallint NOT NULL,
	ManagedID int NULL,
	CONSTRAINT PK_EmployeeID PRIMARY KEY CLUSTERED (EmployeeID ASC)
	)
GO

INSERT INTO dbo.[My Employees] 
VALUES (10, N'����', N'������', N'�����������',1,NULL) ,
	(20, N'����', N'������', N'��� �� ��������',2,10) ,
	(30, N'�����', N'�������', N'��� �� ������������',3,10) ,
	(40, N'������������', N'����������', N'���������',2,20) ,
	(50, N'������', N'��������', N'��������� ���� 1',16,30) ,
	(60, N'�������', N'���������', N'��������� ���� 2',17,30) ;
GO

WITH DirectReports (ManagedID, EmployeeID, Title, DeptID, lvl)
AS(
	SELECT e.ManagedID, e.EmployeeID, e.Title, e.DeptID, 0 AS lvl
	FROM dbo.[My Employees] AS e	
	WHERE ManagedID IS NULL

	UNION ALL

	SELECT e.ManagedID, e.EmployeeID, e.Title, e.DeptID, lvl+1
	FROM dbo.[My Employees] AS e INNER JOIN DirectReports AS dr ON e.ManagedID=dr.EmployeeID
	)
SELECT ManagedID, EmployeeID, Title, DeptID, lvl
FROM DirectReports

GO



