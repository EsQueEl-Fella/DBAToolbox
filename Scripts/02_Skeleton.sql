USE [DBAToolbox]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
--****[Help]********************************************************************  
--*
--*  This script "Skeleton" will create the basic constructs such as schemas and 
--*  tables which are needed for the DBAToolbox to function.
--*
--*  I suggest you let things intact here and don't change anything or you
--*  end up breaking some bones :D
--*
--*  Alex Wernhardt (aka EsQueEl-Fella / esqueel.fella [at] gmail [dot] com)
--* 
--****[Meta Data]***************************************************************
--*
--*  Author: Alex Wernhardt (aka EsQueEl-Fella / esqueel.fella [at] gmail [dot] com)
--*  Version: 1.2.0
--*  Date: 20180601
--*  Last Modified: 20180616
--*  Created On:
--*    Microsoft SQL Server 2014 (Version 12.0.4100.1)
--*
--****[Copyright]***************************************************************
--*
--*   Copyright (C) 2018 Alex Wernhardt (esqueel.fella [at] gmail [dot] com), 
--*   All rights reserved. License Type: MIT. Check license.txt
--*
--****[MIT License]*************************************************************
--*
--* Permission is hereby granted, free of charge, to any person obtaining a copy 
--* of this software and associated documentation files (the "Software"), to deal 
--* in the Software without restriction, including without limitation the rights 
--* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
--* copies of the Software, and to permit persons to whom the Software is furnished 
--* to do so, subject to the following conditions:
--*
--* The above copyright notice and this permission notice shall be included in all 
--* copies or substantial portions of the Software.
--* 
--* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
--* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS 
--* FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR 
--* COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER 
--* IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN 
--* CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--* 
--******************************************************************************  

CREATE SCHEMA [dtx]
GO
CREATE SCHEMA [dtx_2005]
GO
CREATE SCHEMA [dtx_2008]
GO
CREATE SCHEMA [dtx_2012]
GO
CREATE SCHEMA [dtx_2014]
GO
CREATE SCHEMA [dtx_2016]
GO
CREATE SCHEMA [dtx_2017]
GO
CREATE SCHEMA [dtx_howto]
GO
CREATE SCHEMA [perms]
GO
CREATE SCHEMA [sqlmetrics]
GO
CREATE SCHEMA [util]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dtx].[SqlServerVersions](
	[ID] [int] NOT NULL,
	[MajorVersionNumber] [tinyint] NOT NULL,
	[MinorVersionNumber] [smallint] NOT NULL,
	[Branch] [varchar](34) NOT NULL,
	[Url] [varchar](99) NOT NULL,
	[ReleaseDate] [date] NOT NULL,
	[MainstreamSupportEndDate] [date] NULL,
	[ExtendedSupportEndDate] [date] NULL,
	[MajorVersionName] [varchar](19) NOT NULL,
	[MinorVersionName] [varchar](67) NOT NULL,
 CONSTRAINT [PK_SqlServerVersions_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dtx].[LinkedServers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QueryDate] [datetime] NOT NULL,
	[MachineName] [nvarchar](128) NOT NULL,
	[ServerName] [nvarchar](128) NOT NULL,
	[DBInstance] [nvarchar](128) NULL,
	[ServerPrimaryIP] [nvarchar](128) NOT NULL,
	[LinkedServerName] [nvarchar](256) NOT NULL,
	[HostName] [nvarchar](128) NOT NULL,
	[DomainName] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_LinkedServers_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dtx].[LinkedServers] ADD  DEFAULT (getdate()) FOR [QueryDate]
GO

