--Load Data
SET STATISTICS IO, TIME ON

USE tempdb;
GO
IF OBJECT_ID('tempdb..CursorExample', 'u') IS NOT NULL
    DROP TABLE CursorExample;


GO
CREATE TABLE CursorExample
    (
        id INT IDENTITY(1, 1) PRIMARY KEY CLUSTERED ,
        Col1 INT ,
        Col2 INT ,
        Col3 CHAR(800)
    );
GO
SET NOCOUNT ON;
DECLARE @x INT = 10000;


WHILE @x > 0
    BEGIN


        INSERT INTO CursorExample ( Col1 ,
                                 Col2 ,
                                 Col3 )
                    SELECT 1 ,
                           RAND() * 100 * DATEPART(ms, GETDATE()) ,
                           LEFT(REPLICATE(CAST(NEWID() AS VARCHAR(36)), 30), 800);


        SET @x -= 1;


    END;

--Execute Run with Cursor


DECLARE @Var1 INT ,
        @Var2 INT;
DECLARE DemoCursor CURSOR FAST_FORWARD FOR
    SELECT id
    FROM   CursorExample;
OPEN CursorName;
FETCH NEXT FROM CursorName
INTO @Var1;
WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT CAST(@Var1 AS VARCHAR(5));
        FETCH NEXT FROM CursorName
        INTO @Var1;
    END;
CLOSE CursorName;
DEALLOCATE CursorName;


--While Loop Example

DECLARE @Rows INT ,
        @Id INT;
SELECT @Rows = 1;


SELECT @Id = 0;


WHILE @Rows > 0
    BEGIN


        SELECT   TOP 1 @id = id
        FROM     CursorExample
        WHERE    id >= @Id
        ORDER BY id;
        SET @Rows = @@ROWCOUNT;
        PRINT CAST(@Id AS VARCHAR(5));


        SET @Id += 1;


    END;
