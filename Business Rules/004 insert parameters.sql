INSERT INTO dbo.BusinessRules_Parameters ([query_id], [query_parameter_Description], [query_parameter_tableRelated], [query_key], [query_value])
 SELECT 10203
 ,'CASE Statement to determine if ORACLE or SYBASE type'
 ,'master.dbo.spt_values'
 ,'$selectkey1'
 ,'CASE WHEN name like ''DB %'' THEN ''ORACLE'' ELSE ''SYBASE'' END As dbms_name'