USE tempdb;
GO

CREATE TABLE orders
    (
        AccountKey INT NOT NULL ,
        customername NVARCHAR(50) ,
        OrderNumber BIGINT ,
        PurchasePrice DECIMAL(9, 2) ,
        OrderStatus SMALLINT NOT NULL ,
        OrderStatusDesc NVARCHAR(50)
    );

CREATE CLUSTERED INDEX orders_ci
    ON orders ( OrderStatus );

-- insert into the main table load 3 million rows
DECLARE @outerloop INT = 0;
DECLARE @i INT = 0;
DECLARE @purchaseprice DECIMAL(9, 2);
DECLARE @customername NVARCHAR(50);
DECLARE @accountkey INT;
DECLARE @orderstatus SMALLINT;
DECLARE @orderstatusdesc NVARCHAR(50);
DECLARE @ordernumber BIGINT;
WHILE ( @outerloop < 3000000 )
    BEGIN
        SELECT @i = 0;
        BEGIN TRAN;
        WHILE ( @i < 2000 )
            BEGIN
                SET @ordernumber = @outerloop + @i;
                SET @purchaseprice = RAND() * 1000.0;
                SET @accountkey = CONVERT(INT, RAND() * 1000);
                SET @orderstatus = CONVERT(SMALLINT, RAND() * 100);
                IF ( @orderstatus >= 5 )
                    SET @orderstatus = 5;

                SET @orderstatusdesc = CASE @orderstatus
                                            WHEN 0 THEN 'Order Started'
                                            WHEN 1 THEN 'Order Closed'
                                            WHEN 2 THEN 'Order Paid'
                                            WHEN 3 THEN 'Order Fullfillment'
                                            WHEN 4 THEN 'Order Shipped'
                                            WHEN 5 THEN 'Order Received'
                                       END;
                INSERT orders
                VALUES ( @accountkey ,
                         ( CONVERT(VARCHAR(6), @accountkey) + 'firstname' ) ,
                         @ordernumber ,@purchaseprice, @orderstatus ,
                         @orderstatusdesc );

                SET @i += 1;
            END;
        COMMIT;

        SET @outerloop = @outerloop + 2000;
        SET @i = 0;
    END;
GO


--create NCCI
CREATE NONCLUSTERED COLUMNSTORE INDEX orders_ncci
    ON orders
(
    AccountKey ,
    customername ,
    PurchasePrice ,
    OrderStatus ,
    OrderStatusDesc );


--insert additional 200k rows
DECLARE @outerloop INT = 3000000;
DECLARE @i INT = 0;
DECLARE @purchaseprice DECIMAL(9, 2);
DECLARE @customername NVARCHAR(50);
DECLARE @accountkey INT;
DECLARE @orderstatus SMALLINT;
DECLARE @orderstatusdesc NVARCHAR(50);
DECLARE @ordernumber BIGINT;
WHILE ( @outerloop < 3200000 )
    BEGIN
        SELECT @i = 0;
        BEGIN TRAN;
        WHILE ( @i < 2000 )
            BEGIN
                SET @ordernumber = @outerloop + @i;
                SET @purchaseprice = RAND() * 1000.0;
                SET @accountkey = CONVERT(INT, RAND() * 1000);
                SET @orderstatus = CONVERT(SMALLINT, RAND() * 5);
                SET @orderstatusdesc = CASE @orderstatus
                                            WHEN 0 THEN 'Order Started'
                                            WHEN 1 THEN 'Order Closed'
                                            WHEN 2 THEN 'Order Paid'
                                            WHEN 3 THEN 'Order Fullfillment'
                                            WHEN 4 THEN 'Order Shipped'
                                            WHEN 5 THEN 'Order Received'
                                       END;
                INSERT INTO orders 
                VALUES ( @accountkey ,
                         ( CONVERT(VARCHAR(6), @accountkey) + 'firstname' ) ,
                         @ordernumber ,@purchaseprice, @orderstatus ,
                         @orderstatusdesc );
                SET @i += 1;
            END;
        COMMIT;
        SET @outerloop = @outerloop + 2000;
        SET @i = 0;
    END;
GO

GO
--run simple query
SELECT MAX(PurchasePrice)
FROM   orders;

-- run the query without using NCCI
SELECT MAX(PurchasePrice)
FROM orders
option (IGNORE_NONCLUSTERED_COLUMNSTORE_INDEX);

-- a more complex query
SELECT   TOP 5 customername ,
         SUM(PurchasePrice) ,
         AVG(PurchasePrice)
FROM     orders
WHERE    PurchasePrice > 90.0
         AND OrderStatus = 5
GROUP BY customername;

SELECT   TOP 5 customername ,
         SUM(PurchasePrice) ,
         AVG(PurchasePrice)
FROM     orders
WHERE    PurchasePrice > 90.0
         AND OrderStatus = 5
GROUP BY customername
option (IGNORE_NONCLUSTERED_COLUMNSTORE_INDEX);