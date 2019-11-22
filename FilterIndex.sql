--find SalesOrderDetailIDs with UnitPrice > 2000
SELECT SalesOrderDetailID, UnitPrice
FROM Sales.SalesOrderDetail
WHERE UnitPrice > 2000
GO

--add nonclustered index to UnitPrice column
CREATE NONCLUSTERED INDEX NCI_SalesOrderDetail_UnitPrice
ON Sales.SalesOrderDetail (UnitPrice)
GO

--find SalesOrderDetailIDs with UnitPrice > $2000 - no index
SELECT SalesOrderDetailID, UnitPrice
FROM Sales.SalesOrderDetail
WHERE UnitPrice > 2000
GO
 
--find SalesOrderDetailIDs with UnitPrice > $2000 - using nonclustered index
SELECT SalesOrderDetailID, UnitPrice
FROM Sales.SalesOrderDetail
WHERE UnitPrice > 2000
GO

--add nonclustered filtered index to UnitPrice column
CREATE NONCLUSTERED INDEX fIX_SalesOrderDetail_UnitPrice
ON AdventureWorks2012.Sales.SalesOrderDetail(UnitPrice)
WHERE UnitPrice > 1000
GO


--find SalesOrderDetailIDs with UnitPrice > 2000 - now using nonclustered filtered index
SELECT SalesOrderDetailID, UnitPrice
FROM Sales.SalesOrderDetail
WHERE UnitPrice > 2000
GO
 
