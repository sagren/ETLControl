/* Results of data profiling. Data is replaced each time the data profiling process is executed */
if (select object_id('ETLControl.PersistTableQA')) is null
CREATE TABLE [ETLControl].[PersistTableQA](
	[ID] [int] NULL,
	[TableName] [nvarchar](50) NULL,
	[ColumnNo] [int] NULL,
	[ColumnName] [nvarchar](50) NULL,
	[DataType] [nvarchar](50) NULL,
	[NoOfRecords] [int] NULL,
	[NoOfRecordsPopulated] [int] NULL,
	[NoOfRecordsDistinct] [int] NULL,
	[NoOfRecordsNull] [int] NULL,
	[NoOfRecordsBlank] [int] NULL,
	[Populated%] [decimal](25, 2) NULL,
	[Distinct%] [decimal](25, 2) NULL,
	[Null%] [decimal](25, 2) NULL,
	[Blank%] [decimal](25, 2) NULL,
	[MinValue] [nvarchar](50) NULL,
	[MaxValue] [nvarchar](50) NULL,
	[Median] [nvarchar](50) NULL
) ON [PRIMARY]
GO




if (select object_id('ETLControl.PersistQA')) is not null
drop procedure ETLControl.PersistQA 
go 
/*---------------------------------------------------------------------------------------------------*/
/*--------------------------------Create Stored Proc - Data Profiling--------------------------------*/
/*---------------------------------------------Version 2---------------------------------------------*/
/*---------------------------------------------------------------------------------------------------*/

CREATE PROCEDURE [ETLControl].[PersistQA]
AS
/*---------------------------------------------------------------------------------------------------*/
/*Step 1: Get Persist Tables Metadata*/
/*---------------------------------------------------------------------------------------------------*/
	/*Drop Table that stores Persist Tables Metadata*/
	DROP TABLE IF EXISTS 
		[DAZUICOSQL01].[ETLControl].[GetPersistMetaData] 
	;
	/*Create Table that stores Persist QA Metadata*/
	CREATE TABLE [DAZUICOSQL01].[ETLControl].[GetPersistMetaData] 
	(
		[ID] INT IDENTITY(1,1)
		,[TABLE_NAME] NVARCHAR(50)
		,[COLUMN_NO] INT
		,[COULMN_NAME] NVARCHAR(50)
		,[DATA_TYPE] NVARCHAR(20)
	)
	;
	/*Declare Variables*/
	DECLARE @Scheme_Name NVARCHAR(20)
	/*Set Variable values*/
	SET @Scheme_Name = 'Persist'
	;
	/*Declare Variable to store SQL Script*/
	DECLARE @SQL NVARCHAR(MAX)
	/*Set Variable to store SQL Script*/
	SET @SQL = 
				'
					/*Insert Data Into Table*/
					INSERT INTO [DAZUICOSQL01].[ETLControl].[GetPersistMetaData] 
					(
						[TABLE_NAME]
						,[COLUMN_NO]
						,[COULMN_NAME]
						,[DATA_TYPE]
					)
					/*Get Data to Insert Into Table*/
					(
						SELECT DISTINCT 
							c.[TABLE_NAME]
							,TRY_CAST(c.[ORDINAL_POSITION] AS INT)
							,c.[COLUMN_NAME]
							,c.[DATA_TYPE]
						FROM 
							[INFORMATION_SCHEMA].[COLUMNS] c
						WHERE 
							[TABLE_SCHEMA] = ''' + @Scheme_Name + '''
					)
				'
	;
	/*Execute SQL Script*/
	EXEC SP_EXECUTESQL @SQL
;

