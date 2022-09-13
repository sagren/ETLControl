

if (select object_id('Persist.CaseServiceHistory')) is null
CREATE TABLE [Persist].[CaseServiceHistory](
	[ID] [bigint] NOT NULL,
	[CASEID] [bigint] NULL,
	[DATEREQUESTED] [datetime] NULL,
	[ISACCEPTED] [bit] NULL,
	[ICARE_SERVICEID] [bigint] NULL,
	[ISPREFERONSITE] [bit] NULL,
	[EXTERNALPROVIDERID] [bigint] NULL,
	[EXTERNALREQUESTED] [bit] NULL,
	[EXTERNALSERVICEREQUEST] [nvarchar](50) NULL,
	[EXTERNALSERVICEREQUESTID] [bigint] NULL,
	[REQUESSTATUSID] [int] NULL,
	[ACCEPTED] [datetime] NULL,
	[ATTRIBUTE1] [nvarchar](50) NULL,
	[NOSESSIONAUTHORISED] [int] NULL,
	[REQUIRESAUTHORISATION] [bit] NULL,
	[NOSESSIONUSED] [int] NULL,
	[CONTRACTENTITLEMENTID] [int] NULL,
	[EXTERNALPROVIDERNAME] [nvarchar](250) NULL,
	[SESSIONNO] [nvarchar](50) NULL,
	[CREATEDUSERID] [int] NULL,
	[CREATED] [datetime] NULL,
	[REQUESTNO] [nvarchar](50) NULL,
	[PROVIDERUSERID] [int] NULL,
	[REQUESTSTATUSID] [int] NULL,
	[SERVICETYPE] [int] NULL,
	[SERVICETYPEID] [int] NULL,
	[PROVIDERTYPENAME] [nvarchar](100) NULL,
	[ISEXTERNALREPORTED] [bit] NULL,
	[EXTERNALREPORTED] [datetime] NULL,
	[ISFINALEXTERNALREPORTED] [bit] NULL,
	[FINALEXTERNALREPORTED] [datetime] NULL,
	[PPMESSAGE] [nvarchar](500) NULL,
	[PPISSUCCESSFUL] [bit] NULL,
	[PPMESSAGE_REPORT1] [nvarchar](max) NULL,
	[PPISSUCCESSFUL_REPORT1] [bit] NULL,
	[PPMESSAGE_REPORT2] [nvarchar](max) NULL,
	[PPISSUCCESSFUL_REPORT2] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL,
	[ValidFrom] [datetime2](7) NOT NULL,
	[ValidTo] [datetime2](7) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

if (select object_id('Persist.CaseService')) is null
CREATE TABLE [Persist].[CaseService](
	[ID] [bigint] NOT NULL,
	[CASEID] [bigint] NULL,
	[DATEREQUESTED] [datetime] NULL,
	[ISACCEPTED] [bit] NULL,
	[ICARE_SERVICEID] [bigint] NULL,
	[ISPREFERONSITE] [bit] NULL,
	[EXTERNALPROVIDERID] [bigint] NULL,
	[EXTERNALREQUESTED] [bit] NULL,
	[EXTERNALSERVICEREQUEST] [nvarchar](50) NULL,
	[EXTERNALSERVICEREQUESTID] [bigint] NULL,
	[REQUESSTATUSID] [int] NULL,
	[ACCEPTED] [datetime] NULL,
	[ATTRIBUTE1] [nvarchar](50) NULL,
	[NOSESSIONAUTHORISED] [int] NULL,
	[REQUIRESAUTHORISATION] [bit] NULL,
	[NOSESSIONUSED] [int] NULL,
	[CONTRACTENTITLEMENTID] [int] NULL,
	[EXTERNALPROVIDERNAME] [nvarchar](250) NULL,
	[SESSIONNO] [nvarchar](50) NULL,
	[CREATEDUSERID] [int] NULL,
	[CREATED] [datetime] NULL,
	[REQUESTNO] [nvarchar](50) NULL,
	[PROVIDERUSERID] [int] NULL,
	[REQUESTSTATUSID] [int] NULL,
	[SERVICETYPE] [int] NULL,
	[SERVICETYPEID] [int] NULL,
	[PROVIDERTYPENAME] [nvarchar](100) NULL,
	[ISEXTERNALREPORTED] [bit] NULL,
	[EXTERNALREPORTED] [datetime] NULL,
	[ISFINALEXTERNALREPORTED] [bit] NULL,
	[FINALEXTERNALREPORTED] [datetime] NULL,
	[PPMESSAGE] [nvarchar](500) NULL,
	[PPISSUCCESSFUL] [bit] NULL,
	[PPMESSAGE_REPORT1] [nvarchar](max) NULL,
	[PPISSUCCESSFUL_REPORT1] [bit] NULL,
	[PPMESSAGE_REPORT2] [nvarchar](max) NULL,
	[PPISSUCCESSFUL_REPORT2] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Persist].[CaseServiceHistory] )
)
GO

if (select object_id('Persist.CaseSessionInterventionHistory')) is null
CREATE TABLE [Persist].[CaseSessionInterventionHistory](
	[ID] [bigint] NOT NULL,
	[INTAKEASSESSMENTID] [bigint] NULL,
	[CASEID] [bigint] NULL,
	[CASESESSIONID] [bigint] NULL,
	[INTERVENTIONNO] [int] NULL,
	[REASONFORCISD] [nvarchar](500) NULL,
	[PROPOSEDINTERVENTIONDATE] [datetime] NULL,
	[PROPOSEDINTERVENTIONTIME] [datetime] NULL,
	[EXPECTEDNOOFPEOPLE] [int] NULL,
	[ACTUALNOOFPEOPLE] [int] NULL,
	[ALTERNATIVECONTACTPERSON] [nvarchar](150) NULL,
	[ALTERNATIVECONTACTNUMBER] [nvarchar](20) NULL,
	[TITLEOFEVENT] [nvarchar](150) NULL,
	[TARGETEDWELLNESSTYPEID] [int] NULL,
	[REQUIREMENTS] [nvarchar](1000) NULL,
	[ALLATTENDEESSIGNEDREGISTER] [bit] NULL,
	[ATTENDENCEREGISTER] [bit] NULL,
	[STATUSID] [int] NULL,
	[CREATEDDATETIME] [datetime] NULL,
	[REASONFORATTENDEESNOTSIGN] [nvarchar](max) NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL,
	[ValidFrom] [datetime2](7) NOT NULL,
	[ValidTo] [datetime2](7) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

if (select object_id('Persist.CaseSessionIntervention')) is null
CREATE TABLE [Persist].[CaseSessionIntervention](
	[ID] [bigint] NOT NULL,
	[INTAKEASSESSMENTID] [bigint] NULL,
	[CASEID] [bigint] NULL,
	[CASESESSIONID] [bigint] NULL,
	[INTERVENTIONNO] [int] NULL,
	[REASONFORCISD] [nvarchar](500) NULL,
	[PROPOSEDINTERVENTIONDATE] [datetime] NULL,
	[PROPOSEDINTERVENTIONTIME] [datetime] NULL,
	[EXPECTEDNOOFPEOPLE] [int] NULL,
	[ACTUALNOOFPEOPLE] [int] NULL,
	[ALTERNATIVECONTACTPERSON] [nvarchar](150) NULL,
	[ALTERNATIVECONTACTNUMBER] [nvarchar](20) NULL,
	[TITLEOFEVENT] [nvarchar](150) NULL,
	[TARGETEDWELLNESSTYPEID] [int] NULL,
	[REQUIREMENTS] [nvarchar](1000) NULL,
	[ALLATTENDEESSIGNEDREGISTER] [bit] NULL,
	[ATTENDENCEREGISTER] [bit] NULL,
	[STATUSID] [int] NULL,
	[CREATEDDATETIME] [datetime] NULL,
	[REASONFORATTENDEESNOTSIGN] [nvarchar](max) NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Persist].[CaseSessionInterventionHistory] )
)
GO

