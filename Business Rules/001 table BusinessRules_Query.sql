IF object_id ('BusinessRules_Query', 'U') IS NOT  NULL
DROP TABLE dbo.BusinessRules_Query
CREATE TABLE dbo.BusinessRules_Query
(
 id INT IDENTITY(1,1) NOT NULL
,query_type VARCHAR(15) NOT NULL -- Procedure, Function, View
,query_object_name VARCHAR(200) NULL -- enter the procedure/function/view name
,query_id INT NOT NULL  -- Object_id() 
,query_text NVARCHAR(MAX)  NULL  -- query  
,query_text_withParameters NVARCHAR(MAX) NOT NULL  -- query with parameters
,user_created VARCHAR(50) NOT NULL DEFAULT (suser_name())
,date_created DATETIME NOT NULL DEFAULT (GETDATE())
,rule_version INT DEFAULT(1)
,CONSTRAINT PK_BussinesRulesQuery_QueryID_Version
               PRIMARY KEY CLUSTERED (query_id, Rule_version)
               WITH (IGNORE_DUP_KEY = OFF)
);