SELECT AddressLine1, AddressLine2, City, StateProvinceID, PostalCode
FROM Person.Address
WHERE PostalCode BETWEEN '98000' and '99999';
GO

CREATE NONCLUSTERED INDEX IX_Address_PostalCode
ON Person.Address (PostalCode)
INCLUDE (AddressLine1, AddressLine2, City, StateProvinceID);
GO

SELECT Comments
FROM Production.ProductReview 
WHERE ProductID = 937;
GO

/*CREATE NONCLUSTERED INDEX IX_ProductReview_ProductID_ReviewerName
ON Production.ProductReview (ProductID, ReviewerName,Comments);
GO*/

CREATE NONCLUSTERED INDEX IX_ProductReview_ProductID_ReviewerName
ON Production.ProductReview (ProductID, ReviewerName)
INCLUDE (Comments);
GO