ALTER TABLE [dtx].[LinkedServers] ADD  DEFAULT ('127.0.0.1') FOR [ServerPrimaryIP]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dtx].[AllLoginsCountsInThePastXHours](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DataCollectionRound] [int] NULL,
	[QueryDate] [datetime] NOT NULL,
	[MachineName] [sql_variant] NOT NULL,
	[ServerName] [sql_variant] NOT NULL,
	[Instance] [sql_variant] NULL,
	[FromHost] [varchar](128) NULL,
	[Program] [varchar](128) NULL,
	[Login] [varchar](128) NULL,
	[LastLoginTime] [datetime] NULL,
	[ClientInterface] [varchar](32) NULL,
	[NumberOfLogins] [int] NULL,
 CONSTRAINT [PK_AllLoginsCountsInThePastXHours_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dtx].[AllLoginsInThePastXHours](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DataCollectionRound] [int] NULL,
	[QueryDate] [datetime] NOT NULL,
	[MachineName] [sql_variant] NOT NULL,
	[ServerName] [sql_variant] NOT NULL,
	[Instance] [sql_variant] NULL,
	[FromHost] [varchar](128) NULL,
	[Program] [varchar](128) NULL,
	[Login] [varchar](128) NULL,
	[LastLoginTime] [datetime] NULL,
	[ClientInterface] [varchar](32) NULL,
 CONSTRAINT [PK_AllLoginsInThePastXHours_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dtx].[AllLoginsLastLoginDate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DataCollectionRound] [int] NULL,
	[QueryDate] [datetime] NOT NULL,
	[MachineName] [sql_variant] NOT NULL,
	[ServerName] [sql_variant] NOT NULL,
	[Instance] [sql_variant] NULL,
	[Login] [varchar](128) NOT NULL,
	[LastLoginTime] [datetime] NOT NULL,
 CONSTRAINT [PK_AllLoginsLastLoginDate_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dtx].[AllLoginsWithServerRole](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DataCollectionRound] [int] NULL,
	[QueryDate] [datetime] NOT NULL,
	[MachineName] [sql_variant] NOT NULL,
	[ServerName] [sql_variant] NOT NULL,
	[Instance] [sql_variant] NULL,
	[Role] [varchar](128) NULL,
	[Login] [varchar](128) NULL,
	[LoginType] [varchar](60) NULL,
	[Disabled] [bit] NULL,
 CONSTRAINT [PK_AllLoginsWithServerRole_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dtx].[DatabaseFileSizesAndSpace](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DataCollectionRound] [int] NULL,
	[QueryDate] [datetime] NOT NULL,
	[MachineName] [sql_variant] NOT NULL,
	[ServerName] [sql_variant] NOT NULL,
	[Instance] [sql_variant] NULL,
	[FileName] [nvarchar](256) NOT NULL,
	[PhysicalName] [nvarchar](512) NOT NULL,
	[TotalSizeInMB] [float] NULL,
	[AvailableSpaceInMB] [float] NULL,
	[FileId] [int] NULL,
	[FilegroupName] [nvarchar](48) NULL,
	[IsPercentGrowth] [bit] NULL,
	[Growth] [bit] NULL,
	[IsDefault] [bit] NULL,
	[IsReadOnly] [bit] NULL,
 CONSTRAINT [PK_DatabaseFileSizesAndSpace_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dtx].[DatabaseIOStatsByFile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QueryDate] [datetime] NOT NULL,
	[MachineName] [sql_variant] NOT NULL,
	[ServerName] [sql_variant] NOT NULL,
	[Instance] [sql_variant] NULL,
	[DatabaseName] [nvarchar](256) NOT NULL,
	[LogicalName] [nvarchar](256) NOT NULL,
	[FileId] [int] NULL,
	[TypeDesc] [nvarchar](24) NOT NULL,
	[PhysicalName] [nvarchar](512) NOT NULL,
	[SizeOnDiskInMB] [float] NULL,
	[NumOfReads] [int] NULL,
	[NumOfWrites] [int] NULL,
	[IOStallReadMs] [int] NULL,
	[IOStallWriteMs] [int] NULL,
	[IOStallReadsPct] [float] NULL,
	[IOStallWritesPct] [float] NULL,
	[WritesAndReads] [int] NULL,
	[MBRead] [float] NULL,
	[MBWritten] [float] NULL,
	[NumReadsPct] [float] NULL,
	[NumWritePct] [float] NULL,
	[ReadBytesPct] [float] NULL,
	[WrittenBytesPct] [float] NULL,
 CONSTRAINT [PK_DatabaseIOStatsByFile_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dtx].[ServerAdhocQueries](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QueryDate] [datetime] NOT NULL,
	[MachineName] [sql_variant] NOT NULL,
	[ServerName] [sql_variant] NOT NULL,
	[Instance] [sql_variant] NULL,
	[QueryText] [nvarchar](max) NOT NULL,
	[CacheObjectType] [nvarchar](50) NOT NULL,
	[ObjectType] [nvarchar](20) NOT NULL,
	[PlanSizeInKB] [int] NOT NULL,
 CONSTRAINT [PK_ServerAdhocQueries_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dtx].[ServerAgentAlerts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QueryDate] [datetime] NOT NULL,
	[MachineName] [sql_variant] NOT NULL,
	[ServerName] [sql_variant] NOT NULL,
	[Instance] [sql_variant] NULL,
	[Name] [nvarchar](128) NOT NULL,
	[EventSource] [nvarchar](100) NOT NULL,
	[MessageId] [int] NOT NULL,
	[Sverity] [int] NOT NULL,
	[Enabled] [tinyint] NOT NULL,
	[HasNotification] [int] NOT NULL,
	[DelayBetweenResponses] [int] NOT NULL,
	[OccurrenceCount] [int] NOT NULL,
	[LastOccurrenceDate] [int] NOT NULL,
	[LastOccurrenceTime] [int] NOT NULL,
 CONSTRAINT [PK_ServerAgentAlerts_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dtx].[ServerAuditsUserObjects](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DataCollectionRound] [int] NULL,
	[QueryDate] [datetime] NOT NULL,
	[MachineName] [sql_variant] NOT NULL,
	[ServerName] [sql_variant] NOT NULL,
	[Instance] [sql_variant] NULL,
	[Issue] [varchar](100) NULL,
	[Database] [varchar](200) NULL,
	[Object] [varchar](200) NULL,
	[ObjectType] [varchar](200) NULL,
	[Owner] [varchar](200) NULL,
 CONSTRAINT [PK_ServerAuditsUserObjects_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dtx].[ServerConfigurationValues](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DataCollectionRound] [int] NULL,
	[QueryDate] [datetime] NOT NULL,
	[MachineName] [sql_variant] NOT NULL,
	[ServerName] [sql_variant] NOT NULL,
	[Instance] [sql_variant] NULL,
	[ConfigurationID] [int] NOT NULL,
	[Name] [nvarchar](35) NOT NULL,
	[Value] [sql_variant] NULL,
	[ValueInUse] [sql_variant] NULL,
	[Minimum] [sql_variant] NULL,
	[Maximum] [sql_variant] NULL,
	[Description] [nvarchar](255) NOT NULL,
	[IsDynamic] [bit] NOT NULL,
	[IsAdvanced] [bit] NOT NULL,
 CONSTRAINT [PK_ServerConfigurationValues_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dtx].[ServerDatabaseNamesAndPaths](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DataCollectionRound] [int] NULL,
	[QueryDate] [datetime] NOT NULL,
	[MachineName] [sql_variant] NOT NULL,
	[ServerName] [sql_variant] NOT NULL,
	[Instance] [sql_variant] NULL,
	[Database] [nvarchar](512) NOT NULL,
	[FileId] [int] NULL,
	[Name] [nvarchar](512) NOT NULL,
	[PhysicalName] [nvarchar](512) NOT NULL,
	[TypeDesc] [nvarchar](24) NOT NULL,
	[StateDesc] [nvarchar](24) NOT NULL,
	[IsPercentGrowth] [bit] NULL,
	[Growth] [bit] NULL,
	[GrowthInMB] [bigint] NULL,
	[TotalSizeInMB] [bigint] NULL,
 CONSTRAINT [PK_ServerDatabaseNamesAndPaths_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dtx].[ServerDatabaseProperties](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DataCollectionRound] [int] NULL,
	[QueryDate] [datetime] NOT NULL,
	[MachineName] [sql_variant] NOT NULL,
	[ServerName] [sql_variant] NOT NULL,
	[Instance] [sql_variant] NULL,
	[DatabaseName] [nvarchar](128) NOT NULL,
	[DatabaseOwner] [nvarchar](256) NULL,
	[RecoveryModel] [nvarchar](60) NULL,
	[StateDesc] [nvarchar](60) NULL,
	[ContainmentDesc] [nvarchar](60) NULL,
	[LogReuseWaitDescription] [nvarchar](60) NULL,
	[LogSizeInMB] [real] NULL,
	[LogUsedInMB] [real] NULL,
	[LogUsedInPercent] [real] NULL,
	[DBCompatibilityLevel] [tinyint] NOT NULL,
	[IsMixedPageAllocationOn] [bit] NULL,
	[PageVerifyOption] [nvarchar](60) NULL,
	[IsAutoCreateStatsOn] [bit] NULL,
	[IsAutoUpdateStatsOn] [bit] NULL,
	[IsAutoUpdateStatsAsyncOn] [bit] NULL,
	[IsParameterizationForced] [bit] NULL,
	[SnapshotIsolationStateDesc] [nvarchar](60) NULL,
	[IsReadCommittedSnapshotOn] [bit] NULL,
	[IsAutoCloseOn] [bit] NULL,
	[IsAutoShrinkOn] [bit] NULL,
	[TargetRecoveryTimeInSeconds] [int] NULL,
	[IsCDCEnabled] [bit] NULL,
	[IsPublished] [bit] NULL,
	[IsDistributor] [bit] NULL,
	[GroupDatabaseId] [uniqueidentifier] NULL,
	[ReplicaId] [uniqueidentifier] NULL,
	[IsMemoryOptimizedElevateToSnapshotOn] [bit] NULL,
	[DelayedDurabilityDesc] [nvarchar](60) NULL,
	[IsAutoCreateStatsIncrementalOn] [bit] NULL,
	[IsQueryStoreOn] [bit] NULL,
	[IsSyncWithBackup] [bit] NULL,
	[IsTemporalHistoryRetentionEnabled] [bit] NULL,
	[IsSupplementalLoggingEnabled] [bit] NULL,
	[IsRemoteDataArchiveEnabled] [bit] NULL,
	[IsEncrypted] [bit] NULL,
	[EncryptionState] [int] NULL,
	[PercentComplete] [real] NULL,
	[KeyAlgorithm] [nvarchar](128) NULL,
	[KeyLength] [int] NULL,
 CONSTRAINT [PK_ServerDatabaseProperties_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dtx].[ServerHardwareInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DataCollectionRound] [int] NULL,
	[QueryDate] [datetime] NOT NULL,
	[MachineName] [sql_variant] NOT NULL,
	[ServerName] [sql_variant] NOT NULL,
	[Instance] [sql_variant] NULL,
	[LogicalCPUCount] [bigint] NOT NULL,
	[SchedulerCount] [int] NULL,
	[HyperthreadRatio] [int] NULL,
	[SocketCount] [int] NULL,
	[CoresPerSocket] [int] NULL,
	[PhysicalCoreCount] [int] NULL,
	[PhysicalCPUCount] [bigint] NOT NULL,
	[NUMANodeCount] [int] NULL,
	[PhysicalMemoryInMB] [bigint] NOT NULL,
	[CommittedMemoryInMB] [bigint] NULL,
	[CommittedTargetMemoryInMB] [bigint] NULL,
	[MaxWorkersCount] [int] NULL,
	[AffinityTypeDesc] [nvarchar](60) NULL,
	[SQLServerStartTime] [datetime] NOT NULL,
	[VirtualMachineType] [nvarchar](60) NULL,
	[SoftNUMAConfiguration] [nvarchar](120) NULL,
	[SqlMemoryModelDesc] [nvarchar](120) NULL,
	[ProcessPhysicalAffinity] [nvarchar](3072) NULL,
 CONSTRAINT [PK_ServerHardwareInfo_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dtx].[ServerOrphanedUsers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DataCollectionRound] [int] NULL,
	[QueryDate] [datetime] NOT NULL,
	[MachineName] [sql_variant] NOT NULL,
	[ServerName] [sql_variant] NOT NULL,
	[Instance] [sql_variant] NULL,
	[Database] [varchar](100) NULL,
	[UserName] [varchar](100) NULL,
	[CreateDate] [varchar](100) NULL,
	[LoginType] [varchar](100) NULL,
 CONSTRAINT [PK_ServerOrphanedUsers_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dtx].[ServerWindowsInformation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DataCollectionRound] [int] NULL,
	[QueryDate] [datetime] NOT NULL,
	[MachineName] [sql_variant] NOT NULL,
	[ServerName] [sql_variant] NOT NULL,
	[Instance] [sql_variant] NULL,
	[WindowsRelease] [nvarchar](256) NOT NULL,
	[WindowsServicePackLevel] [nvarchar](256) NOT NULL,
	[WindowsSKU] [int] NULL,
	[OSLanguageVersion] [int] NOT NULL,
 CONSTRAINT [PK_ServerWindowsInformation_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dtx].[AllLoginsCountsInThePastXHours] ADD  CONSTRAINT [DF_AllLoginsCountsInThePastXHours_QueryDate]  DEFAULT (getdate()) FOR [QueryDate]
