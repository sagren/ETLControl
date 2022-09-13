CREATE OR ALTER PROCEDURE dbo.sp_Update_Parameters
(
 @Query_ID INT
,@Query_key VARCHAR(20)
,@new_query_value NVARCHAR(MAX) = NULL
,@new_query_parameter_Description VARCHAR(500) = NULL
,@new_query_table_related VARCHAR(500) = NULL
,@is_enabled TINYINT = 1
)
/*
Usage:
EXEC dbo.sp_Update_Parameters 
@query_id = 10203
,@Query_key = '$wherekey2'
,@new_query_value = ' '
,@new_query_parameter_Description = ''
,@new_query_table_related = ''
,@is_enabled = 0
*/AS
BEGIN

-------------------------------------
-- Only when disabling the parameter!
-------------------------------------
IF (@is_enabled = 0)
BEGIN
DECLARE @pam_ver0 INT = (SELECT max(parameter_version) from BusinessRules_Parameters where [query_id] = @query_id AND query_key =  @Query_key)
UPDATE dbo.BusinessRules_Parameters 
SET parameter_active = 0
WHERE
query_id = @query_id
and query_key = @Query_key
and parameter_version = @pam_ver0
-- Update procedure and replace the parameter with "1=1"
UPDATE dbo.BusinessRules_Query
SET query_text_withParameters = REPLACE(query_text_withParameters, @Query_key, ' 1=1 ' )
WHERE 
query_id = @query_id
END
-------------------------------------
-- When parameter exists & is updated
-------------------------------------
-- INSERT NEW VALUE FOR PARAMETER
IF (@is_enabled = 1)
BEGIN

DECLARE @pam_ver1 INT = (SELECT max(parameter_version) from BusinessRules_Parameters where [query_id] = @query_id AND query_key =  @Query_key)

UPDATE dbo.BusinessRules_Parameters 
SET @is_enabled = 0
WHERE
query_id = @query_id
AND query_key = @Query_key
AND parameter_version = @pam_ver1

 INSERT INTO dbo.BusinessRules_Parameters ([query_id], [query_parameter_Description], [query_parameter_tableRelated], [query_key], [query_value], parameter_version, parameter_active)
 SELECT 
 @query_id AS query_id
,@new_query_parameter_Description AS query_parameter_Description
,@new_query_table_related AS query_parameter_tableRelated
,@Query_key  AS query_key
,@new_query_value AS query_value
,@pam_ver1 + 1 AS parameter_version
,@is_enabled AS Parameter_active
END
--Run CREATE procedure
EXEC dbo.sp_Create_ScriptObjects
@query_id = @query_id
END;
GO