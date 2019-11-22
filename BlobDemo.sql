IF OBJECT_id('FileStorageDemo') IS NOT NULL
                BEGIN DROP TABLE FileStorageDemo END
GO
CREATE TABLE FileStorageDemo (theFile VARBINARY(max))
go
 
INSERT FileStorageDemo (theFile)
SELECT *
FROM OPENROWSET(BULK 'C:\Users\john\Desktop\Capture.PNG', SINGLE_BLOB) AS x
 
SELECT * FROM FileStorageDemo
 
 
DBCC IND('Scratch', 'FileStorageDemo', 1)
GO
 
-- Let's find how this is stored.
-- Start with the Data page
-- Move to the start of the blob storage
DBCC TRACEON (3604)
GO
DBCC PAGE('Scratch', 1, 353, 3)
GO
DBCC TRACEOFF (3604)
GO
 