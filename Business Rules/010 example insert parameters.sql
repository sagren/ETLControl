INSERT INTO dbo.BusinessRules_Parameters ([query_id], [query_parameter_Description], [query_parameter_tableRelated], [query_key], [query_value])
  SELECT 10200
 ,'Calculating some random size as business rule'
 ,'MASTER.[INFORMATION_SCHEMA].[COLUMNS]'
 ,'$selectkey1'
 ,'(c.NUMERIC_PRECISION * c.ORDINAL_POSITION) AS Some_calucation_for_Size'
   UNION ALL
  SELECT 10200
 ,'Selecting only numerical data types'
 ,'MASTER.[INFORMATION_SCHEMA].[COLUMNS]'
 ,'$wherekey1'
 ,'c.DATA_TYPE IN (''int'',''smallint'',''bigint'',''tinyint'')'
    UNION ALL
  SELECT 10200
 ,'Omitting the number of columns per table'
 ,'MASTER.[INFORMATION_SCHEMA].[COLUMNS]'
 ,'$wherekey2'
 ,'c.ORDINAL_POSITION <= 10'