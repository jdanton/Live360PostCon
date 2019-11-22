USE DemoDB

BEGIN TRAN
INSERT INTO dbo.TestIsolationLevels VALUES (3427, 'Phantom Employee 1', 30000)
COMMIT