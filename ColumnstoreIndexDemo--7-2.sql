USE AdventureworksDW2016CTP3

SELECT OrderDate, SUM(SalesAmount)
FROM dbo.FactResellerSalesXL_CCI
GROUP BY OrderDate
ORDER BY SUM(SalesAmount) DESC


SELECT OrderDate, SUM(SalesAmount)
FROM dbo.FactResellerSalesXL_PageCompressed
GROUP BY OrderDate
ORDER BY SUM(SalesAmount) DESC

SET STATISTICS TIME ON

SELECT TOP 1 * INTO  FactResellerSalesXL_CCIDemo
FROM dbo.FactResellerSalesXL_CCI

CREATE CLUSTERED COLUMNSTORE INDEX CCI_Demo ON FactResellerSalesXL_CCIDemo 

INSERT INTO FactResellerSalesXL_Heap 
SELECT TOP 1024000 * FROM dbo.FactResellerSalesXL_CCINoIndex


INSERT INTO FactResellerSalesXL_CCIDemo
SELECT TOP 1024000 * FROM dbo.FactResellerSalesXL_CCINoIndex