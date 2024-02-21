IF OBJECT_ID('dbo.dim_rider') IS NOT NULL
BEGIN
    DROP TABLE dbo.dim_rider
END
-- Create dim_rider table
CREATE TABLE dbo.dim_rider 
WITH
( 
	DISTRIBUTION = REPLICATE, 
	CLUSTERED COLUMNSTORE INDEX
)
AS
SELECT 
    [RiderId],
    [Address],
    [FirstName],
    [LastName],
    [birthday],
    [StartDate],
    [EndDate],
    [IsMember]
FROM staging_rider;

-- Verify the output
SELECT TOP 10 * FROM dbo.dim_rider;
