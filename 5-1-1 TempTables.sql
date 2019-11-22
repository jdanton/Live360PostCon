
CREATE TABLE #temp (A INT, B VARCHAR(20))

INSERT INTO #temp (A,B) VALUES (1,'Demo')

CREATE TABLE ##temp (A INT, B VARCHAR(20))

INSERT INTO ##temp (A,B) VALUES (1,'Demo')


SELECT * FROM sys.tables WHERE name LIKE '%#temp%'