USE DemoDB

BEGIN TRAN
UPDATE  dbo.TestIsolationLevels
SET     Salary = 25000
WHERE   EmpID = 2900
COMMIT