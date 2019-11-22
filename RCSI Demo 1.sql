--RCSI Demo 1

USE DemoDB

CREATE TABLE DemoTable(
a INT
,b VARCHAR(100)
)
GO

GO
INSERT INTO DemoTable VALUES (1, 'ONE')
GO
INSERT INTO DemoTable VALUES (2, 'TWO')
GO
INSERT INTO DemoTable VALUES (3, 'THREE')
GO

--Perform Update

BEGIN TRAN
UPDATE DemoTable
SET a = 4
WHERE a = 1