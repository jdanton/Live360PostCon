USE AdventureWorks2016CTP3
GO
SET STATISTICS IO, TIME ON

DECLARE @id int 
 
DECLARE CursorDemo CURSOR

LOCAL FAST_FORWARD

FOR
SELECT ProductId
FROM Production.Product
WHERE DaysToManufacture <= 1
 
OPEN CursorDemo 
FETCH NEXT FROM CursorDemo INTO @id
WHILE @@FETCH_STATUS = 0
BEGIN
          SELECT * FROM Production.ProductInventory
          WHERE ProductID=@id
          FETCH NEXT FROM CursorDemo INTO @id
END
CLOSE CursorDemo 
DEALLOCATE CursorDemo


--Non Cursor Example 

SELECT * FROM Production.ProductInventory as pinv
INNER JOIN Production.Product as pp
ON pinv.ProductID=pp.ProductID
WHERE pp.DaysToManufacture <= 1