GO
ALTER TABLE [dtx].[AllLoginsInThePastXHours] ADD  CONSTRAINT [DF_AllLoginsInThePastXHours_QueryDate]  DEFAULT (getdate()) FOR [QueryDate]
GO
ALTER TABLE [dtx].[AllLoginsLastLoginDate] ADD  CONSTRAINT [DF_AllLoginsLastLoginDate_QueryDate]  DEFAULT (getdate()) FOR [QueryDate]
GO
ALTER TABLE [dtx].[AllLoginsWithServerRole] ADD  CONSTRAINT [DF_AllLoginsWithServerRole_QueryDate]  DEFAULT (getdate()) FOR [QueryDate]
GO
ALTER TABLE [dtx].[DatabaseFileSizesAndSpace] ADD  CONSTRAINT [DF_DatabaseFileSizesAndSpace_QueryDate]  DEFAULT (getdate()) FOR [QueryDate]
GO
ALTER TABLE [dtx].[ServerAuditsUserObjects] ADD  CONSTRAINT [DF_ServerAuditsUserObjects_QueryDate]  DEFAULT (getdate()) FOR [QueryDate]
GO
ALTER TABLE [dtx].[ServerConfigurationValues] ADD  CONSTRAINT [DF_ServerConfigurationValues_QueryDate]  DEFAULT (getdate()) FOR [QueryDate]
GO
ALTER TABLE [dtx].[ServerDatabaseNamesAndPaths] ADD  DEFAULT (getdate()) FOR [QueryDate]
GO
ALTER TABLE [dtx].[ServerDatabaseProperties] ADD  CONSTRAINT [DF_ServerDatabaseProperties_QueryDate]  DEFAULT (getdate()) FOR [QueryDate]
GO
ALTER TABLE [dtx].[ServerHardwareInfo] ADD  CONSTRAINT [DF_ServerHardwareInfo_QueryDate]  DEFAULT (getdate()) FOR [QueryDate]
GO
ALTER TABLE [dtx].[ServerOrphanedUsers] ADD  CONSTRAINT [DF_ServerOrphanedUsers_QueryDate]  DEFAULT (getdate()) FOR [QueryDate]
GO
ALTER TABLE [dtx].[ServerWindowsInformation] ADD  CONSTRAINT [DF_ServerWindowsInformation_QueryDate]  DEFAULT (getdate()) FOR [QueryDate]
GO

