USE DemoDB

SELECT  EmpID, EmpName, EmpSalary
FROM    dbo.TestIsolationLevels WITH (READCOMMITTEDLOCK)
WHERE   EmpID = 2900