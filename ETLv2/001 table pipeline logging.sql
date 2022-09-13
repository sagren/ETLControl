

/* Record pipeline rowcounts */
if (select  object_id('ETLControl.PipelineRowCount')) is null
CREATE TABLE [ETLControl].[PipelineRowCount](
	[PipelineExecutionKey] [int] IDENTITY(1,1) NOT NULL,
	[PipelineName] [varchar](255) NOT NULL,
	[DataSourceID] [varchar](255) NOT NULL,
	[DataSinkID] [varchar](255) NOT NULL,
	[DataSourceDescription] [varchar](255) NULL,
	[DataSinkDescription] [varchar](255) NULL,
	[PipelineRunID] [varchar](255) NOT NULL,
	[PipelineStartTime] [datetime] NOT NULL,
	[PipelineEndTime] [datetime] NULL,
	[PipeLineStatus] [varchar](50) NOT NULL,
	[SourceRowcount] [int] NULL,
	[SinkRowcount] [int] NULL,
	[MaxDateTime] datetime
) ON [PRIMARY]
GO

ALTER TABLE [ETLControl].[PipelineRowCount] ADD  DEFAULT ('Running') FOR [PipeLineStatus]
GO