CREATE TABLE [dbo].[CommandLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DatabaseName] [sysname] NULL,
	[SchemaName] [sysname] NULL,
	[ObjectName] [sysname] NULL,
	[ObjectType] [char](2) NULL,
	[IndexName] [sysname] NULL,
	[IndexType] [tinyint] NULL,
	[StatisticsName] [sysname] NULL,
	[PartitionNumber] [int] NULL,
	[ExtendedInfo] [xml] NULL,
	[Command] [nvarchar](max) NOT NULL,
	[CommandType] [nvarchar](60) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NULL,
	[ErrorNumber] [int] NULL,
	[ErrorMessage] [nvarchar](max) NULL,
 CONSTRAINT [PK_CommandLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [perms].[DatabasePermissions](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[SnapshotID] [bigint] NOT NULL,
	[State] [char](1) NOT NULL,
	[StateDesc] [nvarchar](60) NOT NULL,
	[PermissionName] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Perms_DatabasePermissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [perms].[ObjectPermissions](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[SnapshotID] [bigint] NOT NULL,
	[State] [char](1) NOT NULL,
	[StateDesc] [nvarchar](60) NOT NULL,
	[PermissionName] [nvarchar](128) NOT NULL,
	[SchemaName] [nvarchar](128) NOT NULL,
	[ObjectName] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[ClassDesc] [nvarchar](60) NOT NULL,
	[ColumnName] [nvarchar](128) NULL,
 CONSTRAINT [PK_Perms_Object_Permissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [perms].[RoleMemberships](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[SnapshotID] [bigint] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Perms_Role_Memberships] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [perms].[Roles](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[SnapshotID] [bigint] NOT NULL,
	[RoleName] [nvarchar](128) NOT NULL,
	[RoleType] [char](1) NOT NULL,
	[RoleTypeDesc] [nvarchar](60) NOT NULL,
	[DefaultSchema] [nvarchar](128) NULL,
 CONSTRAINT [PK_Perms_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [perms].[SchemaPermissions](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[SnapshotID] [bigint] NOT NULL,
	[State] [char](1) NOT NULL,
	[StateDesc] [nvarchar](60) NOT NULL,
	[PermissionName] [nvarchar](128) NOT NULL,
	[SchemaName] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Perms_Schema_Permissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [perms].[Snapshots](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DatabaseName] [nvarchar](128) NOT NULL,
	[CaptureDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Perms_Snapshots] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [perms].[Users](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[SnapshotID] [bigint] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[UserType] [char](1) NOT NULL,
	[UserTypeDesc] [nvarchar](60) NOT NULL,
	[DefaultSchema] [nvarchar](128) NULL,
	[LoginName] [nvarchar](128) NOT NULL,
	[LoginType] [char](1) NOT NULL,
	[isDisabled] [bit] NOT NULL,
	[SID] [varbinary](85) NULL,
	[PasswordHash] [varbinary](256) NULL,
 CONSTRAINT [PK_Perms_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sqlmetrics].[DatabaseFileMetrics](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DatabaseID] [smallint] NULL,
	[DatabaseName] [nvarchar](128) NULL,
	[FileID] [int] NOT NULL,
	[FileName] [nvarchar](128) NOT NULL,
	[FileType] [nvarchar](60) NULL,
	[FileLocation] [nvarchar](260) NOT NULL,
	[CurrentState] [nvarchar](60) NULL,
	[isReadOnly] [bit] NOT NULL,
	[CurrentSizeMB] [decimal](10, 2) NULL,
	[SpaceUsedMB] [decimal](10, 2) NULL,
	[PercentUsed] [decimal](10, 2) NULL,
	[FreeSpaceMB] [decimal](10, 2) NULL,
	[PercentFree] [decimal](10, 2) NULL,
	[AutoGrowth] [nvarchar](128) NULL,
	[CaptureDate] [datetime] NOT NULL,
 CONSTRAINT [PK_DatabaseFileMetrics] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sqlmetrics].[IndexMetrics](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DatabaseID] [smallint] NOT NULL,
	[DatabaseName] [nvarchar](128) NOT NULL,
	[SchemaName] [nvarchar](128) NOT NULL,
	[TableName] [nvarchar](128) NULL,
	[IndexName] [nvarchar](128) NULL,
	[IndexID] [int] NOT NULL,
	[IndexType] [nvarchar](60) NULL,
	[PartitionNumber] [int] NULL,
	[Rows] [bigint] NULL,
	[UserSeeks] [bigint] NULL,
	[UserScans] [bigint] NULL,
	[UserLookups] [bigint] NULL,
	[UserUpdates] [bigint] NULL,
	[IndexSizeMB] [decimal](18, 2) NULL,
	[IndexMetricsChecks] [int] NOT NULL,
	[LastUserSeek] [datetime] NULL,
	[LastUserScan] [datetime] NULL,
	[LastUserLookup] [datetime] NULL,
	[LastUserUpdate] [datetime] NULL,
	[SystemSeeks] [bigint] NULL,
	[SystemScans] [bigint] NULL,
	[SystemLookups] [bigint] NULL,
	[SystemUpdates] [bigint] NULL,
	[LastSystemSeek] [datetime] NULL,
	[LastSystemScan] [datetime] NULL,
	[LastSystemLookup] [datetime] NULL,
	[LastSystemUpdate] [datetime] NULL,
	[isUnique] [bit] NULL,
	[isUniqueConstraint] [bit] NULL,
	[isPrimaryKey] [bit] NULL,
	[isDisabled] [bit] NULL,
	[isHypothetical] [bit] NULL,
	[allowRowLocks] [bit] NULL,
	[allowPageLocks] [bit] NULL,
	[FillFactor] [tinyint] NOT NULL,
	[hasFilter] [bit] NULL,
	[Filter] [nvarchar](max) NULL,
	[DateInitiallyChecked] [datetime] NOT NULL,
	[DateLastChecked] [datetime] NOT NULL,
	[SQLServerStartTime] [datetime] NOT NULL,
	[DropStatement] [nvarchar](1000) NULL,
	[Hash] [varbinary](256) NULL,
 CONSTRAINT [PK_IndexMetrics] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [perms].[Snapshots] ADD  CONSTRAINT [DF_Perms_Snapshots_CaptureDate]  DEFAULT (getdate()) FOR [CaptureDate]
GO
ALTER TABLE [sqlmetrics].[DatabaseFileMetrics] ADD  CONSTRAINT [DF_DatabaseFileMetrics_CaptureDate]  DEFAULT (getdate()) FOR [CaptureDate]
GO
ALTER TABLE [sqlmetrics].[IndexMetrics] ADD  CONSTRAINT [DF_IndexMetrics_IndexMetricsCheck]  DEFAULT ((0)) FOR [IndexMetricsChecks]
GO
ALTER TABLE [sqlmetrics].[IndexMetrics] ADD  CONSTRAINT [DF_IndexMetrics_DateInitiallyChecked]  DEFAULT (getdate()) FOR [DateInitiallyChecked]
GO
ALTER TABLE [sqlmetrics].[IndexMetrics] ADD  CONSTRAINT [DF_IndexMetrics_DateLastChecked]  DEFAULT (getdate()) FOR [DateLastChecked]
GO
ALTER TABLE [perms].[DatabasePermissions]  WITH CHECK ADD  CONSTRAINT [FK_Perms_DatabasePermissions_Snapshot] FOREIGN KEY([SnapshotID])
REFERENCES [perms].[Snapshots] ([ID])
GO
ALTER TABLE [perms].[DatabasePermissions] CHECK CONSTRAINT [FK_Perms_DatabasePermissions_Snapshot]
GO
ALTER TABLE [perms].[ObjectPermissions]  WITH CHECK ADD  CONSTRAINT [FK_Perms_ObjectPermissions_Snapshot] FOREIGN KEY([SnapshotID])
REFERENCES [perms].[Snapshots] ([ID])
GO
ALTER TABLE [perms].[ObjectPermissions] CHECK CONSTRAINT [FK_Perms_ObjectPermissions_Snapshot]
GO
ALTER TABLE [perms].[RoleMemberships]  WITH CHECK ADD  CONSTRAINT [FK_Perms_RoleMemberships_Snapshot] FOREIGN KEY([SnapshotID])
REFERENCES [perms].[Snapshots] ([ID])
GO
ALTER TABLE [perms].[RoleMemberships] CHECK CONSTRAINT [FK_Perms_RoleMemberships_Snapshot]
GO
ALTER TABLE [perms].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Perms_Roles_Snapshot] FOREIGN KEY([SnapshotID])
REFERENCES [perms].[Snapshots] ([ID])
GO
ALTER TABLE [perms].[Roles] CHECK CONSTRAINT [FK_Perms_Roles_Snapshot]
GO
ALTER TABLE [perms].[SchemaPermissions]  WITH CHECK ADD  CONSTRAINT [FK_Perms_SchemaPermissions_Snapshot] FOREIGN KEY([SnapshotID])
REFERENCES [perms].[Snapshots] ([ID])
GO
ALTER TABLE [perms].[SchemaPermissions] CHECK CONSTRAINT [FK_Perms_SchemaPermissions_Snapshot]
GO
ALTER TABLE [perms].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Perms_Users_Snapshot] FOREIGN KEY([SnapshotID])
REFERENCES [perms].[Snapshots] ([ID])
GO
ALTER TABLE [perms].[Users] CHECK CONSTRAINT [FK_Perms_Users_Snapshot]
GO

CREATE VIEW [perms].[vwPerms_listCurrentDBPermissions]
AS
	/**************************************************************************
		Author: Eric Cobb - http://www.sqlnuggets.com/
		License:
				MIT License
				Copyright (c) 2017 Eric Cobb
				View full license disclosure: https://github.com/ericcobb/SQL-Server-Metrics-Pack/blob/master/LICENSE
		Purpose: 
				This view returns a list of the most recent Permissions Snapshots for each database, displaying users and their assigned permissions.					
	***************************************************************************/

	SELECT TOP 100 PERCENT [SnapshotID] = ID, [CaptureDate], [DatabaseName]
			,rm.[username]
			,rm.[PermType]
			,rm.[Perm]
	FROM(SELECT ID, [DatabaseName], [CaptureDate] 
			,ROW_NUMBER() OVER (PARTITION BY [DatabaseName] ORDER BY [CaptureDate] DESC) AS rn
		FROM perms.snapshots
		) s
		INNER JOIN (SELECT [PermType] = 'User-Login Mapping'
							,[UserName] 
							,[Perm] = ' FROM LOGIN ' + [loginname]
							,[SnapshotID]
					 FROM [perms].[Users] u
					UNION
					SELECT [PermType] = CASE WHEN r.[roletype] = 'R' THEN 'Database Role' ELSE ' Application Role' END
							,[UserName] = [rolename]
							,[Perm] = NULL
							,[SnapshotID]
					FROM [perms].[Roles] r
					UNION 
					SELECT [PermType] = 'Role Memberships'
							,[UserName]
							,[Perm] = [rolename]
							,[SnapshotID]
					FROM [perms].[RoleMemberships] rm
					UNION
					SELECT [PermType] = 'Object Permission'
							,[UserName]
							,[Perm] = CASE WHEN state <> 'W' THEN [StateDesc] + SPACE(1) ELSE 'GRANT ' END
										+ [PermissionName] 
										+ ' ON [' +  [schemaname] + '].[' + [objectname] + '] TO [' + [username] + ']'
										+ CASE WHEN [state] <> 'W' THEN SPACE(0) ELSE ' (WITH GRANT OPTION)' END
							,[SnapshotID]
					FROM [perms].[ObjectPermissions] op
					UNION 
					SELECT [PermType] = 'Schema Permission'
							,[UserName]
							,[Perm] = CASE WHEN [state] <> 'W' THEN [StateDesc] + SPACE(1) ELSE 'GRANT ' END
										+ [PermissionName] 
										+ ' ON [' + [schemaname] + '] TO [' + [username] + ']'
										+ CASE WHEN [state] <> 'W' THEN SPACE(0) ELSE ' (WITH GRANT OPTION)' END
							,[SnapshotID]
					FROM [perms].[SchemaPermissions] 
					UNION
					SELECT [PermType] = 'Database Permission'
							,[UserName]
							,[Perm] = StateDesc + ' ' + PermissionName
							,[SnapshotID]
					FROM perms.DatabasePermissions
					) rm ON rm.[SnapshotID] = s.ID
	WHERE s.rn = 1
	ORDER BY [DatabaseName],[username],[PermType],[Perm];


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [perms].[vwPerms_listCurrentSnapshots] 

AS
	/**************************************************************************
		Author: Eric Cobb - http://www.sqlnuggets.com/
		License:
				MIT License
				Copyright (c) 2017 Eric Cobb
				View full license disclosure: https://github.com/ericcobb/SQL-Server-Metrics-Pack/blob/master/LICENSE
		Purpose: 
				This view returns a list of the most recent Permissions Snapshots for each database
					
	***************************************************************************/

SELECT ID, [DatabaseName], [CaptureDate]
FROM(SELECT ID, [DatabaseName], [CaptureDate] 
		,ROW_NUMBER() OVER (PARTITION BY [DatabaseName] ORDER BY [CaptureDate] DESC) AS rn
	FROM perms.snapshots
) s
WHERE s.rn = 1

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [sqlmetrics].[vwDBFileMetrics_CurrentFileSizes]
AS

	/**************************************************************************
		Author: Eric Cobb - http://www.sqlnuggets.com/
		License:
				MIT License
				Copyright (c) 2017 Eric Cobb
				View full license disclosure: https://github.com/ericcobb/SQL-Server-Metrics-Pack/blob/master/LICENSE
		Purpose: 
				This view queries the DatabaseFileMetrics table to return the most recently recorded
				data and log file metrics.
	***************************************************************************/

	SELECT [DatabaseName]
		  ,[FileName]
		  ,[FileType]
		  ,[CurrentSize]
		  ,[SpaceUsed]
		  ,[PercentUsed]
		  ,[FreeSpace]
		  ,[PercentFree]
		  ,[AutoGrowth]
		  ,[CaptureDate]
	FROM (SELECT [DatabaseName]
			  ,[FileName]
			  ,[FileType]
			  ,[CurrentSize] = Cast([CurrentSizeMB] AS varchar(25))+' MB'
			  ,[SpaceUsed] = Cast([SpaceUsedMB] AS varchar(25))+' MB'
			  ,[PercentUsed] = Cast([PercentUsed] AS varchar(25))+'%'
			  ,[FreeSpace] = Cast([FreeSpaceMB] AS varchar(25))+' MB'
			  ,[PercentFree] = Cast([PercentFree] AS varchar(25))+'%'
			  ,[AutoGrowth]
			  ,[CaptureDate]
			  ,ROW_NUMBER() OVER (PARTITION BY [DatabaseID],[FileID] ORDER BY [CaptureDate] DESC) AS rn
		  FROM [sqlmetrics].[DatabaseFileMetrics]
		) fm
	WHERE fm.rn = 1;

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [sqlmetrics].[vwIndexMetrics_CurrentActiveIndexDetails]
AS
	/**************************************************************************
		Author: Eric Cobb - http://www.sqlnuggets.com/
		License:
				MIT License
				Copyright (c) 2017 Eric Cobb
				View full license disclosure: https://github.com/ericcobb/SQL-Server-Metrics-Pack/blob/master/LICENSE
		Purpose: 
				This view queries the IndexMetrics table to return the index details gathered since the last SQL Server restart,
				as determined by the sys.dm_os_sys_info DMV. Excludes Disabled and Hypothetical indexes.		
	***************************************************************************/

	SELECT [DatabaseID]
		  ,[DatabaseName]
		  ,[SchemaName]
		  ,[TableName]
		  ,[IndexName]
		  ,[IndexID]
		  ,[IndexType]
		  ,[PartitionNumber]
		  ,[Rows]
		  ,[IndexSizeMB]
		  ,[isUnique]
		  ,[isUniqueConstraint]
		  ,[isPrimaryKey]
		  ,[isDisabled]
		  ,[isHypothetical]
		  ,[allowRowLocks]
		  ,[allowPageLocks]
		  ,[FillFactor]
		  ,[hasFilter]
		  ,[Filter]
		  ,[IndexMetricsChecks]
		  ,[DateInitiallyChecked]
		  ,[DateLastChecked]
		  ,[SQLServerStartTime]
		  ,[DropStatement]
  FROM [sqlmetrics].[IndexMetrics] ixm
  INNER JOIN sys.dm_os_sys_info info ON ixm.SQLServerStartTime = info.sqlserver_start_time
  WHERE ixm.isDisabled = 0
  AND	ixm.isHypothetical = 0

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [sqlmetrics].[vwIndexMetrics_CurrentActiveIndexMetrics]
AS
	/**************************************************************************
		Author: Eric Cobb - http://www.sqlnuggets.com/
		License:
				MIT License
				Copyright (c) 2017 Eric Cobb
				View full license disclosure: https://github.com/ericcobb/SQL-Server-Metrics-Pack/blob/master/LICENSE
		Purpose: 
				This view queries the IndexMetrics table to return the metrics gathered since the last SQL Server restart,
				as determined by the sys.dm_os_sys_info DMV. Excludes Disabled and Hypothetical indexes.		
	***************************************************************************/

	SELECT [DatabaseID]
		  ,[DatabaseName]
		  ,[SchemaName]
		  ,[TableName]
		  ,[IndexName]
		  ,[IndexType]
		  ,[UserSeeks]
		  ,[UserScans]
		  ,[UserLookups]
		  ,[UserUpdates]
		  ,[LastUserSeek]
		  ,[LastUserScan]
		  ,[LastUserLookup]
		  ,[LastUserUpdate]
		  ,[SystemSeeks]
		  ,[SystemScans]
		  ,[SystemLookups]
		  ,[SystemUpdates]
		  ,[LastSystemSeek]
		  ,[LastSystemScan]
		  ,[LastSystemLookup]
		  ,[LastSystemUpdate]
		  ,[IndexMetricsChecks]
		  ,[DateInitiallyChecked]
		  ,[DateLastChecked]
		  ,[SQLServerStartTime]
  FROM [sqlmetrics].[IndexMetrics] ixm
  INNER JOIN sys.dm_os_sys_info info ON ixm.SQLServerStartTime = info.sqlserver_start_time
  WHERE ixm.isDisabled = 0
  AND	ixm.isHypothetical = 0

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [sqlmetrics].[vwIndexMetrics_CurrentMetricsWithTotals]
AS
	/**************************************************************************
		Author: Eric Cobb - http://www.sqlnuggets.com/
		License:
				MIT License
				Copyright (c) 2017 Eric Cobb
				View full license disclosure: https://github.com/ericcobb/SQL-Server-Metrics-Pack/blob/master/LICENSE
		Purpose: 
				This view queries the IndexMetrics table to return both the current (since last SQL Server restart) and 
				total (historical aggregations across all available index data) Index metrics.		
	***************************************************************************/

	SELECT [DatabaseName]
			,[SchemaName]
			,[TableName]
			,[IndexName]
			,[IndexType]
			,[Rows]
			,[IndexSizeMB]
			,[UserSeeks]
			,[UserScans]
			,[UserLookups]
			,[UserUpdates]
			,[IndexMetricsChecks]
			,[SQLServerStartTime]
			,[totalUserSeek]
			,[totalUserScans]
			,[totalUserLookups]
			,[totalUserUpdates]
			,[TotalIndexMetricsChecks]
			,[DateInitiallyChecked]
			,[DateLastChecked]
			,[isDisabled]
			,[isHypothetical]
	FROM (SELECT ixm.[DatabaseName],ixm.[SchemaName],ixm.[TableName],ixm.[IndexName],[IndexType],[Rows],ixm.[IndexSizeMB],ixm.[UserSeeks],ixm.[UserScans],
				ixm.[UserLookups],ixm.[UserUpdates],ixm.[IndexMetricsChecks],ixm.[SQLServerStartTime],t.[totalUserSeek],t.[totalUserScans],t.[totalUserLookups],t.[totalUserUpdates],
				[TotalIndexMetricsChecks] = t.[totalCount],	t.[DateInitiallyChecked], t.[DateLastChecked], ixm.[isDisabled], ixm.[isHypothetical],
				ROW_NUMBER() OVER (PARTITION BY ixm.[Hash] ORDER BY ixm.SQLServerStartTime DESC) AS rn
			FROM [sqlmetrics].[IndexMetrics] ixm
			INNER JOIN (SELECT [Hash], [totaluserseek] = SUM(UserSeeks), [totalUserScans] = SUM(UserScans), [totalUserLookups] = SUM(UserLookups), 
							[totalUserUpdates] = SUM(UserUpdates), [totalcount] = SUM([IndexMetricsChecks]),[DateInitiallyChecked] = MIN([DateInitiallyChecked]),
							[DateLastChecked] = MAX([DateLastChecked])
						FROM [sqlmetrics].[IndexMetrics]
						GROUP BY [Hash]
						) t ON t.[Hash] = ixm.[Hash]
		) ix
	WHERE ix.rn = 1

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [sqlmetrics].[vwIndexMetrics_RarelyUsedIndexes]
AS
	/**************************************************************************
		Author: Eric Cobb - http://www.sqlnuggets.com/
		License:
				MIT License
				Copyright (c) 2017 Eric Cobb
				View full license disclosure: https://github.com/ericcobb/SQL-Server-Metrics-Pack/blob/master/LICENSE
		Purpose: 
				This view queries the IndexMetrics table to return rarely used since the last SQL Server restart, as determined by the sys.dm_os_sys_info DMV. 	
				This view considers an index "rarely" used when the summed total of UserSeeks, UserScans, and UserLookups is less than 25% of number of upates to the index.
				Excludes Heaps, Clustered Indexes, Primary Keys, Disabled and Hypothetical indexes.
	***************************************************************************/

	SELECT [DatabaseID]
		  ,[DatabaseName]
		  ,[SchemaName]
		  ,[TableName]
		  ,[IndexName]
		  ,[IndexType]
		  ,[UserSeeks]
		  ,[UserScans]
		  ,[UserLookups]
		  ,[UserUpdates]
		  ,[LastUserSeek]
		  ,[LastUserScan]
		  ,[LastUserLookup]
		  ,[LastUserUpdate]
		  ,[Rows]
		  ,[IndexSizeMB]
		  ,[IndexMetricsChecks]
		  ,[DateInitiallyChecked]
		  ,[DateLastChecked]
		  ,[SQLServerStartTime]
		  ,[DropStatement]
  FROM [sqlmetrics].[IndexMetrics] ixm
  INNER JOIN sys.dm_os_sys_info info ON ixm.[SQLServerStartTime] = info.[sqlserver_start_time]
  WHERE ixm.[IndexID] > 1
  AND	(ixm.[isDisabled] = 0 AND ixm.[isHypothetical] = 0 AND ixm.[isPrimaryKey] = 0)
  AND   ((ixm.[UserSeeks] + ixm.[UserScans] + ixm.[UserLookups]) < (ixm.[UserUpdates] * 0.25)
		OR (ixm.[UserSeeks] + ixm.[UserScans] + ixm.[UserLookups]) = 0)

GO
