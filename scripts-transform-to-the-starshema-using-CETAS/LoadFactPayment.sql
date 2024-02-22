--Create dim_payment table
IF OBJECT_ID('dbo.fact_payment') IS NOT NULL
BEGIN
    DROP TABLE dbo.fact_payment;
END

CREATE TABLE dbo.fact_payment WITH
( 
	DISTRIBUTION = REPLICATE, 
	CLUSTERED COLUMNSTORE INDEX
)
AS
SELECT
    [PaymentId],    
    [AccountNumber] AS RiderId,
	[Amount],
    [PaymentDate]
FROM 
	staging_payment;

SELECT TOP 10 * FROM [dbo].[fact_payment];