if (select object_id('Persist.CaseHistory')) is null
CREATE TABLE [Persist].[CaseHistory](
	[ID] [bigint] NOT NULL,
	[OPENDATETIME] [datetime] NULL,
	[OPENUSERID] [int] NULL,
	[CLOSEDATETIME] [datetime] NULL,
	[CLOSEUSERID] [int] NULL,
	[STATUS] [int] NULL,
	[CONTRACTID] [bigint] NULL,
	[CREATEDATETIME] [datetime] NULL,
	[CREATEUSERID] [int] NULL,
	[AUTHNUMBER] [nvarchar](50) NULL,
	[CASETYPEID] [int] NULL,
	[EMPLOYEEID] [bigint] NULL,
	[UPDATEUSERID] [int] NULL,
	[UPDATEDATETIME] [datetime] NULL,
	[CASECATEGORYID] [int] NULL,
	[CASESTATUSID] [int] NULL,
	[PREFERLANGUAGE] [int] NULL,
	[PREFERGENDER] [int] NULL,
	[NEWINTAKEASSESMENTID] [bigint] NULL,
	[ICARE_CATEGORYID] [int] NULL,
	[CASEREFERENCE] [nvarchar](50) NULL,
	[EMPLOYEEDEPENDANTID] [bigint] NULL,
	[ICARE_SERVICEID] [bigint] NULL,
	[INTAKEASSESSMENTID] [bigint] NULL,
	[DESCRIPTION] [nvarchar](250) NULL,
	[COMPANYID] [bigint] NULL,
	[COMPANYSITEID] [bigint] NULL,
	[EMPLOYEELEVELID] [int] NULL,
	[TENUREID] [int] NULL,
	[PROBLEMCATEGORYID] [int] NULL,
	[PROBLEMTYPEID] [bigint] NULL,
	[RISKTYPEID] [int] NULL,
	[RISKLEVELID] [int] NULL,
	[RISKDEFINITIONID] [int] NULL,
	[CASECLOSUREID] [int] NULL,
	[INTAKEPERSONID] [int] NULL,
	[CLOSURENOTES] [nvarchar](max) NULL,
	[TRACKINGSTATUSID] [int] NULL,
	[REQUESTACTIONID] [int] NULL,
	[CASEMANAGER] [int] NULL,
	[TEAMLEADER] [int] NULL,
	[ISOPTOUT] [bit] NULL,
	[PROJECTCODE] [nvarchar](50) NULL,
	[CASEUSERID] [int] NULL,
	[ISMAINCASE] [bit] NULL,
	[SENDNOTIFICATIONS] [bit] NULL,
	[CASENUMBER] [int] NULL,
	[CASEMANAGERID] [int] NULL,
	[TEAMLEADERID] [int] NULL,
	[RISKCONSULTANTID] [int] NULL,
	[CARECONSULTANTID] [int] NULL,
	[EXTERNALPROVIDERID] [int] NULL,
	[CLINICALADMINID] [int] NULL,
	[HASCASEMANAGERACCEPT] [bit] NULL,
	[HASTEAMLEADERACCEPT] [bit] NULL,
	[HASRISKCONSULTANTACCEPT] [bit] NULL,
	[HASCARECONSULTANTACCEPT] [bit] NULL,
	[HASEXTERNALPROVIDERACCEPT] [bit] NULL,
	[HASCLINICALADMINACCEPT] [bit] NULL,
	[ISALLCASEMANAGERS] [bit] NULL,
	[ISALLTEAMLEADERS] [bit] NULL,
	[ISALLRISKCONSULTANT] [bit] NULL,
	[ISALLCARECONSULTANT] [bit] NULL,
	[ISALLCLINICALADMIN] [bit] NULL,
	[REASONFORESCALATIONID] [int] NULL,
	[NOTESFORESCALATIONORASSIGN] [nvarchar](500) NULL,
	[REASONFORASSIGMENTID] [int] NULL,
	[ISALLLEGALAFFILIATES] [bit] NULL,
	[LEGALUSERID] [int] NULL,
	[HASLEGALUSERACCEPT] [bit] NULL,
	[ISALLFINANCIALAFFILIATES] [bit] NULL,
	[FINANCIALUSERID] [int] NULL,
	[HASFINANCIALUSERACCEPT] [bit] NULL,
	[WORKSTAGEID] [int] NULL,
	[ASSIGNMENTSTATUSID] [int] NULL,
	[QA_DONE] [bit] NULL,
	[ISALLBUSINESSMANAGER] [bit] NULL,
	[BUSINESSMANAGERID] [int] NULL,
	[HASBUSINESSMANAGERACCEPT] [bit] NULL,
	[CASEREFTEXT] [nvarchar](150) NULL,
	[ISELIGIBLE] [bit] NULL,
	[CLASSIFICATIONID] [int] NULL,
	[CLINICID] [bigint] NULL,
	[HASSPECIALRATE] [bit] NULL,
	[RATE] [decimal](37, 8) NULL,
	[SERVICESTATUSID] [int] NULL,
	[BUSINESSUNITID] [bigint] NULL,
	[REGIONID] [bigint] NULL,
	[DEPARTMENTID] [bigint] NULL,
	[RISKLEVELCHANGEDON] [datetime] NULL,
	[CASELINKID] [int] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL,
	[ValidFrom] [datetime2](7) NOT NULL,
	[ValidTo] [datetime2](7) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

if (select object_id('Persist.Case')) is null
CREATE TABLE [Persist].[Case](
	[ID] [bigint] NOT NULL,
	[OPENDATETIME] [datetime] NULL,
	[OPENUSERID] [int] NULL,
	[CLOSEDATETIME] [datetime] NULL,
	[CLOSEUSERID] [int] NULL,
	[STATUS] [int] NULL,
	[CONTRACTID] [bigint] NULL,
	[CREATEDATETIME] [datetime] NULL,
	[CREATEUSERID] [int] NULL,
	[AUTHNUMBER] [nvarchar](50) NULL,
	[CASETYPEID] [int] NULL,
	[EMPLOYEEID] [bigint] NULL,
	[UPDATEUSERID] [int] NULL,
	[UPDATEDATETIME] [datetime] NULL,
	[CASECATEGORYID] [int] NULL,
	[CASESTATUSID] [int] NULL,
	[PREFERLANGUAGE] [int] NULL,
	[PREFERGENDER] [int] NULL,
	[NEWINTAKEASSESMENTID] [bigint] NULL,
	[ICARE_CATEGORYID] [int] NULL,
	[CASEREFERENCE] [nvarchar](50) NULL,
	[EMPLOYEEDEPENDANTID] [bigint] NULL,
	[ICARE_SERVICEID] [bigint] NULL,
	[INTAKEASSESSMENTID] [bigint] NULL,
	[DESCRIPTION] [nvarchar](250) NULL,
	[COMPANYID] [bigint] NULL,
	[COMPANYSITEID] [bigint] NULL,
	[EMPLOYEELEVELID] [int] NULL,
	[TENUREID] [int] NULL,
	[PROBLEMCATEGORYID] [int] NULL,
	[PROBLEMTYPEID] [bigint] NULL,
	[RISKTYPEID] [int] NULL,
	[RISKLEVELID] [int] NULL,
	[RISKDEFINITIONID] [int] NULL,
	[CASECLOSUREID] [int] NULL,
	[INTAKEPERSONID] [int] NULL,
	[CLOSURENOTES] [nvarchar](max) NULL,
	[TRACKINGSTATUSID] [int] NULL,
	[REQUESTACTIONID] [int] NULL,
	[CASEMANAGER] [int] NULL,
	[TEAMLEADER] [int] NULL,
	[ISOPTOUT] [bit] NULL,
	[PROJECTCODE] [nvarchar](50) NULL,
	[CASEUSERID] [int] NULL,
	[ISMAINCASE] [bit] NULL,
	[SENDNOTIFICATIONS] [bit] NULL,
	[CASENUMBER] [int] NULL,
	[CASEMANAGERID] [int] NULL,
	[TEAMLEADERID] [int] NULL,
	[RISKCONSULTANTID] [int] NULL,
	[CARECONSULTANTID] [int] NULL,
	[EXTERNALPROVIDERID] [int] NULL,
	[CLINICALADMINID] [int] NULL,
	[HASCASEMANAGERACCEPT] [bit] NULL,
	[HASTEAMLEADERACCEPT] [bit] NULL,
	[HASRISKCONSULTANTACCEPT] [bit] NULL,
	[HASCARECONSULTANTACCEPT] [bit] NULL,
	[HASEXTERNALPROVIDERACCEPT] [bit] NULL,
	[HASCLINICALADMINACCEPT] [bit] NULL,
	[ISALLCASEMANAGERS] [bit] NULL,
	[ISALLTEAMLEADERS] [bit] NULL,
	[ISALLRISKCONSULTANT] [bit] NULL,
	[ISALLCARECONSULTANT] [bit] NULL,
	[ISALLCLINICALADMIN] [bit] NULL,
	[REASONFORESCALATIONID] [int] NULL,
	[NOTESFORESCALATIONORASSIGN] [nvarchar](500) NULL,
	[REASONFORASSIGMENTID] [int] NULL,
	[ISALLLEGALAFFILIATES] [bit] NULL,
	[LEGALUSERID] [int] NULL,
	[HASLEGALUSERACCEPT] [bit] NULL,
	[ISALLFINANCIALAFFILIATES] [bit] NULL,
	[FINANCIALUSERID] [int] NULL,
	[HASFINANCIALUSERACCEPT] [bit] NULL,
	[WORKSTAGEID] [int] NULL,
	[ASSIGNMENTSTATUSID] [int] NULL,
	[QA_DONE] [bit] NULL,
	[ISALLBUSINESSMANAGER] [bit] NULL,
	[BUSINESSMANAGERID] [int] NULL,
	[HASBUSINESSMANAGERACCEPT] [bit] NULL,
	[CASEREFTEXT] [nvarchar](150) NULL,
	[ISELIGIBLE] [bit] NULL,
	[CLASSIFICATIONID] [int] NULL,
	[CLINICID] [bigint] NULL,
	[HASSPECIALRATE] [bit] NULL,
	[RATE] [decimal](37, 8) NULL,
	[SERVICESTATUSID] [int] NULL,
	[BUSINESSUNITID] [bigint] NULL,
	[REGIONID] [bigint] NULL,
	[DEPARTMENTID] [bigint] NULL,
	[RISKLEVELCHANGEDON] [datetime] NULL,
	[CASELINKID] [int] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Persist].[CaseHistory] )
)
GO


