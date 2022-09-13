
if (select object_id(ETLControl.vwQAResultsLatest)) is not null
drop view ETLControl.vwQAResultsLatest
go
create view ETLControl.vwQAResultsLatest
as
with TestResults
as
(
select
	t.TestItemKey, t.TestGroup, t.TestItem, r.TestResultString, r.TestExecutionDateTime
	,row_number() over (partition by t.TestItemKey order by TestExecutionKey desc) test_version
from
	ETLControl.QualityTest t
inner join
	ETLControl.QualityTestResult r
on
	t.TestItemKey = r.TestItemKey
)
select
	TestItemKey, TestGroup, TestItem, TestResultString, TestExecutionDateTime
from
	TestResults
where
	test_version = 1
    