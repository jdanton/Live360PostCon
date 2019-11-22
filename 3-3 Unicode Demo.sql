CREATE TABLE UniCodeDemoFail
    (
        scity VARCHAR(20)
    );
CREATE TABLE UniCodeDemoProper
    (
        scity NVARCHAR(20)
    );
INSERT INTO UniCodeDemoFail ( scity )
VALUES ( '北京' );

INSERT INTO UniCodeDemoProper ( scity )
VALUES ( N'北京' );

--Data not stored Correctly.
SELECT *
FROM   UniCodeDemoFail;

--Data stored correctly because of unicode column datatype
SELECT *
FROM   UniCodeDemoProper;

