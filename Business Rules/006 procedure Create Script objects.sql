CREATE OR ALTER PROCEDURE dbo.sp_Create_ScriptObjects
(
@Query_ID INT 
,@ScriptObject TINYINT = 1 -- 1 default value; returns script; set to 0, generates object!
)
AS
BEGIN
DECLARE @i INT = 1
DECLARE @tip CHAR(1)= (SELECT query_type FROM dbo.BusinessRules_Query WHERE query_id = @query_ID)
DECLARE @ime VARCHAR(200)= (SELECT query_object_name FROM dbo.BusinessRules_Query WHERE query_id = @query_ID)
DECLARE @nof_params INT = (SELECT count(*) FROM dbo.BusinessRules_Parameters as P JOIN  dbo.BusinessRules_Query as R ON P.Query_ID = R.query_id WHERE R.query_id = @query_ID)

IF OBJECT_ID('tempdb..#temp123','U') IS NOT NULL
DROP TABLE #temp123
SELECT 
 row_number() over (ORDER BY (SELECT 1)) as RN
,query_id
,[query_key]
,[query_value]
INTO #temp123
FROM dbo.Bus_Rules_parameters
WHERE [query_id] = @query_id
ORDER BY ID ASC
DECLARE @sqlUkaz NVARCHAR(MAX) = (SELECT [query_text_withParameters] FROM dbo.BusinessRules_Query WHERE query_id = @Query_ID)
    DECLARE @ObjectType NVARCHAR(30) = (SELECT [query_type] FROM dbo.BusinessRules_Query WHERE query_id = @Query_ID)
WHILE (@i <= @nof_params)
BEGIN
DECLARE @param_key VARCHAR(100) = (SELECT [query_key] FROM #temp123 WHERE rn = @i)
DECLARE @param_value VARCHAR(MAX) = (SELECT [query_value] FROM #temp123 WHERE rn = @i)
SET @sqlUkaz = (SELECT REPLACE( @sqlUkaz, @param_key, @param_value))
SET @i = @i +1
END
    IF (@ScriptObject = 1) SELECT @sqlUkaz
    IF (@ScriptObject = 0)
    BEGIN
        DECLARE @DropSQL NVARCHAR(100) = 'DROP ' + @ObjectType + ' IF EXISTS ' + @ime
        exec sp_executesql @DropSQL
        exec sp_executesql @sqlUkaz
    END
   IF (@ScriptObject NOT IN (1,0))
BEGIN
SELECT 'Wrong parameter'
END
END;
GO