if (select object_id('Persist.CompanyHistory')) is null
CREATE TABLE [Persist].[CompanyHistory](
	[ID] [bigint] NOT NULL,
	[NAME] [nvarchar](150) NULL,
	[VATNUMBER] [nvarchar](10) NULL,
	[REGISTRATIONNUMBER] [nvarchar](50) NULL,
	[ADDRESS] [nvarchar](1000) NULL,
	[ISACTIVE] [bit] NULL,
	[CREATEUSERID] [int] NULL,
	[CREATEDATETIME] [datetime] NULL,
	[MODIFYUSERID] [int] NULL,
	[MODIFYDATETIME] [datetime] NULL,
	[INDUSTRYSECTORID] [bigint] NULL,
	[HOLDINGCOMPANYID] [bigint] NULL,
	[FINYEARENDMONTH] [int] NULL,
	[HEADCOUNT] [int] NULL,
	[INDUSTRYID] [bigint] NULL,
	[SECTORID] [bigint] NULL,
	[BROKERCOMPANYID] [bigint] NULL,
	[PARENTCOMPANYID] [bigint] NULL,
	[BUSINESSMANAGERSTAFFID] [bigint] NULL,
	[ALERT] [nvarchar](500) NULL,
	[ISHOLDINGCOMPANY] [bit] NULL,
	[ISBROKER] [bit] NULL,
	[OVERALLCOMPANYHEADCOUNT] [bigint] NULL,
	[COMPANYTYPEID] [int] NULL,
	[ISEMPTY] [bit] NULL,
	[CHILDTOTALHEADCOUNT] [bigint] NULL,
	[RECORDSTATUSID] [int] NULL,
	[ISDELETED] [bit] NULL,
	[COMPANYCODE] [nvarchar](20) NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL,
	[ValidFrom] [datetime2](7) NOT NULL,
	[ValidTo] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.Company')) is null
CREATE TABLE [Persist].[Company](
	[ID] [bigint] NOT NULL,
	[NAME] [nvarchar](150) NULL,
	[VATNUMBER] [nvarchar](10) NULL,
	[REGISTRATIONNUMBER] [nvarchar](50) NULL,
	[ADDRESS] [nvarchar](1000) NULL,
	[ISACTIVE] [bit] NULL,
	[CREATEUSERID] [int] NULL,
	[CREATEDATETIME] [datetime] NULL,
	[MODIFYUSERID] [int] NULL,
	[MODIFYDATETIME] [datetime] NULL,
	[INDUSTRYSECTORID] [bigint] NULL,
	[HOLDINGCOMPANYID] [bigint] NULL,
	[FINYEARENDMONTH] [int] NULL,
	[HEADCOUNT] [int] NULL,
	[INDUSTRYID] [bigint] NULL,
	[SECTORID] [bigint] NULL,
	[BROKERCOMPANYID] [bigint] NULL,
	[PARENTCOMPANYID] [bigint] NULL,
	[BUSINESSMANAGERSTAFFID] [bigint] NULL,
	[ALERT] [nvarchar](500) NULL,
	[ISHOLDINGCOMPANY] [bit] NULL,
	[ISBROKER] [bit] NULL,
	[OVERALLCOMPANYHEADCOUNT] [bigint] NULL,
	[COMPANYTYPEID] [int] NULL,
	[ISEMPTY] [bit] NULL,
	[CHILDTOTALHEADCOUNT] [bigint] NULL,
	[RECORDSTATUSID] [int] NULL,
	[ISDELETED] [bit] NULL,
	[COMPANYCODE] [nvarchar](20) NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Persist].[CompanyHistory] )
)
GO

if (select object_id('Persist.AccessMethod')) is null
CREATE TABLE [Persist].[AccessMethod](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](50) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.AgeGroup')) is null
CREATE TABLE [Persist].[AgeGroup](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](50) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[FROMYEAR] [int] NULL,
	[TOYEAR] [int] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.Assessment')) is null
