DROP TABLE IF EXISTS dbo.prod_Churn;

SELECT *
INTO dbo.prod_Churn
FROM dbo.stg_Churn;
SELECT TOP 10 Gender FROM dbo.stg_Churn;
DROP TABLE IF EXISTS dbo.prod_Churn;

SELECT *
INTO dbo.prod_Churn
FROM dbo.stg_Churn;
SELECT TOP 10 Gender FROM dbo.prod_Churn;




