--Create fact_trip table
IF OBJECT_ID('dbo.fact_trip') IS NOT NULL
BEGIN
    DROP TABLE dbo.fact_trip;
END

CREATE TABLE dbo.fact_trip 
WITH
( 
	DISTRIBUTION = HASH(trip_id), 
	CLUSTERED COLUMNSTORE INDEX
)
AS
SELECT 
    st.TripId,
    st.RiderId,
    st.StartStationId, 
    st.EndStationId, 
    st.StartAt AS StartTimeId,    
    st.EndAt AS EndTimeId,
    st.RideableType,
    DATEDIFF(hour, st.StartAt, st.EndAt) AS Duration,
    DATEDIFF(year, sr.birthday, st.StartAt) AS RiderAge
FROM 
    staging_trip st
JOIN staging_rider sr ON sr.RiderId = st.RiderId;

SELECT TOP 10 * FROM dbo.fact_trip;