/*---------------------------------------------------------------------------------------------------*/
/*Part 2: Determine Persist Table Coulmn Counts*/
/*---------------------------------------------------------------------------------------------------*/
	/*Declare Variables*/
	DECLARE @RowCount INT;
	DECLARE @RowID INT = 1;
	DECLARE @ID NVARCHAR(20);
	DECLARE @TableName NVARCHAR(50);
	DECLARE @ColumnNo NVARCHAR(20);
	DECLARE @ColumnName NVARCHAR(50);
	DECLARE @DataType NVARCHAR(50);
	;
	/*Set RowCount Value*/
	SELECT @RowCount = COUNT(*) FROM [DAZUICOSQL01].[ETLControl].[GetPersistMetaData] 
	;
	/*Drop Table that stored Persist tables coulmn counts*/
	DROP TABLE IF EXISTS 
		[DAZUICOSQL01].[ETLControl].[PersistTableQACalc]
	;
	/*Create Table that stored Persist tables coulmn counts*/
	CREATE TABLE [DAZUICOSQL01].[ETLControl].[PersistTableQACalc]
	(
		[ID] INT 
		,[TableName] NVARCHAR(50)
		,[ColumnNo] INT 
		,[ColumnName] NVARCHAR(50)
		,[DataType] NVARCHAR(50)
		,[NoOfRecords] INT
		,[NoOfRecordsPopulated] INT
		,[NoOfRecordsDistinct] INT
		,[NoOfRecordsNull] INT
		,[NoOfRecordsBlank] INT
		,[Populated%] DECIMAL(25,2)
		,[Distinct%] DECIMAL(25,2)
		,[Null%] DECIMAL(25,2)
		,[Blank%] DECIMAL(25,2)
	)
	;
	/*Declare Loop to run through each row*/
	WHILE @RowID <= @RowCount
	/*Begin While Loop*/
	BEGIN 
		/*Set Variables Values*/
		SELECT 
			@ID = TRY_CAST(a.[ID] AS NVARCHAR)
			,@TableName = a.[TABLE_NAME]
			,@ColumnNo = TRY_CAST(a.[COLUMN_NO] AS NVARCHAR)
			,@ColumnName = a.[COULMN_NAME] 
			,@DataType = a.[DATA_TYPE]
		FROM 
			[DAZUICOSQL01].[ETLControl].[GetPersistMetaData] a
		WHERE 
			a.[ID] = @RowID
		;
		/*Declare Variable that stores SQL script*/
		DECLARE @SQLScript NVARCHAR(MAX)
		/*Set Variable that stores SQL script*/
		SET @SQLScript =
						'
							WITH [CTE_GetData]
							AS
							(
								SELECT TRY_CAST(''' +
									@ID + ''' AS INT) AS "ID", ''' + 
									@TableName + ''' AS "TN", TRY_CAST(''' +
									@ColumnNo + ''' AS INT) AS "CNo",''' +
									@ColumnName + ''' AS "CN",''' +
									@DataType + ''' AS "DT",' + '
									COUNT(*) AS "NR",
									(
										SELECT COUNT(*)
										FROM 
											[Persist].[' + @TableName + '] s
										WHERE
											LEN(TRY_CAST(s.[' + @ColumnName + '] AS NVARCHAR)) > 0 
									) AS "NRP"
									,(
										SELECT COUNT(*)
										FROM 
											(
												SELECT DISTINCT t.[' + @ColumnName + ']
												FROM 
													[Persist].[' + @TableName + '] t
											) AS u
									) AS "NRD"
									,(
										SELECT COUNT(*)
										FROM 
											[Persist].[' + @TableName + '] v
										WHERE 
											v.[' + @ColumnName + '] IS NULL
									) AS "NRN"
									,(
										SELECT COUNT(*)
										FROM 
											[Persist].[' + @TableName + '] w
										WHERE 
											TRY_CAST(w.[' + @ColumnName + '] AS NVARCHAR(MAX)) = '''' 
									) AS "NRB"
								FROM 
									[Persist].[' + @TableName + '] a
							)
							,[CTE_Calc]
							AS
							(
								SELECT *
									,CASE
										WHEN [NR] > 0
										THEN TRY_CAST(ROUND(TRY_CAST([NRP] AS DECIMAL) / TRY_CAST([NR] AS DECIMAL) * 100, 3) AS DECIMAL(25,3)) 
										ELSE 0.00
									END AS "P%"
									,CASE
										WHEN [NR] > 0
										THEN TRY_CAST(ROUND(TRY_CAST([NRD] AS DECIMAL) / TRY_CAST([NR] AS DECIMAL) * 100, 3) AS DECIMAL(25,3)) 
										ELSE 0.00
									END AS "D%"
									,CASE
										WHEN [NR] > 0
										THEN TRY_CAST(ROUND(TRY_CAST([NRN] AS DECIMAL) / TRY_CAST([NR] AS DECIMAL) * 100, 3) AS DECIMAL(25,3)) 
										ELSE 0.00
									END AS "N%"
									,CASE
										WHEN [NR] > 0
										THEN TRY_CAST(ROUND(TRY_CAST([NRB] AS DECIMAL(25,2)) / TRY_CAST([NR] AS DECIMAL(25,2)) * 100, 3) AS DECIMAL(25,3))
										ELSE 0.00
									END AS "B%"
								FROM 
									[CTE_GetData]
							)
							INSERT INTO [ETLControl].[PersistTableQACalc]
							(
								[ID]
								,[TableName]
								,[ColumnNo]
								,[ColumnName]
								,[DataType]
								,[NoOfRecords]
								,[NoOfRecordsPopulated]
								,[NoOfRecordsDistinct]
								,[NoOfRecordsNull]
								,[NoOfRecordsBlank]
								,[Populated%]
								,[Distinct%]
								,[Null%]
								,[Blank%]
							)
							(
								SELECT *
								FROM 
									[CTE_Calc]
							) 
						'
		/*Execute SQL script*/
		EXEC SP_EXECUTESQL @SQLScript
		/*Increase Rounct by 1*/
		SET @RowID += 1
	/*End While Loop*/
	END 
;

/*---------------------------------------------------------------------------------------------------*/
/*Part 3 Split out BIT data type */
/*---------------------------------------------------------------------------------------------------*/
	/*Drop Table that stored Persist tables BIT data*/
	DROP TABLE IF EXISTS 
		[ETLControl].[PersistTableQACalc_BIT]
	; 
	/*Create Table that stored Persist tables BIT data*/
	CREATE TABLE [ETLControl].[PersistTableQACalc_BIT]
	(
		[ID] INT 
		,[TableName] NVARCHAR(50)
		,[ColumnNo] INT 
		,[ColumnName] NVARCHAR(50)
		,[DataType] NVARCHAR(50)
		,[NoOfRecords] INT
		,[NoOfRecordsPopulated] INT
		,[NoOfRecordsDistinct] INT
		,[NoOfRecordsNull] INT
		,[NoOfRecordsBlank] INT
		,[Populated%] DECIMAL(25,2)
		,[Distinct%] DECIMAL(25,2)
		,[Null%] DECIMAL(25,2)
		,[Blank%] DECIMAL(25,2)
	)
	/*Insert Data Into Table*/
	INSERT INTO [ETLControl].[PersistTableQACalc_BIT]
	(
		[ID]
		,[TableName]
		,[ColumnNo]
		,[ColumnName]
		,[DataType]
		,[NoOfRecords]
		,[NoOfRecordsPopulated]
		,[NoOfRecordsDistinct]
		,[NoOfRecordsNull]
		,[NoOfRecordsBlank]
		,[Populated%]
		,[Distinct%]
		,[Null%]
		,[Blank%]
	)
	/*Get Data to Insert Into Table*/
	(
		SELECT *
		FROM 
			[ETLControl].[PersistTableQACalc]
		WHERE 
			[DataType] = 'bit'
	)
	;
	/*Drop Table that stored Persist tables Non BIT data*/
	DROP TABLE IF EXISTS 
		[ETLControl].[PersistTableQACalc_NotBIT]
	; 
	/*Create Table that stored Persist tables Non BIT data*/
	CREATE TABLE [ETLControl].[PersistTableQACalc_NotBIT]
	(
		[ID] INT 
		,[TableName] NVARCHAR(50)
		,[ColumnNo] INT 
		,[ColumnName] NVARCHAR(50)
		,[DataType] NVARCHAR(50)
		,[NoOfRecords] INT
		,[NoOfRecordsPopulated] INT
		,[NoOfRecordsDistinct] INT
		,[NoOfRecordsNull] INT
		,[NoOfRecordsBlank] INT
		,[Populated%] DECIMAL(25,2)
		,[Distinct%] DECIMAL(25,2)
		,[Null%] DECIMAL(25,2)
		,[Blank%] DECIMAL(25,2)
	)
	/*Insert Data Into Table*/
	INSERT INTO [ETLControl].[PersistTableQACalc_NotBIT]
	(
		[ID]
		,[TableName]
		,[ColumnNo]
		,[ColumnName]
		,[DataType]
		,[NoOfRecords]
		,[NoOfRecordsPopulated]
		,[NoOfRecordsDistinct]
		,[NoOfRecordsNull]
		,[NoOfRecordsBlank]
		,[Populated%]
		,[Distinct%]
		,[Null%]
		,[Blank%]
	)
	/*Get Data to Insert Into Table*/
	(
		SELECT *
		FROM 
			[ETLControl].[PersistTableQACalc]
		WHERE 
			[DataType] <> 'bit'
	)
	;
/*---------------------------------------------------------------------------------------------------*/
/*Step 4 Determine MIN, MAX & MEDIAN Values*/
/*---------------------------------------------------------------------------------------------------*/
	/*Drop Table that stored Persist tables Profiling Data*/
	DROP TABLE IF EXISTS 
		[ETLControl].[PersistTableQA]
	;
	/*Create Table that stored Persist tables Profiling Data*/
	CREATE TABLE [ETLControl].[PersistTableQA]
	(
		[ID] INT 
		,[TableName] NVARCHAR(50)
		,[ColumnNo] INT 
		,[ColumnName] NVARCHAR(50)
		,[DataType] NVARCHAR(50)
		,[NoOfRecords] INT
		,[NoOfRecordsPopulated] INT
		,[NoOfRecordsDistinct] INT
		,[NoOfRecordsNull] INT
		,[NoOfRecordsBlank] INT
		,[Populated%] DECIMAL(25,2)
		,[Distinct%] DECIMAL(25,2)
		,[Null%] DECIMAL(25,2)
		,[Blank%] DECIMAL(25,2)
		,[MinValue] NVARCHAR(50)
		,[MaxValue] NVARCHAR(50)
		,[Median] NVARCHAR(50)
	)
	;
	/*Insert Data Into Table*/
	INSERT INTO [ETLControl].[PersistTableQA]
	(
		[ID]
		,[TableName]
		,[ColumnNo]
		,[ColumnName]
		,[DataType]
		,[NoOfRecords]
		,[NoOfRecordsPopulated]
		,[NoOfRecordsDistinct]
		,[NoOfRecordsNull]
		,[NoOfRecordsBlank]
		,[Populated%]
		,[Distinct%]
		,[Null%]
		,[Blank%]
		,[MinValue]
		,[MaxValue]
		,[Median]
	)
	/*Get Data to Insert Into Table*/
	(
		SELECT *
		,'0'
		,'1'
		,''
		FROM 
			[ETLControl].[PersistTableQACalc_BIT]
	)
	;
	/*Declare Variable*/
	DECLARE @TableNameNB NVARCHAR(50);
	DECLARE @ColumnNameNB NVARCHAR(50);
	DECLARE @RowCountNB INT;
	DECLARE @RowIDNB INT = 1;
	;
	/*Set RowCount value*/
	SELECT @RowCountNB = COUNT(*) FROM [DAZUICOSQL01].[ETLControl].[PersistTableQACalc_NotBIT]
	;
	/*Declare Loop to run through each row*/
	WHILE @RowIDNB <= @RowCountNB
	/*Begin While Loop*/
	BEGIN 
		/*Set Variables*/
		SELECT 
			@TableNameNB = a.[TableName]
			,@ColumnNameNB = a.[ColumnName] 
		FROM 
			[DAZUICOSQL01].[ETLControl].[PersistTableQACalc_NotBIT] a
		WHERE 
			a.[ID] = @RowIDNB
		;
		/*Declare Variable that stores SQL script*/
		DECLARE @SQLScriptNB NVARCHAR(MAX)
		/*Set Variable that stores SQL script*/
		SET @SQLScriptNB = '
							WITH [CTENB]
							AS
							(
								SELECT *
									,(
										SELECT TOP(1)
											TRY_CAST(MIN(x.[' + @ColumnNameNB + ']) AS NVARCHAR)
										FROM 
											[Persist].[' + @TableNameNB + '] x
									)
									AS "MNV"
									,(
										SELECT TOP(1)
											TRY_CAST(MAX(y.[' + @ColumnNameNB + ']) AS NVARCHAR)
										FROM 
											[Persist].[' + @TableNameNB + '] y
									)
									AS "MXV"
									,CASE
										WHEN LOWER([DataType]) IN (''int'', ''bigint'', ''decimal'')
										THEN 
											(
												SELECT DISTINCT
												TRY_CAST(PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY z.[' + @ColumnNameNB + ']) OVER (PARTITION BY 1) AS NVARCHAR)
												FROM 
													[Persist].[' + @TableNameNB + '] z
											)
										ELSE ''''
									END AS "MDN"
								FROM 
									[ETLControl].[PersistTableQACalc_NotBIT]
								WHERE 
									[TableName] = ''' + @TableNameNB + ''' 
									AND 
									[ColumnName] = ''' + @ColumnNameNB + '''
							)
							/*Insert Data Into Table*/
							INSERT INTO [ETLControl].[PersistTableQA]
							(
								[ID]
								,[TableName]
								,[ColumnNo]
								,[ColumnName]
								,[DataType]
								,[NoOfRecords]
								,[NoOfRecordsPopulated]
								,[NoOfRecordsDistinct]
								,[NoOfRecordsNull]
								,[NoOfRecordsBlank]
								,[Populated%]
								,[Distinct%]
								,[Null%]
								,[Blank%]
								,[MinValue]
								,[MaxValue]
								,[Median]
							)
							(
								SELECT *
								FROM 
									[CTENB]
							)
							'
						/*Execute SQL script*/
		EXEC SP_EXECUTESQL @SQLScriptNB
		/*Increase Rounct by 1*/
		SET @RowIDNB += 1
	/*End While Loop*/
	END 
	;
/*---------------------------------------------------------------------------------------------------*/
/*Step 5: Clean Up Environment (removing un-used tables*/
/*---------------------------------------------------------------------------------------------------*/
	/*Drop Table that stores Persist Tables Metadata*/
	DROP TABLE IF EXISTS 
		[DAZUICOSQL01].[ETLControl].[GetPersistMetaData] 
	;	
	/*Drop Table that stored Persist tables coulmn counts*/
	DROP TABLE IF EXISTS 
		[DAZUICOSQL01].[ETLControl].[PersistTableQACalc]
	;
	/*Drop Table that stored Persist tables BIT data*/
	DROP TABLE IF EXISTS 
		[ETLControl].[PersistTableQACalc_BIT]
	; 
	DROP TABLE IF EXISTS 
		[ETLControl].[PersistTableQACalc_NotBIT]
	; 
GO

