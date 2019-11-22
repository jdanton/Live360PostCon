USE AdventureWorks2016CTP3
GO

DECLARE @temp TABLE
    (
        ProductID INT ,
        SalesOrderID INT ,
        SalesOrderDetailID INT ,
        OrderQty SMALLINT ,
        PRIMARY KEY CLUSTERED
        (
            SalesOrderID ,
            SalesOrderDetailID ) ,
        UNIQUE NONCLUSTERED
        (
            ProductID ,
            SalesOrderID ,
            SalesOrderDetailID )
    );

INSERT INTO @temp ( ProductID ,
                    SalesOrderID ,
                    SalesOrderDetailID ,
                    OrderQty )
            SELECT ProductID ,
                   SalesOrderID ,
                   SalesOrderDetailID ,
                   OrderQty
            FROM   Sales.SalesOrderDetail;
SELECT temp.SalesOrderID ,
       temp.SalesOrderDetailID ,
       temp.ProductID ,
       temp.OrderQty
FROM   @temp AS temp
WHERE  temp.SalesOrderID = 43661;
GO