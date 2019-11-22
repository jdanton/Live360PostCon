USE WideWorldImporters
GO
SET STATISTICS IO, TIME ON
GO
SELECT TOP 5000 *
FROM [Sales].[InvoiceLines] po
JOIN [Sales].[OrderLines] pl
ON po.[StockItemID] = pl.[StockItemID]

--Create UserDefinedFunction
GO
CREATE FUNCTION dbo.fn_Quantity (@StockItemID INT)
RETURNS INT
AS
BEGIN
        DECLARE @Quantity INT

        SELECT @Quantity = SUM(Quantity)
        FROM Warehouse.StockItemTransactions
        WHERE StockItemID = @StockItemID

        RETURN (@Quantity)
END
GO
--Run Query Referencing UDF

SELECT TOP 5000 *, dbo.fn_Quantity (po.StockItemID) Quantity
FROM [Sales].[InvoiceLines] po
JOIN [Sales].[OrderLines] pl
ON po.[StockItemID] = pl.[StockItemID]

--Notes--You'll notice there's no parallelism in the plan
--The Scalar UDF is also processed row by row