IF object_id ('BusinessRules_Executions', 'U') IS NOT  NULL
DROP TABLE dbo.BusinessRules_Executions
CREATE TABLE dbo.BusinessRules_Executions
(
 id INT IDENTITY(1,1) NOT NULL
,query_id INT NOT NULL  
,query_execution TINYINT NOT NULL DEFAULT(0) -- 0 - rule is on; 1 - rule is off
,user_created VARCHAR(50) NOT NULL DEFAULT (suser_name())
,date_created DATETIME NOT NULL DEFAULT (GETDATE())
,CONSTRAINT PK_BussinesRulesExecution_QueryID PRIMARY KEY CLUSTERED (query_id)
);