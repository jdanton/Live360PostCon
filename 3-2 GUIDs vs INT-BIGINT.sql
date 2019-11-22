USE tempdb

CREATE TABLE #GuidDemo (ID UNIQUEIDENTIFIER, Value VARCHAR(20))
GO

DECLARE @i INT = 0
WHILE @i < 1000000
BEGIN
INSERT INTO #GuidDemo (ID, Value) VALUES (NEWID(), 'SampleValue')
SET @i = @i+1
END


CREATE TABLE #IDDemo (ID INT IDENTITY, Value VARCHAR(20))
GO

DECLARE @i INT = 0
WHILE @i < 1000000
BEGIN
INSERT INTO #IDDemo (Value) VALUES ('SampleValue')
SET @i = @i+1
END
GO


EXEC sp_spaceused N'dbo.#GUIDDemo';  
GO 
EXEC sp_spaceused N'dbo.#IDDemo';  
GO 