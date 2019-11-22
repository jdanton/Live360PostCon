SET STATISTICS TIME, IO ON


SELECT ProductKey ,
       OrderDateKey ,
       DueDateKey ,
       ShipDateKey ,
       ResellerKey ,
       EmployeeKey ,
       PromotionKey ,
       CurrencyKey ,
       SalesTerritoryKey ,
       SalesOrderNumber ,
       SalesOrderLineNumber ,
       RevisionNumber ,
       OrderQuantity ,
       UnitPrice ,
       ExtendedAmount ,
       UnitPriceDiscountPct ,
       DiscountAmount ,
       ProductStandardCost ,
       TotalProductCost ,
       SalesAmount ,
       TaxAmt ,
       Freight ,
       CarrierTrackingNumber ,
       CustomerPONumber ,
       OrderDate ,
       DueDate ,
       ShipDate FROM dbo.FactResellerSalesXL_PageCompressed
WHERE ProductKey BETWEEN 300 AND 305
		AND EmployeeKey = 285
ORDER BY ProductKey

SELECT ProductKey ,
       OrderDateKey ,
       DueDateKey ,
       ShipDateKey ,
       ResellerKey ,
       EmployeeKey ,
       PromotionKey ,
       CurrencyKey ,
       SalesTerritoryKey ,
       SalesOrderNumber ,
       SalesOrderLineNumber ,
       RevisionNumber ,
       OrderQuantity ,
       UnitPrice ,
       ExtendedAmount ,
       UnitPriceDiscountPct ,
       DiscountAmount ,
       ProductStandardCost ,
       TotalProductCost ,
       SalesAmount ,
       TaxAmt ,
       Freight ,
       CarrierTrackingNumber ,
       CustomerPONumber ,
       OrderDate ,
       DueDate ,
       ShipDate FROM dbo.FactResellerSalesXL_Heap
WHERE ProductKey BETWEEN 300 AND 305
		AND EmployeeKey = 285
ORDER BY ProductKey