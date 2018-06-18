USE [master]
GO

--****[Help]********************************************************************  
--*
--*  This is the "Body" part of the whole DBAToolbox solution. Mainly there is 
--*  nothing special about this script. It only creates you a nice database 
--*  using a name and path you need to provide before executing the script.
--*
--*  Do remember to provide a correct path. If you prefer to rename the database
--*  then feel free to do so. Just have it in mind, for the other scripts 
--*  containing the main part of the DBAToolbox like stored procedures and co. 
--*  you need to adapt the db names, schemas and so on. 
--*
--*  At first I was thinking of providing the same fancy naming freedom for the 
--*  other main parts of the toolbox. It turned out to be a really time-consuming 
--*  and tedious task, so I kind of gave up for now ;D, maybe at a later time. 
--*  In case there is one who likes to handle this task, it would be very nice.
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

--****[Change Values If you Prefer]*********************************************  
DECLARE @DatabaseName NVARCHAR (255) = 'DBAToolbox'
DECLARE @DatabasePath NVARCHAR (255) = '/var/opt/mssql/'
--******************************************************************************  


--****[DO NOT Change unless you know what you are doing]************************  
DECLARE @SQLString NVARCHAR(MAX)
SET @SQLString = N'
USE [master]

CREATE DATABASE [' + @DatabaseName + ']
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N''' + @DatabaseName + ''', FILENAME = N''' + @DatabasePath + @DatabaseName + '.mdf'' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N''' + @DatabaseName + '_log'', FILENAME = N''' + @DatabasePath + @DatabaseName + '_log.ldf'' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)

'
--PRINT @SQLString

EXEC sp_executesql @Statement=@SQLString
