INSERT INTO dbo.BusinessRules_Query ([query_type], [query_object_name], [query_id], [query_text], [query_text_withParameters])
 SELECT 'View','dbo.vw_SampleQuery2', 10200
 ,NULL
,
'CREATE VIEW dbo.vw_SampleQuery2
AS
SELECT 
 t.TABLE_CATALOG
,t.table_name
,t.TABLE_SCHEMA
,c.COLUMN_NAME
,c.ORDINAL_POSITION
,c.IS_NULLABLE
,c.DATA_TYPE
,c.NUMERIC_PRECISION
,$selectkey1
FROM
MASTER.[INFORMATION_SCHEMA].[COLUMNS] AS c
JOIN MASTER.[INFORMATION_SCHEMA].[TABLES] AS t
ON t.TABLE_NAME = c.TABLE_NAME
AND t.TABLE_SCHEMA = c.TABLE_SCHEMA
AND t.TABLE_CATALOG = c.TABLE_CATALOG
WHERE
$wherekey1
AND $wherekey2'