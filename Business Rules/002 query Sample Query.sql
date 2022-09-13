INSERT INTO dbo.BusinessRules_Query ([query_type], [query_object_name], [query_id], [query_text], [query_text_withParameters])
 SELECT 'Procedure','dbo.sp_SampleQuery1', 10203
 ,NULL
,
'CREATE PROCEDURE dbo.sp_SampleQuery1
AS
SELECT * 
FROM
(
SELECT 
name
,number
,$selectkey1
FROM 
master.dbo.spt_values
WHERE

$wherekey1
AND status = 0
) AS x
join msdb.dbo.MSdatatype_mappings as m
ON m.dbms_name =  x.dbms_name
'