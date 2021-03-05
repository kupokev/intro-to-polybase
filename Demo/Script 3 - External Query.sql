USE [TestDWH]
GO

SELECT *
FROM [awdb].[SalesOrderHeader] h
	LEFT OUTER JOIN [awdb].[SalesOrderDetail] d ON h.SalesOrderID = d.SalesOrderID


--CREATE STATISTICS stat_awdb_sales_order_header ON [awdb].[SalesOrderHeader] (SalesOrderID) WITH FULLSCAN;
--CREATE STATISTICS stat_awdb_sales_order_detail ON [awdb].[SalesOrderDetail] (SalesOrderID) WITH FULLSCAN;
--GO

--DBCC FREEPROCCACHE WITH NO_INFOMSGS;