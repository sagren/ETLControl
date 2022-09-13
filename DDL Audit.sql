
/*
create database ETLManage
go

*/

use ETLManage
go

/*
create schema ETLControl
go



*/

create schema DDLEventAudit
go


create schema DWObjects
go


/*

 DDL Event Audit table is populated by database triggers that record DDL events.
 That is, each time a procedure, function or view is created, dropped or altered
 a row is created in this table recording the code that was executed.
 
*/
CREATE TABLE DDLEventAudit.DDLEvent(
	[EventDate] [datetime] NOT NULL,
	[EventType] [nvarchar](64) NULL,
	[EventDDL] [nvarchar](max) NULL,
	[EventXML] [xml] NULL,
	[DatabaseName] [nvarchar](255) NULL,
	[SchemaName] [nvarchar](255) NULL,
	[ObjectName] [nvarchar](255) NULL,
	[HostName] [varchar](64) NULL,
	[IPAddress] [varchar](32) NULL,
	[ProgramName] [nvarchar](255) NULL,
	[LoginName] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/* Ad hoc table created to record database sizes - growth */
CREATE TABLE DWObjects.DatabaseSize
(
	DatabaseName [nvarchar](128) not null,
	SizeMB [int] NULL,
	LoadDate [datetime] NOT NULL
) ON DWObjects

alter table DWOBjects.DatabaseSize
add constraint PK_DBSize
primary key(DatabaseName, LoadDate)


/* 

	List of all tables in the BI environment

*/

drop table DWObjects.DWColumn
go

CREATE TABLE DWObjects.DWColumn(
	DWColumnKey [int] IDENTITY(1,1) NOT NULL,
	DWObjectKey [int] NOT NULL,
	ColumnSequence [int] NULL,
	ColumnPhysicalName [varchar](150) NULL,
	DataType [varchar](50) NULL,
	DataLength [varchar](50) NULL,
	DataPrecision [varchar](50) NULL,
	DataScale [varchar](50) NULL,
	Nullable [varchar](5) NULL,
	ColumnStatus [varchar](10) NULL,
	DateTimeLastModified [datetime] NULL,
	OSUserLastModified [varchar](50) NULL,
	LoginUserLastModified [varchar](50) NULL,
	IsUniqueKey [bit] NULL,
	IsRowChangeDate [bit] NULL,
	IsAudited [bit] NULL,
	IsUsed [bit] NULL,
	SeverityColumnAddKey [int] NULL,
	SeverityColumnDropKey [int] NULL,
	SeverityColumnChangeKey [int] NULL
 CONSTRAINT [PK_DW_COLUMN] PRIMARY KEY CLUSTERED 
(
	DWColumnKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON DWObjects
) ON DWObjects




CREATE TABLE DWObjects.DWDatabase(
	DWDatabaseKey [int] IDENTITY(1,1) NOT NULL,
	DWDatabaseTypeKey [int] NOT NULL,
	DatabaseName [varchar](50) NOT NULL,
	ConnectionString [varchar](400) NULL,
	QueryLoginUser [varchar](50) NULL,
	QueryLoginName [varbinary](128) NULL,
	DateTimeLastModified [datetime] NULL,
	OSUserLastModified [varchar](50) NULL,
	LoginUserLastModified [varchar](50) NULL,
 CONSTRAINT [PK_DW_DATABASE] PRIMARY KEY CLUSTERED 
(
	DWDatabaseKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON DWObjects
) ON DWObjects




CREATE TABLE DWObjects.DWDatabaseType(
	DWDatabaseTypeID [int] IDENTITY(1,1) NOT NULL,
	DatabaseType [varchar](50) NOT NULL,
	DateTimeLastModified [datetime] NULL,
	OSUserLastModified [varchar](50) NULL,
	LoginUserLastModified [varchar](50) NULL,
 CONSTRAINT [PK_DW_DATABASE_TYPE] PRIMARY KEY CLUSTERED 
(
	DWDatabaseTypeID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON DWObjects
) ON DWObjects



CREATE TABLE DWObjects.DWObject(
	DWObjectID [int] IDENTITY(1,1) NOT NULL,
	DWSchemaID [int] NOT NULL,
	ObjectPhysicalName [varchar](150) NOT NULL,
	ObjectStatus [varchar](10) NULL,
	DateTimeLastModified [datetime] NULL,
	OSUserLastModified [varchar](50) NULL,
	LoginUserLastModified [varchar](50) NULL,

	IsExtracted [bit] NULL,
	InitialLoadDate [datetime] NULL,
	ExtractMethod [varchar](20) NULL,
	SeverityObjectDropKey [int] NULL,
	SeverityObjectTruncateKey [int] NULL
 CONSTRAINT [PK_DW_OBJECT] PRIMARY KEY CLUSTERED 
(
	DWObjectID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON DWObjects
) ON DWObjects

GO


SET ANSI_PADDING OFF
GO
/****** Object:  Table [DW_OBJECTS].[DW_SCHEMA]    Script Date: 17/06/2013 14:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE DWObjects.DWSchema(
	DWSchemaID [int] IDENTITY(1,1) NOT NULL,
	DWDatabaseID [int] NOT NULL,
	DWSchemaPhysicalName [varchar](50) NOT NULL,
	DateTimeLastModified [datetime] NULL,
	OSUserLastModified [varchar](50) NULL,
	LoginUserLastModified [varchar](50) NULL,
 CONSTRAINT [PK_DW_SCHEMA] PRIMARY KEY CLUSTERED 
(
	DWSchemaID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON DWObjects
) ON DWObjects

GO

CREATE TABLE DWObjects.ExternalDataSourceType(
	ExternalDataSourceTypeID [int] IDENTITY(1,1) NOT NULL,
	DateTimeLastModified [datetime] NULL,
	OSUserLastModified [varchar](50) NULL,
	LoginUserLastModified [varchar](50) NULL,
 CONSTRAINT [PK_EXT_DATA_SOURCE_TYPE] PRIMARY KEY CLUSTERED 
(
	ExternalDataSourceTypeID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DW_OBJECTS]
) ON [DW_OBJECTS]

GO


CREATE TABLE DWObjects.ExternalDataSpource(
	ExternalDataSourceID [int] IDENTITY(1,1) NOT NULL,
	ExternalDataSource [varchar](50) NULL,
	FilePath [varchar](50) NULL,
	ConnectionString [varchar](50) NULL,

	ExternalDataSourceTypeID [int] NULL,
	DWDatabaseID [int] NOT NULL,
	DWObjectID [int] NULL,
	IsEnabled [bit] NULL,
	DateTimeLastModified [datetime] NULL,
	OSUserLastModified [varchar](50) NULL,
	LoginUserLastModified [varchar](50) NULL,
 CONSTRAINT [PK_EXTERNAL_DATA_SOURCE] PRIMARY KEY CLUSTERED 
(
	ExternalDataSourceID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON DWObjects
) ON DWObjects

GO


/*

CREATE TABLE SourceMetaData.SourceColumnList(
	[OWNER] [varchar](30) NULL,
	[TABLE_NAME] [varchar](30) NULL,
	[SAMPLE_SIZE] [varchar](38) NULL,
	[GLOBAL_STATS] [varchar](38) NULL,
	[USER_STATS] [varchar](3) NULL,
	[COLUMN_NAME] [varchar](30) NULL,
	[DATA_TYPE] [varchar](106) NULL,
	[DATA_TYPE_MOD] [varchar](3) NULL,
	[DATA_TYPE_OWNER] [varchar](30) NULL,
	[DATA_LENGTH] [varchar](38) NULL,
	[DATA_PRECISION] [varchar](38) NULL,
	[DATA_SCALE] [varchar](38) NULL,
	[NULLABLE] [varchar](1) NULL,
	[COLUMN_ID] [varchar](38) NULL,
	[DEFAULT_LENGTH] [varchar](38) NULL,
	[NUM_DISTINCT] [varchar](38) NULL,
	[LOW_VALUE] [varchar](32) NULL,
	[HIGH_VALUE] [varchar](32) NULL,
	[DENSITY] [varchar](38) NULL,
	[NUM_NULLS] [varchar](38) NULL,
	[NUM_BUCKETS] [varchar](38) NULL,
	[CHARACTER_SET_NAME] [varchar](44) NULL,
	[CHAR_COL_DECL_LENGTH] [varchar](38) NULL,
	[AVG_COL_LEN] [varchar](38) NULL,
	[CHAR_LENGTH] [varchar](38) NULL,
	[CHAR_USED] [varchar](1) NULL,
	[V80_FMT_IMAGE] [varchar](3) NULL,
	[DATA_UPGRADED] [varchar](3) NULL,
	[HIDDEN_COLUMN] [varchar](3) NULL,
	[VIRTUAL_COLUMN] [varchar](3) NULL,
	[SEGMENT_COLUMN_ID] [varchar](38) NULL,
	[INTERNAL_COLUMN_ID] [varchar](38) NULL,
	[HISTOGRAM] [varchar](15) NULL,
	[ETL_LOAD_ID] [int] NULL
) ON [SOURCE_METADATA]
SET ANSI_PADDING ON
ALTER TABLE [SOURCE_METADATA].[SOURCE_COLUMN_LIST] ADD [DATABASE_NAME] [varchar](20) NULL

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [SOURCE_METADATA].[SOURCE_DATABASE_LIST]    Script Date: 17/06/2013 14:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [SOURCE_METADATA].[SOURCE_DATABASE_LIST](
	[SOURCE_NAME] [varchar](20) NULL,
	[CONNECTION_STRING] [varchar](255) NOT NULL,
	[LOGIN_NAME] [varchar](50) NULL,
	[LOGIN_PASSWORD] [varchar](50) NULL,
	[SOURCE_IN_USE] [bit] NULL,
	[SOURCE_DB_TYPE] [varchar](20) NULL,
	[SOURCE_SQL_TEST] [varchar](255) NULL
) ON [SOURCE_METADATA]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [SOURCE_METADATA].[SOURCE_TABLE_LIST]    Script Date: 17/06/2013 14:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [SOURCE_METADATA].[SOURCE_TABLE_LIST](
	[OWNER] [varchar](30) NULL,
	[TABLE_NAME] [varchar](30) NULL,
	[TABLESPACE_NAME] [varchar](30) NULL,
	[CLUSTER_NAME] [varchar](30) NULL,
	[IOT_NAME] [varchar](30) NULL,
	[STATUS] [varchar](8) NULL,
	[PCT_FREE] [varchar](38) NULL,
	[PCT_USED] [varchar](38) NULL,
	[INI_TRANS] [varchar](38) NULL,
	[MAX_TRANS] [varchar](38) NULL,
	[INITIAL_EXTENT] [varchar](38) NULL,
	[NEXT_EXTENT] [varchar](38) NULL,
	[MIN_EXTENTS] [varchar](38) NULL,
	[MAX_EXTENTS] [varchar](38) NULL,
	[PCT_INCREASE] [varchar](38) NULL,
	[FREELISTS] [varchar](38) NULL,
	[FREELIST_GROUPS] [varchar](38) NULL,
	[LOGGING] [varchar](3) NULL,
	[BACKED_UP] [varchar](1) NULL,
	[NUM_ROWS] [varchar](38) NULL,
	[BLOCKS] [varchar](38) NULL,
	[EMPTY_BLOCKS] [varchar](38) NULL,
	[AVG_SPACE] [varchar](38) NULL,
	[CHAIN_CNT] [varchar](38) NULL,
	[AVG_ROW_LEN] [varchar](38) NULL,
	[AVG_SPACE_FREELIST_BLOCKS] [varchar](38) NULL,
	[NUM_FREELIST_BLOCKS] [varchar](38) NULL,
	[DEGREE] [varchar](10) NULL,
	[INSTANCES] [varchar](10) NULL,
	[CACHE] [varchar](5) NULL,
	[TABLE_LOCK] [varchar](8) NULL,
	[SAMPLE_SIZE] [varchar](38) NULL,
	[LAST_ANALYZED] [datetime] NULL,
	[PARTITIONED] [varchar](3) NULL,
	[IOT_TYPE] [varchar](12) NULL,
	[TEMPORARY] [varchar](1) NULL,
	[SECONDARY] [varchar](1) NULL,
	[NESTED] [varchar](3) NULL,
	[BUFFER_POOL] [varchar](7) NULL,
	[ROW_MOVEMENT] [varchar](8) NULL,
	[GLOBAL_STATS] [varchar](3) NULL,
	[USER_STATS] [varchar](3) NULL,
	[DURATION] [varchar](15) NULL,
	[SKIP_CORRUPT] [varchar](8) NULL,
	[MONITORING] [varchar](3) NULL,
	[CLUSTER_OWNER] [varchar](30) NULL,
	[DEPENDENCIES] [varchar](8) NULL,
	[COMPRESSION] [varchar](8) NULL,
	[DROPPED] [varchar](3) NULL,
	[ETL_LOAD_ID] [int] NULL
) ON [SOURCE_METADATA]
SET ANSI_PADDING ON
ALTER TABLE [SOURCE_METADATA].[SOURCE_TABLE_LIST] ADD [DATABASE_NAME] [varchar](20) NULL

GO
