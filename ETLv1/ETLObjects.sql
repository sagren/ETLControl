

/*
 Batch Table - A batch represents a collection of ETL steps / jobs, for example Daily Sales ETL
*/
CREATE TABLE ETLControl.Batch(
	BatchKey [int] IDENTITY(1,1) NOT NULL,
	Batch [varchar](50) NOT NULL,
	BatchIsEnabled [bit] NOT NULL,
	DateTimeLastModified [datetime] NULL,
	OSUserLastModified [varchar](50) NULL,
	LoginUserLastModified [varchar](50) NULL,
 CONSTRAINT [PK_BATCH] PRIMARY KEY CLUSTERED 
(
	BatchKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON ETLControl
) ON ETLControl

GO

/* Parameters associated with a batch */
CREATE TABLE ETLControl.BatchControl(
	BatchControlKey [int] IDENTITY(1,1) NOT NULL,
	BatchExecutionKey [int] NOT NULL,
	BatchControlTypeKey [int] NOT NULL, -- Link to table describing the parameters
	ParameterValueDate_1 [datetime] NULL,
	ParameterValueDate_2 [datetime] NULL,
	ParameterValueInt_3 [int] NULL,
	ParameterValueInt_4 [int] NULL,
	ParameterValueChar_5 [varchar](400) NULL,
	ParameterValueChar_6 [varchar](400) NULL,
	DateTimeLastModified [datetime] NULL,
 CONSTRAINT [PK_BATCH_CONTROL] PRIMARY KEY CLUSTERED 
(
	BatchControlKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON ETLControl
) ON ETLControl

GO

/* Batch Parameter descriptions */
CREATE TABLE ETLControl.BatchControlType(
	BatchControlTypeKey [int] IDENTITY(1,1) NOT NULL,
	BatchControlType [varchar](50) NULL,
	ParameterDateDescription_1 [varchar](20) NOT NULL,
	ParameterDateDecsription_2 [varchar](20) NOT NULL,
	ParameterIntegerDescription_3 [varchar](20) NOT NULL,
	ParameterIntegerDescription_4 [varchar](20) NOT NULL,
	ParameterCharDescription_5 [varchar](20) NOT NULL,
	ParameterCharDescription_6 [varchar](20) NOT NULL,
	ParameterCharDescription_7 [varchar](20) NOT NULL,
	ParameterCharDescription_8 [varchar](20) NOT NULL,
	DateTimeLastModified [datetime] NOT NULL,
	OSUserLastModified [varchar](50) NULL,
	LoginUserLastModified varchar(50)
 CONSTRAINT [PK_BATCH_CONTROL_TYPE] PRIMARY KEY CLUSTERED 
(
	BatchControlTypeKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON ETLControl
) ON ETLControl

GO


CREATE TABLE ETLControl.BatchExecution(
	BatchExecutionKey [int] IDENTITY(1,1) NOT NULL,
	BatchScheduleID [int] NOT NULL,
	BatchStartExecutionTime [datetime] NULL,
	BatchEndExecutionTime [datetime] NULL,
	BatchStatusKey [int] NOT NULL,
	BatchExecutionGUID [varchar](50) NULL,
	DateTimeLastModified [datetime] NULL,
	OSUserLastModified [varchar](50) NULL,
	LoginUserLastModified [varchar](50) NULL,
 CONSTRAINT [PK_BATCH_EXECUTION] PRIMARY KEY CLUSTERED 
(
	BatchExecutionKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON ETLControl
) ON ETLControl

GO



CREATE TABLE ETLControl.BatchSchedule(
	BatchScheduleKey [int] IDENTITY(1,1) NOT NULL,
	BatchKey [int] NOT NULL,
	FrequencyKey [int] NOT NULL,
	Schedule [varchar](50) NOT NULL,
	ScheduleEffectiveFrom [datetime] NOT NULL,
	ScheduleEffectiveTo [datetime] NOT NULL,
	ScheduleStartTimeOfDay [datetime] NULL,
	ScheduleEnabled [bit] NOT NULL,
	DateTimeLastModified [datetime] NULL,
	OSUserLastModified [varchar](50) NULL,
 CONSTRAINT [PK_BATCH_SCHEDULE] PRIMARY KEY CLUSTERED 
(
	BatchScheduleKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON ETLControl
) ON ETLControl

GO

CREATE TABLE ETLControl.BatchScheduleParameter(
	BatchScheduleKey [int] NOT NULL,
	ParameterTypeKey [int] NOT NULL,
	ParameterValueString [varchar](255) NULL,
	ParameterValueDate [datetime] NULL,
	ParameterValueInteger [int] NULL,
	DateTimeLastModified [datetime] NOT NULL,
	LoginUserLastModified [varchar](50) NULL,
	OSUserLastModifed [varchar](50) NULL,
 CONSTRAINT [PK_BATCH_SCHEDULE_PARAMETER] PRIMARY KEY CLUSTERED 
(
	BatchScheduleKey ASC,
	ParameterTypeKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON ETLControl
) ON ETLControl

GO

CREATE TABLE ETLControl.ConfigurationItem(
	ConfigurationItemKey [int] IDENTITY(1,1) NOT NULL,
	ConfigurationItem [varchar](50) NOT NULL,
	ConfigurationItemValue [varchar](200) NOT NULL,
	DateTimeLastModified [datetime] NOT NULL,
	LoginUserLastModified [varchar](50) NULL,
	OSUserLastModifed [varchar](50) NULL,
 CONSTRAINT [PK_CONFIGURATION_ITEM] PRIMARY KEY CLUSTERED 
(
	ConfigurationItemKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON ETLControl
) ON ETLControl

GO


CREATE TABLE ETLControl.ETLStatus(
	ETLStatusKey [int] IDENTITY(1,1) NOT NULL,
	ETLStatus [varchar](50) NOT NULL,
	DateTimeLastModified [datetime] NOT NULL,
	LoginUserLastModified [varchar](50) NULL,
	OSUserLastModifed [varchar](50) NULL,
 CONSTRAINT [PK_ETL_STATUS] PRIMARY KEY CLUSTERED 
(
	ETLStatusKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON ETLControl
) ON ETLControl

GO

CREATE TABLE ETLControl.Frequency(
	FrequencyKey [int] IDENTITY(1,1) NOT NULL,
	Frequency [varchar](50) NOT NULL,
	DateTimeLastModified [datetime] NOT NULL,
	LoginUserLastModified [varchar](50) NULL,
	OSUserLastModifed [varchar](50) NULL,
 CONSTRAINT [PK_FREQUENCY] PRIMARY KEY CLUSTERED 
(
	FrequencyKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON ETLControl
) ON ETLControl

GO

CREATE TABLE ETLControl.[JOB](
	JobKey [int] IDENTITY(1,1) NOT NULL,
	Job [varchar](100) NOT NULL,
	PackageName [varchar](255) NOT NULL,
	JobTypeKey [int] NOT NULL,
	JobFunctionKey [int] NOT NULL,
	JobLocation [varchar](200) NULL,
	DateTimeLastModified [datetime] NOT NULL,
	LoginUserLastModified [varchar](50) NULL,
	OSUserLastModifed [varchar](50) NULL,
	SSISPackageVersionID [varchar](255) NULL
 CONSTRAINT [PK_JOB] PRIMARY KEY CLUSTERED 
(
	JobKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON ETLControl
)
go


CREATE TABLE ETLControl.JobExecution(
	JobExecutionKey [int] IDENTITY(1,1) NOT NULL,
	BatchExecutionKey [int] NOT NULL,
	ScheduleJobKey [int] NULL,
	LoadModeKey [int] NULL,
	JobStatusKey [int] NULL,
	HighestSeverityKey [int] NULL,
	ETLDateTime [datetime] NULL,
	JobStartDateTime [datetime] NULL,
	JobEndDateTime [datetime] NULL,
	ProcessedRows [int] NULL,
	SuccessRows [int] NULL,
	ErrorRows [int] NULL,
	ExecuteUser [varchar](50) NULL,
	ETLRowcount_1 [int] NULL,
	ETLRowcount_2 [int] NULL,
	ETLRowcount_3 [int] NULL,
	ETLRowcount_4 [int] NULL,
	ETLControlTotal_1 [float] NULL,
	ETLControlTotal_2 [float] NULL,
	ETLControlTotal_3 [float] NULL,
	DateTimeLastModified [datetime] NULL	 
 CONSTRAINT [PK_JOB_CONTROL] PRIMARY KEY CLUSTERED 
(
	JobExecutionKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

create table ETLControl.TableExecution
(
 TableExecutionKey int identity not null
,JobExecutionKey int not null
,TableStatusKey int not null
,TableStartDateTime datetime not null
,TableEndDateTime datetime not null
,ETLRowcount_1 [int] NULL,
	ETLRowcount_2 [int] NULL,
	ETLRowcount_3 [int] NULL,
	ETLRowcount_4 [int] NULL,
	ETLControlTotal_1 [float] NULL,
	ETLControlTotal_2 [float] NULL,
	ETLControlTotal_3 [float] NULL,
	DateTimeLastModified [datetime] NULL
constraint PK_TableExecution primary key clustered (TableExecutionKey)
) on primary


CREATE TABLE ETLControl.JobDependency(
	ParentJobKey [int] NOT NULL,
	ChildJobKey [int] NOT NULL,
	DateTimeLastModified [datetime] NULL,
	OSUserLastModified [varchar](50) NULL,
	LoginLastUserModified [varchar](50) NULL,
 CONSTRAINT [PK_JOB_DEPENDENCY] PRIMARY KEY CLUSTERED 
(
	ParentJobKey ASC,
	ChildJobKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON ETLControl
) ON ETLControl

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ETL_CONTROL].[JOB_FUNCTION]    Script Date: 17/06/2013 14:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO


CREATE TABLE ETLControl.JobFunction(
	JobFunctionKey [int] IDENTITY(1,1) NOT NULL,
	JobFunction [varchar](50) NOT NULL,
	DateTimeLastModified [datetime] NULL,
	OSUserLastModified [varchar](50) NULL,
	LoginLastUserModified [varchar](50) NULL,
 CONSTRAINT [PK_JOB_FUNCTION] PRIMARY KEY CLUSTERED 
(
	JobFunctionKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON ETLControl
) ON ETLControl

GO

CREATE TABLE ETLControl.JobType(
	JobTypeKey [int] IDENTITY(1,1) NOT NULL,
	JobType [varchar](50) NOT NULL,
	DateTimeLastModified [datetime] NULL,
	OSUserLastModified [varchar](50) NULL,
	LoginLastUserModified [varchar](50) NULL,
 CONSTRAINT [PK_JOB_TYPE] PRIMARY KEY CLUSTERED 
(
	JobTypeKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON ETLControl
) ON ETLControl

GO

CREATE TABLE ETLControl.LoadMode(
	LoadModeKey [int] IDENTITY(1,1) NOT NULL,
	LoadMode [varchar](50) NULL,
	DateTimeLastModified [datetime] NULL,
	OSUserLastModified [varchar](50) NULL,
	LoginLastUserModified [varchar](50) NULL,
 CONSTRAINT [PK_LOAD_MODE] PRIMARY KEY CLUSTERED 
(
	LoadModeKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON ETLControl
) ON ETLControl

GO

CREATE TABLE ETLControl.ParameterType(
	ParameterTypeKey [int] IDENTITY(1,1) NOT NULL,
	ParameterType [varchar](50) NULL,
	ParamterDataType [varchar](50) NOT NULL,
	DateTimeLastModified [datetime] NULL,
	OSUserLastModified [varchar](50) NULL,
	LoginLastUserModified [varchar](50) NULL,
 CONSTRAINT [PK_PARAMETER_SPECIFICATION] PRIMARY KEY CLUSTERED 
(
	ParameterTypeKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON ETLControl
) ON ETLControl

GO

CREATE TABLE ETLControl.TimeMeasure(
	TimeMeasureKey [int] IDENTITY(1,1) NOT NULL,
	TimeMeasure [varchar](50) NULL,
	DateTimeLastModified [datetime] NULL,
	OSUserLastModified [varchar](50) NULL,
	LoginUserLastModified [varchar](50) NULL,
 CONSTRAINT [PK_TIME_MEASURE] PRIMARY KEY CLUSTERED 
(
	TimeMeasureKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON ETLControl
) ON ETLControl

GO

CREATE TABLE ETLEvent.ETLEvent(
	ETLEventKey [int] IDENTITY(1,1) NOT NULL,
	ETLEvent [varchar](255) NOT NULL,
	SeverityKey [int] NOT NULL,
	EventTypeKey [int] NOT NULL,
	DateTimeLastModified [datetime] NULL,
	OSUserLastModified [varchar](50) NULL,
	LoginUserLastModified [varchar](50) NULL,
 CONSTRAINT [PK_EVENT] PRIMARY KEY CLUSTERED 
(
	ETLEventKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON ETLEvent
) ON ETLEvent

GO

CREATE TABLE ETLEvent.EventLog(
	EventLogKey [int] IDENTITY(1,1) NOT NULL,
	JobControlKey [int] NULL,
	BatchExecutionKey [int] NOT NULL,
	ETLEventKey [int] NOT NULL,
	SeverityKey [int] NOT NULL,
	EventContent [varchar](400) NULL,
	LoggedBy [varchar](50) NULL,
	EventDateTime [datetime] NULL,
 CONSTRAINT [PK_EVENT_LOG] PRIMARY KEY CLUSTERED 
(
	EventLogKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON ETLEvent
) ON ETLEvent

GO

CREATE TABLE ETLEvent.EventType(
	EventTypeKey [int] IDENTITY(1,1) NOT NULL,
	EventType [varchar](50) NULL,
	DateTimeLastModified [datetime] NULL,
	OSUserLastModifed [varchar](50) NULL,
	LoginUserLastModified [varchar](50) NULL,
 CONSTRAINT [PK_EVENT_TYPE] PRIMARY KEY CLUSTERED 
(
	EventTypeKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON ETLEvent
) ON ETLEvent

go

CREATE TABLE ETLEvent.Severity(
	SeverityKey [int] IDENTITY(1,1) NOT NULL,
	SeverityTypeKey [int] NOT NULL,
	Severity [varchar](50) NULL,
	SeverityScore [float] NULL,
	DateTimeLastModified [datetime] NULL,
	OSUserLastModified [varchar](50) NULL,
	LoginUserLastModified [varchar](50) NULL,
 CONSTRAINT [PK_SEVERITY] PRIMARY KEY CLUSTERED 
(
	SeverityKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON ETLEvent
) ON ETLEvent

GO

CREATE TABLE ETLEvent.SeverityType
(
	SeverityTypeKey [int] IDENTITY(1,1) NOT NULL,
	SeverityType [varchar](50) NULL,
	DateTimeLastModified [datetime] NULL,
	OSUserLastModifed [varchar](50) NULL,
	LoginUserLastModified [varchar](50) NULL,
 CONSTRAINT [PK_SEVERITY_TYPE] PRIMARY KEY CLUSTERED 
(
	SeverityTypeKey ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON ETLEvent
) ON ETLEvent

GO
