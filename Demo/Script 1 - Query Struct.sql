USE [TestDWH]
GO

-- Create scehma to put out external tables in. Not required, but good for housekeeping.
CREATE SCHEMA [awdb];
GO

-- Create Scoped Credentials
CREATE DATABASE SCOPED CREDENTIAL AwUser WITH IDENTITY = 'aw_user', SECRET = 'Password123!';
GO

-- Create Data Source
CREATE EXTERNAL DATA SOURCE [AdvWrksDB]
WITH (
    LOCATION = N'sqlserver://localhost', 
    PUSHDOWN = ON, -- On by default
    CREDENTIAL = [AwUser]
);

-- Create External Table
CREATE EXTERNAL TABLE [awdb].[SalesOrderHeader] -- External table we are creating
(
    [foo] INT
)
WITH (
	-- External [database].[schema].[table]
    LOCATION = N'[AdventureWorks2019].[Sales].[SalesOrderHeader]', 
    DATA_SOURCE = [AdvWrksDB] -- Datasource we are connecting to
);