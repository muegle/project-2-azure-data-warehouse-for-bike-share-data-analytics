IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'udacitysynapse_udacitysynapse_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [udacitysynapse_udacitysynapse_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://udacitysynapse@udacitysynapse.dfs.core.windows.net' 
	)
GO

CREATE EXTERNAL TABLE dbo.staging_trip (
	[TripId] varchar(255),
	[RideableType] varchar(255),
	[StartAt] varchar(50),
	[EndAt] varchar(50),
	[StartStationId] nvarchar(255),
	[EndStationId] nvarchar(255),
	[RiderId] bigint
	)
	WITH (
	LOCATION = 'publictripimportbike.csv',
	DATA_SOURCE = [udacitysynapse_udacitysynapse_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM dbo.staging_trip
GO