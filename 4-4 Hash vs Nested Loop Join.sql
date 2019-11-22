SET STATISTICS TIME, IO ON

--Nested Loops Example

SELECT OC.FirstName ,
       OC.LastName ,
       OH.SalesOrderID
FROM   Sales.SalesOrderHeader AS OH
      INNER  JOIN Person.Person AS OC ON OH.CustomerID = OC.BusinessEntityID
WHERE  OC.FirstName LIKE 'John%';

--Force Hash  Example

SELECT OC.FirstName ,
       OC.LastName ,
       OH.SalesOrderID
FROM   Sales.SalesOrderHeader AS OH
      INNER HASH JOIN Person.Person AS OC ON OH.CustomerID = OC.BusinessEntityID
WHERE  OC.FirstName LIKE 'John%';