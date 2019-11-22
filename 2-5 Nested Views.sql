USE AdventureWorks2016CTP3
GO


CREATE OR ALTER VIEW vSalesOrderDetail AS
SELECT
    soh.SalesOrderID,
    soh.OrderDate,
    soh.DueDate,
    soh.Status,
    st.Name as SalesTerritory,
    cc.CardType,
    cc.CardNumber,
    soh.SubTotal,
    soh.TotalDue,
    sod.SalesOrderDetailID,
    sod.OrderQty,
    sod.UnitPrice,
    sod.LineTotal
FROM
    Sales.SalesOrderHeader soh
    INNER JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
    INNER JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
    INNER JOIN Sales.CreditCard cc ON soh.CreditCardID = cc.CreditCardID;

	GO

--Execute Filtered Query against view 

	SELECT SalesOrderID, SalesOrderDetailID, LineTotal
	FROM
    vSalesOrderDetail WHERE SalesOrderID IN (43659,43662,43670)

	SELECT soh.SalesOrderID, sod.SalesOrderDetailID, sod.LineTotal
	FROM
    Sales.SalesOrderHeader soh
    INNER JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
	WHERE sod.SalesOrderID IN (43659,43662,43670)

GO
--Nesting the View

CREATE VIEW vSalesEmail AS
SELECT
    v.SalesOrderID,
    v.SalesOrderDetailID,
    v.LineTotal,
    be.BusinessEntityID,
    p.FirstName,
    p.LastName,
    e.EmailAddress
FROM
    vSalesOrderDetail v
    LEFT OUTER JOIN Sales.SalesOrderHeader soh ON v.SalesOrderID = soh.SalesOrderID
    LEFT OUTER JOIN Sales.SalesPerson sp ON soh.SalesPersonID = sp.BusinessEntityID
    LEFT OUTER JOIN Person.BusinessEntity be ON sp.BusinessEntityID = be.BusinessEntityID
    LEFT OUTER JOIN Person.Person p ON p.BusinessEntityID = be.BusinessEntityID
    LEFT OUTER JOIN Person.EmailAddress e ON e.BusinessEntityID = p.BusinessEntityID;

--Query Example with highly nested view

SELECT
    v.SalesOrderID,
    soh.AccountNumber,
    v.SalesOrderDetailID,
    v.LineTotal,
    sp.CommissionPct,
    v.BusinessEntityID
FROM
    vSalesEmail v
    INNER JOIN Sales.SalesPerson sp ON v.BusinessEntityID = sp.BusinessEntityID
    INNER JOIN Sales.SalesOrderHeader soh ON soh.SalesOrderID = v.SalesOrderID
WHERE
    v.SalesOrderID IN (43659,43662,43670);