CREATE TABLE [Persist].[Assessment](
	[ID] [bigint] NOT NULL,
	[PROBLEMCATEGORYID] [int] NULL,
	[PROBLEMTYPEID] [bigint] NULL,
	[RISKTYPEID] [bigint] NULL,
	[RISKLEVELID] [int] NULL,
	[RISKDEFINITIONID] [int] NULL,
	[EMOTIONALSTATEID] [int] NULL,
	[WORKIMPACTID] [int] NULL,
	[ISIMPACTFUNCTION] [bit] NULL,
	[ISIMPACTATTENDANCE] [bit] NULL,
	[ISIMPACTABILITY] [bit] NULL,
	[ISIMPACTRELATIONSHIP] [bit] NULL,
	[ISIMPACTJOBSATISIFACTION] [bit] NULL,
	[ISIMPACTMOTIVATION] [bit] NULL,
	[ISIMPACTMANAGERRELATIONSHIP] [bit] NULL,
	[ISIMPACTFREQUENTERRORS] [bit] NULL,
	[ISIMPACTDEADLINES] [bit] NULL,
	[ISIMPACTWORKFUNCTIONING] [int] NULL,
	[ISIMPACTCONCENTRATIONLEVELS] [int] NULL,
	[CREATEDBY] [int] NULL,
	[CREATEDDATE] [datetime] NULL,
	[CASEID] [bigint] NULL,
	[CASESERVICEID] [bigint] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.BasicStatus')) is null
CREATE TABLE [Persist].[BasicStatus](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](50) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[ISCOMPLETED] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.CallerRoleType')) is null
CREATE TABLE [Persist].[CallerRoleType](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](50) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.CaseClientSatisfactionSurvey')) is null
CREATE TABLE [Persist].[CaseClientSatisfactionSurvey](
	[ID] [bigint] NOT NULL,
	[CASEID] [bigint] NULL,
	[SERVICE_NEUTRAL] [bit] NULL,
	[SERVIC_SATISFIED] [bit] NULL,
	[PROBLEM_DECLINE] [bit] NULL,
	[COPINGBETTER_WORSE] [bit] NULL,
	[COPINGBETTER_SAME] [bit] NULL,
	[COPINGBETTER_BETTER] [bit] NULL,
	[FUTURESERVICE_NO] [bit] NULL,
	[CREATEDON] [datetime] NULL,
	[COPING_WORSE] [bit] NULL,
	[RECOMMENDSERVICE_YES] [bit] NULL,
	[SERVICE] [nvarchar](50) NULL,
	[PROBLEM] [nvarchar](50) NULL,
	[COPING] [nvarchar](50) NULL,
	[FUTURESERVICE] [nvarchar](50) NULL,
	[RECOMMENDSERVICE] [nvarchar](50) NULL,
	[COMPLETEDBY] [int] NULL,
	[COMPLETEDON] [datetime] NULL,
	[KNOWLEDGESKILL] [nvarchar](50) NULL,
	[COMMENT] [nvarchar](500) NULL,
	[SCORE] [int] NULL,
	[ISSENDTOCLIENT] [bit] NULL,
	[INTAKEPERSONID] [bigint] NULL,
	[INTAKEPERSONNAME] [nvarchar](200) NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.CaseClosure')) is null
CREATE TABLE [Persist].[CaseClosure](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](50) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[ISBILLABLE] [bit] NULL,
	[IS_EVENT] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.CaseInterventionAddress')) is null
CREATE TABLE [Persist].[CaseInterventionAddress](
	[ID] [bigint] NOT NULL,
	[INTAKEASSESSMENTID] [bigint] NULL,
	[CASEID] [bigint] NULL,
	[INTERVENTIONADDRESS] [nvarchar](150) NULL,
	[LOCATION] [nvarchar](250) NULL,
	[LATITUDE] [decimal](37, 8) NULL,
	[LONGITUDE] [decimal](37, 8) NULL,
	[UNITNUMBER] [nvarchar](50) NULL,
	[STREETNAME] [nvarchar](250) NULL,
	[PROVINCEID] [int] NULL,
	[COUNTRYID] [int] NULL,
	[HASCONTRACTSECURED] [bit] NULL,
	[RATIONALFORNOCONTRACT] [nvarchar](1000) NULL,
	[FACILITATORNAME] [nvarchar](150) NULL,
	[FACILITATORCONTACTNUMBER] [nvarchar](20) NULL,
	[FACILITATOREMAILADDRESS] [nvarchar](250) NULL,
	[EVENTFACILITATORID] [int] NULL,
	[CASEMANAGEMENTBY] [nvarchar](50) NULL,
	[WHOWILLARRANGEFACILITATOR] [nvarchar](50) NULL,
	[ASSIGNNOTES] [nvarchar](max) NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

if (select object_id('Persist.CaseLink')) is null
CREATE TABLE [Persist].[CaseLink](
	[ID] [bigint] NOT NULL,
	[CREATEDBY] [int] NULL,
	[CREATEDON] [datetime] NULL,
	[ISACTIVE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.CasePreferenceCriteria')) is null
CREATE TABLE [Persist].[CasePreferenceCriteria](
	[ID] [bigint] NOT NULL,
	[CASEID] [bigint] NULL,
	[DELIVERYMETHODID] [int] NULL,
	[LOCATION] [nvarchar](250) NULL,
	[LATITUDE] [decimal](18, 0) NULL,
	[LONGITUDE] [decimal](18, 0) NULL,
	[PREFERGENDERID] [int] NULL,
	[PREFERLANGUAGEID] [int] NULL,
	[ETHNICITYID] [int] NULL,
	[PROVINCEID] [int] NULL,
	[AFFILIATEAGE] [int] NULL,
	[DEPENDENTAGE] [int] NULL,
	[CREATEDUSERID] [int] NULL,
	[CREATED] [datetime] NULL,
	[CASESESSIONID] [bigint] NULL,
	[ISGENDERFACTOR] [bit] NULL,
	[ISLANGUAGEFACTOR] [bit] NULL,
	[ISETHNICITYFACTOR] [bit] NULL,
	[ADDITIONALSESSIONSNEEDED] [int] NULL,
	[RECOMMENDATION] [nvarchar](max) NULL,
	[ISRELIGIONFACTOR] [bit] NULL,
	[RELIGIONID] [int] NULL,
	[SERVICETYPEID] [int] NULL,
	[PROVIDERTYPENAME] [nvarchar](250) NULL,
	[LOCATION_1] [nvarchar](250) NULL,
	[LATITUDE_1] [decimal](18, 0) NULL,
	[LONGITUDE_1] [decimal](18, 0) NULL,
	[LOCATION_2] [nvarchar](250) NULL,
	[LATITUDE_2] [decimal](18, 0) NULL,
	[LONGITUDE_2] [decimal](18, 0) NULL,
	[LOCATION_3] [nvarchar](250) NULL,
	[LATITUDE_3] [decimal](18, 0) NULL,
	[LONGITUDE_3] [decimal](18, 0) NULL,
	[EXCLUDEAGEGROUPID] [int] NULL,
	[EXCLUDECOUNSELLINGMETHODID] [bigint] NULL,
	[EXCLUDEPROVIDERTYPEID] [bigint] NULL,
	[EXCLUDEPROVIDERTYPENAME] [nvarchar](50) NULL,
	[PROVIDERTYPEID] [bigint] NULL,
	[HCSERVICEID] [bigint] NULL,
	[SPECIALITYTYPEID] [bigint] NULL,
	[EXCLUDESPECIALITYTYPEID] [bigint] NULL,
	[EXCLUDESPECIALITYTYPENAME] [nvarchar](50) NULL,
	[USELOCATION1] [bit] NULL,
	[USELOCATION2] [bit] NULL,
	[USELOCATION3] [bit] NULL,
	[DAYOFWEEKID] [int] NULL,
	[ISWEEKENDS	] [bit] NULL,
	[ANYWEEKDAY	] [bit] NULL,
	[OTHERTIMESLOT] [nvarchar](150) NULL,
	[ISANYWEEKDAY] [bit] NULL,
	[ISONLYWEEKENDS] [bit] NULL,
	[OTHERNOTES] [nvarchar](250) NULL,
	[TIMESLOTSID] [int] NULL,
	[INTAKEASSESSMENTID] [bigint] NULL,
	[CLINICID] [bigint] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

if (select object_id('Persist.CaseSession')) is null
CREATE TABLE [Persist].[CaseSession](
	[ID] [bigint] NOT NULL,
	[FA_DETAIL] [bigint] NULL,
	[CONTACTMETHOD] [bigint] NULL,
	[SESSIONDATE] [datetime] NULL,
	[SESSIONTIME] [datetime] NULL,
	[SESSIONSTATUS] [int] NULL,
	[CASE] [bigint] NULL,
	[SESSIONCLOSEDDATETIME] [datetime] NULL,
	[UPDATEUSERID] [int] NULL,
	[UPDATEDATETIME] [datetime] NULL,
	[CREATEDUSERID] [int] NULL,
	[CREATEDDATETIME] [datetime] NULL,
	[CASEID] [bigint] NULL,
	[SESSIONSTATUSID] [int] NULL,
	[SESSIONNO] [bigint] NULL,
	[SESSIONREF] [nvarchar](50) NULL,
	[SESSIONINTERNAL] [bit] NULL,
	[SESSIONUSERID] [int] NULL,
	[EMOTIONALSTATEID] [int] NULL,
	[RECOMENDATIONID] [int] NULL,
	[RECOMMENDATIONID] [int] NULL,
	[CASESERVICEID] [bigint] NULL,
	[PROVIDERNAME] [nvarchar](250) NULL,
	[NOTE] [nvarchar](1000) NULL,
	[PROBLEMCATEGORYID] [int] NULL,
	[PROBLEMTYPEID] [bigint] NULL,
	[RISKTYPEID] [int] NULL,
	[WORKIMPACTID] [int] NULL,
	[ASSESSMENTID] [bigint] NULL,
	[PROBLEMTYPEDESCRIPTION] [nvarchar](max) NULL,
	[REASONFORESCALATIONID] [int] NULL,
	[REFERENTITYID] [int] NULL,
	[NOTESFORESCALATION] [nvarchar](500) NULL,
	[TREATMENTSUGGESTIONID] [int] NULL,
	[SESSIONDURATIONID] [int] NULL,
	[ADDITIONALSESSIONSNEEDED] [int] NULL,
	[RECOMMENDATION] [nvarchar](max) NULL,
	[CASEMANAGERID] [int] NULL,
	[CM_ACCEPT] [bit] NULL,
	[CM_REASSIGN] [bit] NULL,
	[TEAMLEADERID] [int] NULL,
	[BILLINGCODE] [nvarchar](50) NULL,
	[ISLATEST] [bit] NULL,
	[HASATTENDED] [bit] NULL,
	[SESSIONUSERNO] [bigint] NULL,
	[SESSIONEXTERNAL] [bit] NULL,
	[DELIVERYMETHODID] [int] NULL,
	[SESSIONCLOSUREID] [int] NULL,
	[CLOSURENOTES] [nvarchar](max) NULL,
	[SESSIONOUTCOMEID] [int] NULL,
	[RISKLEVELID] [int] NULL,
	[HASRISKLEVELCHANGED] [bit] NULL,
	[CONTACTATTEMPTCOUNT] [int] NULL,
	[QA_DONE] [bit] NULL,
	[SESSIONCLOSEDBY] [int] NULL,
	[ISCONSENTFORMSIGNED] [bit] NULL,
	[ISREFERRALFORMSIGNED] [bit] NULL,
	[CONSENTFORMOPTIONID] [int] NULL,
	[CLINICID] [bigint] NULL,
	[HASSPECIALRATE] [bit] NULL,
	[RATE] [decimal](37, 8) NULL,
	[LOCATIONID] [bigint] NULL,
	[REASONNOTSIGNEDID] [int] NULL,
	[ISSTATEMENTSIGNED] [bit] NULL,
	[ISSIGNEDID] [int] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

if (select object_id('Persist.CaseSessionNotes')) is null
CREATE TABLE [Persist].[CaseSessionNotes](
	[ID] [bigint] NOT NULL,
	[CASEID] [bigint] NULL,
	[CASESESSIONID] [bigint] NULL,
	[NOTE] [nvarchar](max) NULL,
	[CREATED] [datetime] NULL,
	[CREATEDUSERID] [int] NULL,
	[ISDELETED] [bit] NULL,
	[ISLOCKED] [bit] NULL,
	[SESSIONNOTETYPEID] [int] NULL,
	[CASENOTETYPEID] [int] NULL,
	[DELETEDBY] [int] NULL,
	[DELETEDON] [datetime] NULL,
	[CONTACTNUMBERS] [nvarchar](500) NULL,
	[ISPRIVATE] [bit] NULL,
	[OUTBOUNDREQUESTID] [bigint] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

if (select object_id('Persist.CaseUser')) is null
CREATE TABLE [Persist].[CaseUser](
	[ID] [bigint] NOT NULL,
	[CASEID] [bigint] NULL,
	[ROLEID] [bigint] NULL,
	[USERID] [bigint] NULL,
	[ISACCEPTED] [bit] NULL,
	[LOCATIONID] [bigint] NULL,
	[ACCEPTEDON] [datetime] NULL,
	[CREATEDON] [datetime] NULL,
	[ISWATCHERONLY] [bit] NULL,
	[ISEVENTFACILITATOR] [bit] NULL,
	[ISASSIGNED] [bit] NULL,
	[ISREASSIGNED] [bit] NULL,
	[ASSIGNEDBY] [bigint] NULL,
	[ISESCALATED] [bit] NULL,
	[CREATEDBY] [bigint] NULL,
	[ISCREATEDUSER] [bit] NULL,
	[ISCASEMANAGER] [bit] NULL,
	[ETLExecutionKey] [varchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.Clinic')) is null
CREATE TABLE [Persist].[Clinic](
	[ID] [bigint] NOT NULL,
	[NAME] [nvarchar](250) NULL,
	[LINKEDAFFILIATES] [int] NULL,
	[ADDRESS] [nvarchar](250) NULL,
	[LATITUDE] [decimal](37, 8) NULL,
	[LONGITUDE] [decimal](37, 8) NULL,
	[CREATEDBY] [int] NULL,
	[CREATEDON] [datetime] NULL,
	[ISACTIVE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.ClinicCompanyContract')) is null
CREATE TABLE [Persist].[ClinicCompanyContract](
	[ID] [bigint] NOT NULL,
	[CLINICID] [bigint] NULL,
	[COMPANYID] [bigint] NULL,
	[CONTRACTID] [bigint] NULL,
	[STARTDATE] [datetime] NULL,
	[ENDDATE] [datetime] NULL,
	[CLINICSTATUSID] [int] NULL,
	[ETLExexutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.CompanyBusinessUnit')) is null
CREATE TABLE [Persist].[CompanyBusinessUnit](
	[ID] [bigint] NOT NULL,
	[BUSINESSUNITNAME] [nvarchar](250) NULL,
	[COMPANYID] [bigint] NULL,
	[HEADCOUNT] [int] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.CompanyDepartment')) is null
CREATE TABLE [Persist].[CompanyDepartment](
	[ID] [bigint] NOT NULL,
	[DIVISIONNAME] [nvarchar](50) NULL,
	[DEPARTMENTNAME] [nvarchar](250) NULL,
	[COMPANYID] [bigint] NULL,
	[HEADCOUNT] [int] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO



if (select object_id('Persist.CompanyRegion')) is null
CREATE TABLE [Persist].[CompanyRegion](
	[ID] [bigint] NOT NULL,
	[REGIONNAME] [nvarchar](250) NULL,
	[COMPANYID] [bigint] NULL,
	[HEADCOUNT] [int] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.CompanySite')) is null
CREATE TABLE [Persist].[CompanySite](
	[ID] [bigint] NOT NULL,
	[COMPANYID] [bigint] NULL,
	[HEADCOUNT] [int] NULL,
	[SITENAME] [nvarchar](250) NULL,
	[ADDRESS] [varchar](2000) NULL,
	[LATITUDE] [decimal](37, 8) NULL,
	[LONGITUDE] [decimal](37, 8) NULL,
	[CREATEDUSERID] [int] NULL,
	[CREATEDDATETIME] [datetime] NULL,
	[MODIFIEDUSERID] [int] NULL,
	[MODIFIEDDATETIME] [datetime] NULL,
	[MAPURL] [nvarchar](200) NULL,
	[COMPANYREGIONID] [bigint] NULL,
	[COMPANYDIVISIONID] [bigint] NULL,
	[ISACTIVE] [bit] NULL,
	[BUSINESSMANAGERSTAFFID] [bigint] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.ContractEntitlement')) is null
CREATE TABLE [Persist].[ContractEntitlement](
	[ID] [bigint] NOT NULL,
	[CONTRACTID] [bigint] NULL,
	[SERVICEID] [bigint] NULL,
	[DEFAULTSESSIONCOUNT] [int] NULL,
	[DESCRIPTION] [nvarchar](50) NULL,
	[CREATEDBY] [int] NULL,
	[DATETIMECREATED] [datetime] NULL,
	[UPDATEDBY] [int] NULL,
	[DATETIMEUPDATED] [datetime] NULL,
	[ISACTIVE] [bit] NULL,
	[ICARE_SERVICEID] [bigint] NULL,
	[SESSIONLIMIT] [int] NULL,
	[ANNUALLIMIT] [int] NULL,
	[FEEFORSERVICE] [decimal](37, 8) NULL,
	[CASESESSIONLIMIT] [int] NULL,
	[FEEFORSERVICERATE] [decimal](37, 8) NULL,
	[FEEFORSERVICEANNUALLIMIT] [int] NULL,
	[ADHOCRATE] [decimal](37, 8) NULL,
	[HCSERVICEID] [bigint] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.DeliveryMethod')) is null
CREATE TABLE [Persist].[DeliveryMethod](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](100) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.DI_CompanyProgram')) is null
CREATE TABLE [Persist].[DI_CompanyProgram](
	[CompanyID] [bigint] NOT NULL,
	[ProgramName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


if (select object_id('Persist.EmotionalState')) is null
CREATE TABLE [Persist].[EmotionalState](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](50) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.Employee')) is null
CREATE TABLE [Persist].[Employee](
	[ID] [bigint] NOT NULL,
	[COMPANYID] [bigint] NULL,
	[EMPLOYEETYPEID] [bigint] NULL,
	[EMPLOYMENTTYPEID] [bigint] NULL,
	[TITLEID] [bigint] NULL,
	[EMPLOYEENUMBER] [nvarchar](50) NULL,
	[INITIALS] [nvarchar](50) NULL,
	[FIRSTNAME] [nvarchar](100) NULL,
	[LASTNAME] [nvarchar](100) NULL,
	[IDNUMBER] [nvarchar](50) NULL,
	[NUMBEROFDEPENDANTS] [bigint] NULL,
	[TAXNUMBER] [nvarchar](50) NULL,
	[ADDRESS_PRIMARY] [nvarchar](2000) NULL,
	[LATITUDE] [decimal](37, 8) NULL,
	[LONGITUDE] [decimal](37, 8) NULL,
	[ADDRESS_SECONDARY] [nvarchar](2000) NULL,
	[LANGUAGEID] [bigint] NULL,
	[ETHNICITYID] [bigint] NULL,
	[MARITALSTATUSID] [bigint] NULL,
	[BUSINESSUNIT] [nvarchar](250) NULL,
	[REGION] [nvarchar](250) NULL,
	[DEPARTMENT] [nvarchar](250) NULL,
	[GENDERID] [bigint] NULL,
	[DOB] [datetime] NULL,
	[TELEPHONE] [nvarchar](20) NULL,
	[TELEPHONE_WORK] [nvarchar](20) NULL,
	[TELEPHONE_AIT] [nvarchar](20) NULL,
	[TELEPHONE_FAX] [nvarchar](20) NULL,
	[TELEPHONE_MOBILE] [nvarchar](20) NULL,
	[EMAIL] [nvarchar](250) NULL,
	[MEDICALAIDNAME] [nvarchar](50) NULL,
	[MEDICALAIDNUMBER] [nvarchar](50) NULL,
	[RELATIONSHIPID] [bigint] NULL,
	[EDUCATIONLEVELID] [bigint] NULL,
	[EMPLOMENTSTARTDATE] [datetime] NULL,
	[EMPLOMENTENDDATE] [datetime] NULL,
	[CREATEUSERID] [bigint] NULL,
	[CREATEDATETIME] [datetime] NULL,
	[MODIFYUSERID] [bigint] NULL,
	[MODIFYDATETIME] [datetime] NULL,
	[ISACTIVE] [bit] NULL,
	[COMPANYSITEID] [bigint] NULL,
	[BUSINESSUNITID] [bigint] NULL,
	[REGIONID] [bigint] NULL,
	[DEPARTMENTID] [bigint] NULL,
	[PICTURE] [varbinary](max) NULL,
	[PASSPORTNUMBER] [nvarchar](50) NULL,
	[REQUIRESREVIEW] [bit] NULL,
	[INTAKECREATED] [bit] NULL,
	[DISPLAYNAME] [nvarchar](250) NULL,
	[ISANONYMOUS] [bit] NULL,
	[EMPLOYEELEVELID] [bigint] NULL,
	[TENUREID] [bigint] NULL,
	[EMPLOYEEGRADEID] [bigint] NULL,
	[ISDEPENDANT] [bit] NULL,
	[AGEGROUPID] [bigint] NULL,
	[ETLExecutionKey] [varchar](20) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

if (select object_id('Persist.EmployeeDependant')) is null
CREATE TABLE [Persist].[EmployeeDependant](
	[ID] [bigint] NOT NULL,
	[EMPLOYEEID] [bigint] NULL,
	[INITIALS] [nvarchar](50) NULL,
	[FIRSTNAME] [nvarchar](50) NULL,
	[LASTNAME] [nvarchar](50) NULL,
	[IDNUMBER] [nvarchar](50) NULL,
	[ETHNICITYID] [int] NULL,
	[GENDERID] [int] NULL,
	[LANGUAGEID] [int] NULL,
	[MARITALSTATUSID] [int] NULL,
	[RELATIONSHIPID] [int] NULL,
	[CELLNUMBER] [nvarchar](20) NULL,
	[PHONENUMBER] [nvarchar](20) NULL,
	[EMAIL] [nvarchar](250) NULL,
	[CREATEUSERID] [int] NULL,
	[CREATEDATETIME] [datetime] NULL,
	[MODIFYUSERID] [int] NULL,
	[MODIFYDATETIME] [datetime] NULL,
	[ISACTIVE] [bit] NULL,
	[PASSPORTNUMBER] [nvarchar](50) NULL,
	[REQUIRESREVIEW] [bit] NULL,
	[INTAKECREATED] [bit] NULL,
	[DISPLAYNAME] [nvarchar](250) NULL,
	[TITLEID] [int] NULL,
	[AGEGROUPID] [int] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.EmployeeLevel')) is null
CREATE TABLE [Persist].[EmployeeLevel](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](50) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.Ethnicity')) is null
CREATE TABLE [Persist].[Ethnicity](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](50) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.Gender')) is null
CREATE TABLE [Persist].[Gender](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](50) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.iCare_Services')) is null
CREATE TABLE [Persist].[iCare_Services](
	[ID] [bigint] NOT NULL,
	[NAME] [nvarchar](150) NULL,
	[ISACTIVE] [bit] NULL,
	[DATETIMECREATED] [datetime] NULL,
	[CREATEDBY] [int] NULL,
	[DATETIMEUPDATED] [datetime] NULL,
	[UPDATEDBY] [int] NULL,
	[ICARE_CATEGORYID] [int] NULL,
	[ISTELECARE] [bit] NULL,
	[REQUIRESELIGIBILITY] [bit] NULL,
	[ISCONTRACTENTITLEMNT] [bit] NULL,
	[ALLOWVC] [bit] NULL,
	[SERVICEID] [bigint] NULL,
	[HCSERVICEID] [bigint] NULL,
	[TREATMENTSUGGESTIONSID] [int] NULL,
	[SERVICETYPEID] [int] NULL,
	[SERVICEGROUPID] [int] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.Industry')) is null
CREATE TABLE [Persist].[Industry](
	[ID] [int] NOT NULL,
	[PRIMARYSECTOR] [nvarchar](50) NULL,
	[INDUSTRYNAME] [nvarchar](250) NULL,
	[IS_ACTIVE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.IntakeAssessment')) is null
CREATE TABLE [Persist].[IntakeAssessment](
	[ID] [bigint] NOT NULL,
	[DESCRIPTION] [nvarchar](250) NULL,
	[COMPANYNAME] [nvarchar](150) NULL,
	[COMPANYID] [bigint] NULL,
	[COMPANYSITEID] [bigint] NULL,
	[EMPLOYEEID] [bigint] NULL,
	[ELIGIBLEOUTCOMEID] [int] NULL,
	[CREATEDBY] [int] NULL,
	[CREATEDDATETIME] [datetime] NULL,
	[UPDATEDBY] [int] NULL,
	[UPDATEDDATETIME] [datetime] NULL,
	[RISKLEVELID] [int] NULL,
	[RISKTYPEID] [int] NULL,
	[NOEMPLOYEEFOUND] [bit] NULL,
	[ISDEPENDANT] [bit] NULL,
	[EMPLOYEEDEPENDANTID] [bigint] NULL,
	[PRIMARYPROBLEM] [nvarchar](max) NULL,
	[SECONDARYPROBLEM] [nvarchar](500) NULL,
	[LOCATION] [nvarchar](250) NULL,
	[LAITITUDE] [decimal](37, 8) NULL,
	[LONGITUDE] [decimal](37, 8) NULL,
	[CASECREATED] [bit] NULL,
	[ISELIGIBLE] [bit] NULL,
	[REFERENCE] [nvarchar](100) NULL,
	[ICARE_SERVICEID] [bigint] NULL,
	[CONTRACTID] [bigint] NULL,
	[LATITUDE] [decimal](37, 8) NULL,
	[FULLNAME] [nvarchar](150) NULL,
	[CUSTOMERNAME] [nvarchar](150) NULL,
	[PROBLEMCATEGORYID] [int] NULL,
	[PROBLEMTYPEID] [bigint] NULL,
	[HASSECONDARYPROBLEM] [bit] NULL,
	[SECONDARYPROBLEMCATEGORYID] [int] NULL,
	[SECONDARYPROBLEMTYPEID] [bigint] NULL,
	[ICARE_CATEGORYID] [int] NULL,
	[TELEPHONENUMBER] [nvarchar](20) NULL,
	[WORKIMPACTID] [int] NULL,
	[WORKIMPACTSTATUSID] [int] NULL,
	[EMOTIONALSTATEID] [int] NULL,
	[EMOTIONALSTATUSID] [int] NULL,
	[ISANONYMOUS] [bit] NULL,
	[CASECOUNT] [int] NULL,
	[INTAKESTATUSID] [int] NULL,
	[EXTERNALREFERED] [bit] NULL,
	[EXTERNALREFERAL] [nvarchar](250) NULL,
	[EXTERNALREFFERED] [bit] NULL,
	[EXTERNALREFERRAL] [nvarchar](250) NULL,
	[REFERRALTYPEID] [int] NULL,
	[EXTERNALREFERRED] [bit] NULL,
	[RISKDEFINITIONID] [int] NULL,
	[REQUIRESRISKASSESSMENT] [bit] NULL,
	[CANHAVEWORKIMPACT] [bit] NULL,
	[EMETONIALSTATE] [bit] NULL,
	[SERVICECATEGORYID] [int] NULL,
	[EMETIONALSTATE] [bit] NULL,
	[EMOTIONALSTATE] [bit] NULL,
	[ASSESSMENTID] [bigint] NULL,
	[EMERGENCYCONTACT] [nvarchar](150) NULL,
	[EMERGENCYCONTACTPHONE] [nvarchar](20) NULL,
	[ISPLAN] [bit] NULL,
	[ISACCESS] [bit] NULL,
	[PLANNOTES] [nvarchar](500) NULL,
	[ISHISTORY] [bit] NULL,
	[HISTORYNOTES] [nvarchar](500) NULL,
	[REASONFOREXCALATION] [varchar](500) NULL,
	[REFEREMPLOYEEID] [int] NULL,
	[EXTERNALREFERCONTACT] [nvarchar](50) NULL,
	[CALLINGFORCOMPANYID] [bigint] NULL,
	[CALLERROLETYPEID] [int] NULL,
	[ISEXTERNALREFERRED] [bit] NULL,
	[EXTERNALREFERENTITYID] [bigint] NULL,
	[REASONFORESCALATIONID] [int] NULL,
	[DETAILSNOTPROVIDED] [bit] NULL,
	[ACCESSNOTES] [nvarchar](500) NULL,
	[ESCALATEEMPLOYEEID] [bigint] NULL,
	[TRACKINGSTATUSID] [int] NULL,
	[PROJECTCODE] [nvarchar](50) NULL,
	[ISMANAGERIALREFFERAL] [bit] NULL,
	[ISMANAGERIALREFERRAL] [bit] NULL,
	[ESCALATEROLEID] [int] NULL,
	[ESCALATEUSERID] [int] NULL,
	[ISOTHER] [bit] NULL,
	[OTHERNOTES] [nvarchar](500) NULL,
	[COMPANYBUSINESSUNITID] [bigint] NULL,
	[COMPANYDEPARTMENTID] [bigint] NULL,
	[REASONFORCLOSURE] [nvarchar](max) NULL,
	[ISDELETED] [bit] NULL,
	[REASONFORDELETE] [nvarchar](max) NULL,
	[INTAKEDELETEREASONID] [int] NULL,
	[INTAKEREFTEXT] [nvarchar](150) NULL,
	[WHOSHOULDRECEIVEREPORT] [nvarchar](50) NULL,
	[ISMANAGERIALREFSUBINTAKE] [bit] NULL,
	[ISGROUPTRAUMAREFERRAL] [bit] NULL,
	[ACCESSMETHODID] [int] NULL,
	[ACCESSMETHODOTHER] [nvarchar](250) NULL,
	[CLASSIFICATIONID] [int] NULL,
	[REPORTDATE] [datetime] NULL,
	[INTAKETYPEID] [int] NULL,
	[SERVICESTATUSID] [int] NULL,
	[OUTBOUNDREQUESTID] [bigint] NULL,
	[CLINICID] [bigint] NULL,
	[ISWALKIN] [bit] NULL,
	[EMAILLOGID] [bigint] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

if (select object_id('Persist.IntakeAssessmentSites')) is null
CREATE TABLE [Persist].[IntakeAssessmentSites](
	[ID] [bigint] NOT NULL,
	[INTAKEASSESSMENTID] [bigint] NULL,
	[COMPANYSITEID] [bigint] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.IntakeClientSatisfactionSurvey')) is null
CREATE TABLE [Persist].[IntakeClientSatisfactionSurvey](
	[ID] [bigint] NOT NULL,
	[CASEID] [bigint] NULL,
	[SERVICE] [nvarchar](50) NULL,
	[HELPFUL] [nvarchar](50) NULL,
	[FUTURESERVICE] [nvarchar](50) NULL,
	[RECOMMENDSERVICE] [nvarchar](50) NULL,
	[COMMENT] [nvarchar](500) NULL,
	[CREATEDON] [datetime] NULL,
	[COMPLETEDBY] [bigint] NULL,
	[COMPLETEDON] [datetime] NULL,
	[SESSION] [nvarchar](50) NULL,
	[INTAKEASSESSMENTID] [bigint] NULL,
	[SCORE] [bigint] NULL,
	[ISSENDTOCLIENT] [bit] NULL,
	[INTAKEPERSONID] [bigint] NULL,
	[INTAKEPERSONNAME] [nvarchar](200) NULL,
	[ETLExecutionKey] [varchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.IntakePerson')) is null
CREATE TABLE [Persist].[IntakePerson](
	[ID] [int] NOT NULL,
	[EMPLOYEEID] [int] NULL,
	[EMPLOYEEDEPENDANTID] [int] NULL,
	[FIRSTNAME] [nvarchar](100) NULL,
	[LASTNAME] [nvarchar](100) NULL,
	[IDNUMBER] [nvarchar](50) NULL,
	[PASSPORTNUMBER] [nvarchar](50) NULL,
	[GENDERID] [int] NULL,
	[EMPLOYEENUMBER] [nvarchar](50) NULL,
	[CELLPHONENUMBER] [nvarchar](20) NULL,
	[EMAIL] [nvarchar](250) NULL,
	[ISDEPENDANT] [bit] NULL,
	[CREATEDBY] [int] NULL,
	[CREATEDDATETIME] [datetime] NULL,
	[ISANONYMOUS] [bit] NULL,
	[RELATIONSHIPID] [int] NULL,
	[ETHNICITYID] [int] NULL,
	[MARITALSTATUSID] [int] NULL,
	[TITLEID] [int] NULL,
	[LANGUAGEID] [int] NULL,
	[DISPLAYNAME] [nvarchar](250) NULL,
	[ALTTELEPHONENUMBER] [nvarchar](20) NULL,
	[EMPLOYEELEVELID] [int] NULL,
	[TENUREID] [int] NULL,
	[BUSINESSUNITID] [bigint] NULL,
	[REGIONID] [bigint] NULL,
	[DEPARTMENTID] [bigint] NULL,
	[INTAKEASSESSMENTID] [bigint] NULL,
	[ISDEPENDANTLISTITEM] [bit] NULL,
	[ISCANCELLED] [bit] NULL,
	[CANCELLEDBY] [int] NULL,
	[CANCELLEDDATE] [datetime] NULL,
	[COMPANYSITEID] [bigint] NULL,
	[AGEGROUPID] [int] NULL,
	[ISMAINEMPLOYEE] [bit] NULL,
	[NOIDGIVEN] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.Language')) is null
CREATE TABLE [Persist].[Language](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](50) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.MaritalStatus')) is null
CREATE TABLE [Persist].[MaritalStatus](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](50) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.OutboundRequest')) is null
CREATE TABLE [Persist].[OutboundRequest](
	[ID] [int] NOT NULL,
	[NAMESURNAMEORNOTGIVENOPTION] [nvarchar](50) NULL,
	[NAMESURNAME] [nvarchar](150) NULL,
	[CONTACTDETAILSOPTION] [nvarchar](50) NULL,
	[CELLPHONENUMBER] [nvarchar](20) NULL,
	[LANDLINENUMBER] [nvarchar](20) NULL,
	[EMAILADDRESS] [nvarchar](250) NULL,
	[METHODOFCONTACTID] [int] NULL,
	[REASONORNOTES] [nvarchar](max) NULL,
	[ISPOSSIBLERISK] [bit] NULL,
	[COMPANYID] [bigint] NULL,
	[REQUESTORNAMESURNAME] [nvarchar](150) NULL,
	[REQUESTORCONTACTOPTION] [nvarchar](50) NULL,
	[REQUESTORCELLPHONE] [nvarchar](20) NULL,
	[REQUESTORLANDLINENUMBER] [nvarchar](20) NULL,
	[REQUESTOREMAILADDRESS] [nvarchar](250) NULL,
	[CONTACTDATEREQUESTED] [datetime] NULL,
	[CONTACTPERIODOFDAYREQUESTED] [int] NULL,
	[CONTACTTIMEREQUESTED] [datetime] NULL,
	[OUTBOUNDSTATUSID] [int] NULL,
	[TRACKINGSTATUSID] [int] NULL,
	[CREATEDBY] [int] NULL,
	[CREATEDON] [datetime] NULL,
	[REASONFORDELETE] [nvarchar](1000) NULL,
	[NOTEFORCLOSURE] [nvarchar](max) NULL,
	[RISKTYPEID] [int] NULL,
	[OUTBOUNDOUTCOMEID] [int] NULL,
	[REFNR] [nvarchar](50) NULL,
	[ISINTAKECREATED] [bit] NULL,
	[OUTBOUNDREFTEXT] [nvarchar](150) NULL,
	[ISDELETED] [bit] NULL,
	[OUTBOUNDDELETEREASONID] [int] NULL,
	[COMPANYNAME] [nvarchar](150) NULL,
	[RISKLEVELID] [int] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

if (select object_id('Persist.ProblemCategory')) is null
CREATE TABLE [Persist].[ProblemCategory](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](100) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[DEFINITION] [nvarchar](200) NULL,
	[REQUIRESRISKASSETMENT] [bit] NULL,
	[REQUIRESRISKASSESSMENT] [bit] NULL,
	[CANHAVEWORKIMPACT] [bit] NULL,
	[EMETONIALSTATE] [bit] NULL,
	[SERVICENAME] [nvarchar](50) NULL,
	[EMOTIONALSTATE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.ProblemType')) is null
CREATE TABLE [Persist].[ProblemType](
	[ID] [int] NOT NULL,
	[PROBLEMCATEGORYID] [int] NULL,
	[TYPENAME] [nvarchar](50) NULL,
	[ISACTIVE] [bit] NULL,
	[IS] [bit] NULL,
	[ISPROFESSIONALREFERRAL] [bit] NULL,
	[ISFORMALREFERRAL] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO


CREATE TABLE [Persist].[Province](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](50) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.Province_Test')) is null
CREATE TABLE [Persist].[Province_Test](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](50) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.RefferalType')) is null
CREATE TABLE [Persist].[RefferalType](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](50) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.Relationship')) is null
CREATE TABLE [Persist].[Relationship](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](50) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.RiskLevel')) is null
CREATE TABLE [Persist].[RiskLevel](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](50) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.RiskType')) is null
CREATE TABLE [Persist].[RiskType](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](50) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.Role')) is null
CREATE TABLE [Persist].[Role](
	[ID] [bigint] NOT NULL,
	[ESPACE_ID] [bigint] NULL,
	[SS_KEY] [nvarchar](100) NULL,
	[NAME] [nvarchar](50) NULL,
	[DESCRIPTION] [nvarchar](2000) NULL,
	[PERSISTENT] [bit] NULL,
	[IS_ACTIVE] [bit] NULL,
	[ETLExecutionKey] [varchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.Sector')) is null
CREATE TABLE [Persist].[Sector](
	[ID] [int] NOT NULL,
	[SECTORNAME] [nvarchar](250) NULL,
	[IS_ACTIVE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.ServiceType')) is null
CREATE TABLE [Persist].[ServiceType](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](50) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[ISFACETOFACE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.SessionOutcome')) is null
CREATE TABLE [Persist].[SessionOutcome](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](50) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[ISBILLABLE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.Tenure')) is null
CREATE TABLE [Persist].[Tenure](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](50) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.TrackingStatus')) is null
CREATE TABLE [Persist].[TrackingStatus](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](50) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[LABELCOLOR] [nvarchar](50) NULL,
	[BACKGROUNDCOLOR] [nvarchar](50) NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.User')) is null
CREATE TABLE [Persist].[User](
	[ID] [bigint] NOT NULL,
	[TENANT_ID] [bigint] NULL,
	[IS_ACTIVE] [bit] NULL,
	[CREATION_DATE] [datetime] NULL,
	[LAST_LOGIN] [datetime] NULL,
	[NAME] [nvarchar](256) NULL,
	[MOBILEPHONE] [nvarchar](20) NULL,
	[EMAIL] [nvarchar](250) NULL,
	[USERNAME] [nvarchar](250) NULL,
	[PASSWORD] [nvarchar](256) NULL,
	[EXTERNAL_ID] [nvarchar](36) NULL,
	[ETLExecutionKey] [varchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.UserRoles')) is null
CREATE TABLE [Persist].[UserRoles](
	[ID] [bigint] NOT NULL,
	[USERID] [bigint] NULL,
	[ROLEDESCRIPTION] [nvarchar](500) NULL,
	[NAME] [nvarchar](500) NULL,
	[TENANTID] [bigint] NULL,
	[ETLExecutionKey] [varchar](20) NOT NULL
) ON [PRIMARY]
GO

if (select object_id('Persist.WorkingImpactStatus')) is null
CREATE TABLE [Persist].[WorkingImpactStatus](
	[ID] [int] NOT NULL,
	[LABEL] [nvarchar](50) NULL,
	[ORDER] [int] NULL,
	[IS_ACTIVE] [bit] NULL,
	[ETLExecutionKey] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO



























































