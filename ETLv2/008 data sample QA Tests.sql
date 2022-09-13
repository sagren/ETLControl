


insert into ETLControl.QualityTest (TestGroup, TestItem, TestItemDescription, TestItemSQL, ResultType, ResultSeverity
, TestItemIsActive, TestItemStartDate, TestItemEndDate)

values ('Demographics', 'Extract:Employees with null Ethnicity','Number of records with null value for Ethnicity in Extracted data'
,'select count(1) TestResult from [OutSystems].[OSUSR_26y_EMPLOYEE] where ETHNICITYID is null'
,'Numeric'
,'Warning'
,1, '2022-01-01', '2999-12-31')



insert into ETLControl.QualityTest (TestGroup, TestItem, TestItemDescription, TestItemSQL, ResultType, ResultSeverity
, TestItemIsActive, TestItemStartDate, TestItemEndDate)

values ('Demographics', 'Persist:Employees with null Ethnicity','Number of records with null value for Ethnicity in Extracted data'
,'select count(1) from [Persist].[EMPLOYEE] where ETHNICITYID is null'
,'Numeric'
,'Warning'
,1, '2022-01-01', '2999-12-31')



insert into ETLControl.QualityTest (TestGroup, TestItem, TestItemDescription, TestItemSQL, ResultType, ResultSeverity
, TestItemIsActive, TestItemStartDate, TestItemEndDate)

values ('Cases', 'Persist:Latest Case Date','Most recent case created date'
,'select max(CREATEDATETIME) from Persist.[Case]'
,'Date'
,'Warning'
,1, '2022-01-01', '2999-12-31')

insert into ETLControl.QualityTest (TestGroup, TestItem, TestItemDescription, TestItemSQL, ResultType, ResultSeverity
, TestItemIsActive, TestItemStartDate, TestItemEndDate)

values ('Company', 'Persist:Industry not populated','Companies where no industry is given'
,'select count(1) from Persist.Company where INDUSTRYID is null'
,'Numeric'
,'Warning'
,1, '2022-01-01', '2999-12-31')

/* Perform QA tests */
exec [ETLControl].[prcPopulateQATestResults]



