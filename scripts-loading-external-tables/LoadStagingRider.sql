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

CREATE EXTERNAL TABLE dbo.staging_rider (
	[RiderId] bigint,
	[FirstName] varchar(255),
	[LastName] varchar(255),
	[Address] varchar(255),
	[birthday] varchar(50),
	[StartDate] varchar(50),
	[EndDate] varchar(50),
	[IsMember] bit
	)
	WITH (
	LOCATION = 'publicriderimportbike.csv',
	DATA_SOURCE = [udacitysynapse_udacitysynapse_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM dbo.staging_rider
GO