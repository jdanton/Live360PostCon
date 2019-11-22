USE AdventureWorks2016CTP3
GO
SET STATISTICS IO, TIME ON

SELECT [p].[Name] ,
       [p].[ProductNumber] ,
       [ph].[ListPrice]
FROM   [Production].[Product] p
       INNER JOIN [Production].[ProductListPriceHistory] ph ON [p].[ProductID] = ph.[ProductID]
                        AND ph.[StartDate] = (   SELECT   TOP ( 1 ) [ph2].[StartDate]
                                                 FROM     [Production].[ProductListPriceHistory] ph2
                                                 WHERE    [ph2].[ProductID] = [p].[ProductID]
                                                 ORDER BY [ph2].[StartDate] DESC );