

-- Set up required metadata

insert into ETLControl.Batch(Batch, BatchIsEnabled) values ('Daily Sales ETL', 'True')


insert into ETLControl.JobType (JobType) values ('SSIS Package')

insert into ETLControl.JobType (JobType) values ('Stored Procedure')



insert into ETLControl.JobFunction (JobFunction) values ('Extract')

insert into ETLControl.JobFunction (JobFunction) values ('Staging')

insert into ETLControl.JobFunction (JobFunction) values ('Dimension')

insert into ETLControl.JobFunction (JobFunction) values ('Fact')



insert into ETLControl.Job (Job, PackageName, JobTypeKey, JobFunctionKey, JobLocation, DateTimeLastModified)
select 'Extract ' + TABLE_NAME, 'Extract ' + TABLE_NAME, 1,1, 'SSISDB', getdate()
from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA = 'AX_Extract'
and TABLE_TYPE = 'BASE TABLE'




insert into ETLControl.ETLStatus(ETLStatus, DateTimeLastModified) values ('Started', getdate())

insert into ETLControl.ETLStatus(ETLStatus, DateTimeLastModified) values ('Success', getdate())

insert into ETLControl.ETLStatus(ETLStatus, DateTimeLastModified) values ('Error', getdate())



insert into ETLControl.LoadMode (LoadMode, DateTimeLastModified) values ('Initial', getdate())

insert into ETLControl.LoadMode (LoadMode, DateTimeLastModified) values ('Full', getdate())

insert into ETLControl.LoadMode (LoadMode, DateTimeLastModified) values ('Incremental', getdate())


