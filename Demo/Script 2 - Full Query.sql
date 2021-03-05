USE [TestDWH]
GO

CREATE EXTERNAL TABLE [awdb].[SalesOrderHeader]
(
      [SalesOrderID] INT NOT NULL
	, [RevisionNumber] TINYINT NOT NULL
	, [OrderDate] DATETIME2(3) NOT NULL
	, [DueDate] DATETIME2(3) NOT NULL
	, [ShipDate] DATETIME2(3)
	, [Status] TINYINT NOT NULL
	, [SalesOrderNumber] NVARCHAR(25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
	, [CustomerID] INT NOT NULL
	, [SalesPersonID] INT
	, [TerritoryID] INT
	, [BillToAddressID] INT NOT NULL
	, [ShipToAddressID] INT NOT NULL
	, [ShipMethodID] INT NOT NULL
	, [CreditCardID] INT
	, [CreditCardApprovalCode] VARCHAR(15) COLLATE SQL_Latin1_General_CP1_CI_AS
	, [CurrencyRateID] INT
	, [SubTotal] MONEY NOT NULL
	, [TaxAmt] MONEY NOT NULL
	, [Freight] MONEY NOT NULL
	, [TotalDue] MONEY NOT NULL
	, [Comment] NVARCHAR(128) COLLATE SQL_Latin1_General_CP1_CI_AS
	, [rowguid] UNIQUEIDENTIFIER NOT NULL
	, [ModifiedDate] DATETIME2(3) NOT NULL
)
WITH (
    LOCATION = N'[AdventureWorks2019].[Sales].[SalesOrderHeader]', 
    DATA_SOURCE = [AdvWrksDB]
);

CREATE EXTERNAL TABLE [awdb].[SalesOrderDetail]
(
      [SalesOrderID] INT NOT NULL
	, [SalesOrderDetailID] INT NOT NULL
	, [CarrierTrackingNumber] NVARCHAR(25) COLLATE SQL_Latin1_General_CP1_CI_AS
	, [OrderQty] SMALLINT NOT NULL
	, [ProductID] INT NOT NULL
	, [SpecialOfferID] INT NOT NULL
	, [UnitPrice] MONEY NOT NULL
	, [UnitPriceDiscount] MONEY NOT NULL
	, [LineTotal] DECIMAL(38, 6) NOT NULL
	, [rowguid] UNIQUEIDENTIFIER NOT NULL
	, [ModifiedDate] DATETIME2(3) NOT NULL
)
WITH (
    LOCATION = N'[AdventureWorks2019].[Sales].[SalesOrderDetail]', 
    DATA_SOURCE = [AdvWrksDB]
);

--CREATE STATISTICS stat_awdb_sales_order_header ON [awdb].[SalesOrderHeader] (SalesOrderID) WITH FULLSCAN;
--CREATE STATISTICS stat_awdb_sales_order_detail ON [awdb].[SalesOrderDetail] (SalesOrderID) WITH FULLSCAN;
--GO
