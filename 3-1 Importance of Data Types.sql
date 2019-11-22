USE AdventureWorks2016CTP3
GO

SELECT BusinessEntityID, NationalIDNumber, LoginID
FROM HumanResources.Employee
WHERE NationalIDNumber = 112457891
GO
DBCC FREEPROCCACHE
GO

SELECT BusinessEntityID, NationalIDNumber, LoginID
FROM HumanResources.Employee
WHERE NationalIDNumber = '112457891'
go
