
if (select object_id('ETLControl.prcPopulateQATestResults')) is not null
drop procedure ETLControl.prcPopulateQATestResults
GO
create procedure ETLControl.prcPopulateQATestResults
as
/*

Procedure to execute data integrity and QA tests. These tests gather QA statistics and results for data scenarios that have been defined by business.
The data collected can be used to monitor data quality, data errors and detect outlier and unexpected values.

The QA tests are defined as SQL statements that return a single value. The SQL statements are executed dynamically with the output written to the
QualityTestResult table.
The definitions of the QA tests are maintained in the QualityTest table.

Developed By : Decision Inc
Date : 2022-09-01
Modified : 

*/

begin

	/*
	 Cursor returning list of QA Tests to be executed. Tests can be flagged as InActive or Expired - in which case they won't be used.
	*/

	declare c_qa_test cursor
	for
		select
			t.TestItemKey, t.TestItemSQL
		from
			ETLControl.QualityTest t
		where
			t.TestItemIsActive = 1 -- exclude InActive Tests

		and
			lower(substring(t.TestItemSQL,1,7)) = 'select ' -- Exclude statements that are potentially invalid
		and
			getdate() between t.TestItemStartDate and t.TestItemEndDate -- Exclude expired tests
		order by
			TestItemKey -- sort by the TestItemKey primary key. Future enhancement could include logic for dependent tests or specific ordering


	-- Variables for storing cursor results
	declare @vTestItemKey int, @vTestItemSQL varchar(max)

	-- Table variable for storing QA test results. All results are collected before being inserted into a physical database table.
	declare @vTestResultTable table
	(
	 TestItemKey int
	 ,TestResultString varchar(1000)
	 ,TestResultNumeric numeric(15,5)
	 ,TestResultDate datetime
	)

	-- Loop through list of QA tests
	open c_qa_test
	fetch next from c_qa_test into @vTestItemKey, @vTestItemSQL
	while @@FETCH_STATUS = 0
		begin

			-- Execute QA statement	 and insert results into the table variable; with a null value for the TestItemKey
			insert into @vTestResultTable(TestResultString)
			exec (@vTestItemSQL)

			-- Update the TestItemKey
			update @vTestResultTable set TestItemKey = @vTestItemKey where TestItemKey is null

			-- Fetch the next test
			fetch next from c_qa_test into @vTestItemKey, @vTestItemSQL
		end

	-- Close QA Test cursor
	close c_qa_test

	--Deallocate memory for QA test cursor
	deallocate c_qa_test

	--Populate the numeric data type results 
	update r
		set TestResultNumeric = cast(TestResultString as numeric(15,5))
	from
		@vTestResultTable r
	inner join
		ETLControl.QualityTest qt
	on
		r.TestItemKey = qt.TestItemKey
	where 
		qt.ResultType = 'Numeric'

	--Populate the date type results 
	update r
		set TestResultDate = cast(TestResultString as datetime)
	from
		@vTestResultTable r
	inner join
		ETLControl.QualityTest qt
	on
		r.TestItemKey = qt.TestItemKey
	where 
		qt.ResultType = 'Date' or qt.ResultType = 'DateTime'


	-- Store All calculated QA results into Test Results table
	insert into ETLControl.QualityTestResult (TestItemKey, TestResultString, TestResultNumeric, TestResultDate)
	select 
		TestItemKey, TestResultString, TestResultNumeric, TestResultDate
	from
		@vTestResultTable

end

