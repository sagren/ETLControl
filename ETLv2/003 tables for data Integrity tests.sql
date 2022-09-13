
/* List of audit / qa tests. Defines the QA tests to be executed */
if (select  object_id('ETLControl.QualityTest')) is null
create table ETLControl.QualityTest
(
     TestItemKey int identity not NULL -- internal auto-incremented key
    ,TestGroup varchar(50) not null default 'Default'
    ,TestItem varchar(255) not NULL -- Name of QA test, Example Number of Null values in Employee Name
    ,TestItemDescription varchar(255) not NULL -- Description of QA test
    ,TestItemSQL varchar(4000) -- SQL query used to execute QA test
    ,ResultType varchar(50) not null -- String, Numneric, Date
    ,ResultSeverity varchar(50) not null -- Warning, Error, Critical
    ,TestItemIsActive bit not NULL -- Indicate if this test is active
    ,TestItemStartDate DATETIME default getdate() -- date period applicability of test
    ,TestItemEndDate DATETIME -- Expiry date for QA test
    ,DateLastModified datetime not null default getdate()
	,primary key(TestItemKey)
);

/* Primary key for QA audit tests */
if (select  object_id('ETLControl.PK_QATest')) is null
alter table ETLControl.QualityTest
add constraint PK_QATest
primary key(TestItemKey)


/* Results of QA tests */
if (select  object_id('ETLControl.QualityTestResult')) is null
create table ETLControl.QualityTestResult
(
     TestExecutionKey int identity not NULL
    ,TestItemKey int not null
    ,TestResultString varchar(4000)
    ,TestResultNumeric numeric(15,5)
    ,TestResultDate DATETIME
	,TestExecutionDateTime datetime default getdate()
	,primary key(TEstExecutionKey)

);

/* Foreign key associating QA Test table to QA results*/
if (select  object_id('ETLControl.FK_QAResult_QATest')) is null
alter table ETLControl.QualityTestResult
add constraint FK_QAResult_QATest
foreign key (TestItemKey)
references ETLControl.QualityTest(TestItemKey);


/* Results of data profiling. Data is replaced each time the data profiling process is executed */
if (select object_id('ETLControl.PersistTableQA')) is null
CREATE TABLE [ETLControl].[PersistTableQA](
	[ID] [int] NULL,
	[TableName] [nvarchar](50) NULL,
	[ColumnNo] [int] NULL,
	[ColumnName] [nvarchar](50) NULL,
	[DataType] [nvarchar](50) NULL,
	[NoOfRecords] [int] NULL,
	[NoOfRecordsPopulated] [int] NULL,
	[NoOfRecordsDistinct] [int] NULL,
	[NoOfRecordsNull] [int] NULL,
	[NoOfRecordsBlank] [int] NULL,
	[Populated%] [decimal](25, 2) NULL,
	[Distinct%] [decimal](25, 2) NULL,
	[Null%] [decimal](25, 2) NULL,
	[Blank%] [decimal](25, 2) NULL,
	[MinValue] [nvarchar](50) NULL,
	[MaxValue] [nvarchar](50) NULL,
	[Median] [nvarchar](50) NULL
) ON [PRIMARY]
GO
