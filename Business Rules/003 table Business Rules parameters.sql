CREATE TABLE dbo.BusinessRules_Parameters
(
 id INT IDENTITY(1,1) NOT NULL
,query_id INT NOT NULL  
,query_parameter_Description VARCHAR(500) 
,query_parameter_tableRelated VARCHAR(500) --  more tables separated with semi-colon ";"
,query_key VARCHAR(20) -- eg.: $selectkey1 $wherekey1
,query_value NVARCHAR(MAX) -- query part
-- housekeeping
,user_created VARCHAR(50) NOT NULL DEFAULT (suser_name())
,date_created DATETIME NOT NULL DEFAULT (GETDATE())
,parameter_version INT DEFAULT(1)
,parameter_active TINYINT DEFAULT(1) -- 1-is active; 0 - is not active
,CONSTRAINT PK_BussinesRulesParameters_QueryID_queryKey_Version
               PRIMARY KEY CLUSTERED (query_id, query_key, parameter_version)
               WITH (IGNORE_DUP_KEY = OFF)
)