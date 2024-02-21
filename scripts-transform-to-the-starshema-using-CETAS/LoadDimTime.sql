--Create dim_time table
IF OBJECT_ID('dbo.dim_time') IS NOT NULL
BEGIN
    DROP TABLE dbo.dim_time;
END

CREATE TABLE dim_time (
	[TimeId] [uniqueidentifier] NOT NULL,
	[Date] [varchar](50)  NULL,
    [DayOfWeek] int,
    [DayOfMonth] int,
    [WeekOfYear] int,
	[Quarter] int,
	[Month] int,
	[Year] int
);

-- Add constraint
ALTER TABLE dbo.dim_time add CONSTRAINT PK_dim_time_time_id PRIMARY KEY NONCLUSTERED (TimeId) NOT ENFORCED;

DECLARE @StartDate DATETIME
DECLARE @EndDate DATETIME
SET @StartDate = (SELECT MIN(TRY_CONVERT(datetime, left(StartAt, 19))) FROM staging_trip)
SET @EndDate = DATEADD(year, 5, (SELECT MAX(TRY_CONVERT(datetime, left(StartAt, 19))) FROM staging_trip))

WHILE @StartDate <= @EndDate
    BEGIN
        INSERT INTO dbo.[dim_time]
        SELECT
            NEWID(),
            @StartDate,
            DATEPART(WEEKDAY, @StartDate),
            DATEPART(DAY, @StartDate),
            DATEPART(WEEK, @StartDate),
            DATEPART(QUARTER, @StartDate),
            DATEPART(MONTH, @StartDate),
            DATEPART(YEAR, @StartDate)

        SET @StartDate = DATEADD(day, 1, @StartDate)
    END;


SELECT TOP 10 * FROM [dbo].[dim_time];