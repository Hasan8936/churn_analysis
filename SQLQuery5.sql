CREATE VIEW vw_ChurnData AS
SELECT * 
FROM prod_Churnn 
WHERE Customer_Status IN ('Churned', 'Stayed');

GO  -- Separate batch

CREATE VIEW vw_JoinData AS
SELECT * 
FROM prod_Churnn 
WHERE Customer_Status = 'Joined';


