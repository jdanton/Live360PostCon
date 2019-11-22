USE AdventureWorks2016CTP3
SET STATISTICS IO, TIME ON

SELECT City, StateProvinceID, PostalCode
FROM Person.Address
WHERE StateProvinceID = 1;
GO

CREATE INDEX NCI_KeyLookupDemo ON Person.Address (StateProvinceID) 
INCLUDE (AddressID, PostalCode, City)