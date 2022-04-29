create function ETLControl.fncJobGetKey(@pJobName varchar(100))
/*
Created on: 2018-08-31
By: Sagren Pillai
Purpose: Return the Internal key for a Job when the Job name is passed in.
To be used in integrating the metadata framework with SSIS and SQL Agent


*/

returns int

as

begin

declare @vJobKey int

	select
		@vJobKey = JobKey
	from
		ETLControl.Job
	where
		Job = @pJobName

return @vJobKey

end

-- Unit Test
select ETLControl.fncJobGetKey('Extract Inventtable')



create function ETLControl.fncETLStatusGetKey(@pStatus varchar(100))
returns int
/*
Created on: 2018-08-31
By: Sagren Pillai
Purpose: Return the Internal Status key when the Status description is passed in.
To be used in integrating the metadata framework with SSIS and SQL Agent

*/

as

begin

declare @vStatusKey int = 0

	select
		@vStatusKey = ETLStatusKey
	from
		ETLControl.ETLStatus
	where
		ETLStatus = @pStatus

return @vStatusKey

end


create function ETLControl.fncLoadModeGetKey(@pLoadMode varchar(100))
returns int
/*
Created on: 2018-08-31
By: Sagren Pillai
Purpose: Return the Internal Load Mode key when the Load Mode description is passed in.
To be used in integrating the metadata framework with SSIS and SQL Agent


*/

as

begin

declare @vLoadModeKey int = 0

	select
		@vLoadModeKey = LoadModeKey
	from
		ETLControl.LoadMode
	where
		LoadMode = @pLoadMode

return @vLoadModeKey

end


drop function ETLControl.fncBatchGetKey
go


create function ETLControl.fncBatchGetKey(@pBatchName varchar(100))
returns int

/*
Created on: 2018-08-31
By: Sagren Pillai
Purpose: Return the Internal Batch key when the Batch Name is passed in.
To be used in integrating the metadata framework with SSIS and SQL Agent


*/

as
begin

declare @vBatchKey int = 0

	select
		@vBatchKey = BatchKey
	from
		ETLControl.Batch
	where
		Batch = @pBatchName

return @vBatchKey

end






drop procedure ETLControl.prcJobStart
go

 
create procedure ETLControl.prcJobStart (@pLoadMode varchar(100),@pBatchExecutionKey int, @pJobName varchar(100) )
as

begin

declare
	@vJobKey int

	-- Get JobKey for Job Name
	select @vJobKey = ETLControl.fncJobGetKey(@pJobName)

	-- Update any pending instances of Job to Error status
	update 
		ETLControl.JobExecution
	set
		JobStatusKey = ETLControl.fncETLStatusGetKey('Error')
		,DateTimeLastModified = getdate()
	where
		JobKey = @vJobKey
	and
		JobStatusKey = ETLControl.fncETLStatusGetKey('Started')

	-- create new log entry for Job
	insert into ETLControl.JobExecution (JobKey, BatchExecutionKey, LoadModeKey, JobStatusKey, ETLDateTime, JobStartDateTime, DateTimeLastModified)
	values
	(@vJobKey, @pBatchExecutionKey, ETLControl.fncLoadModeGetKey(@pLoadMode), ETLControl.fncETLStatusGetKey('Started'), getdate(), getdate(), GETDATE())


	-- return JobExecutionKey
	select 
		max(JobExecutionKey) JobExecutionKey
	from
		ETLControl.JobExecution
	where
		JobKey = @vJobKey

end




create procedure ETLControl.prcJobEnd(@pJobExecutionKey int, @pJobStatus varchar(100), @pProcessedRowCount int, @pSuccessRowCount int, @pErrorRowCount int)
as

begin

	update
		ETLControl.JobExecution
	set
		 JobStatusKey = ETLControl.fncETLStatusGetKey(@pJobStatus)
		,JobEndDateTime = getdate()
		,ProcessedRows = @pProcessedRowCount
		,SuccessRows = @pSuccessRowCount
		,ErrorRows = @pErrorRowCount
		,DateTimeLastModified = getdate()
	where
		JobExecutionKEy = @pJobExecutionKey

end



create procedure ETLControl.prcBatchStart (@pBatchName varchar(100))
as
begin

declare @vBatchKey int = 0

	select
		@vBatchKey = ETLControl.fncBatchGetKey(@pBatchName)

	update
		ETLControl.BatchExecution
	set
		BatchStatusKey = ETLControl.fncETLStatusGetKey('Error')
		,DateTimeLastModified = getdate()
	where
		BatchKey = @vBatchKey
	and
		BatchStatusKey = ETLControl.fncETLStatusGetKey('Started')

	
	insert into ETLControl.BatchExecution (BatchKey, BatchStatusKey, BatchStartExecutionTime, DateTimeLastModified)
	values
		(@vBatchKey, ETLControl.fncETLStatusGetKey('Started'), getdate(), getdate())

	select
		max(BatchExecutionKey) BatchExecutionKey
	from
		ETLControl.BatchExecution
	where
		BatchKey = @vBatchKey

end



create procedure ETLControl.prcBatchEnd(@pBatchExecutionKey int, @pBatchStatus varchar(100))
as

begin

	update 
		ETLControl.BatchExecution
	set
		BatchStatusKey = ETLControl.fncETLStatusGetKey(@pBatchStatus)
		,BatchEndExecutionTime = getdate()
		,DateTimeLastModified = getdate()
	where
		BatchExecutionKey = @pBatchExecutionKey

end



create function ETLControl.fncBatchExecutionGetLatestKey (@pBatchName varchar(100))
returns int
as

begin

declare @vBatchExecutionKey int = 0

	select
		@vBatchExecutionKey = max(BatchExecutionKey)
	from
		ETLControl.BatchExecution
	where
		BatchKey = ETLControl.fncBatchGetKey(@pBatchName)

return @vBatchExecutionKey

end



/* Test Batch and Job ETL Control Interface */

exec ETLControl.prcBatchStart 'Daily Sales ETL'

exec ETLControl.prcJobStart 1,'Extract AX CASHDISC','Full'


exec ETLControl.prcBatchEnd 1, 'Success'


select ETLControl.fncBatchExecutionGetLatestKey('Daily Sales ETL')



declare
	@vBatchExecutionKey int
begin

	select @vBatchExecutionKey = ETLControl.fncBatchExecutionGetLatestKey('Daily Sales ETL')

	exec ETLControl.prcBatchEnd @vBatchExecutionKey, 'Success'

end


exec ETLControl.prcBatchEnd 1, 'Success'
