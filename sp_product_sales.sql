USE [AdventureWorksDW2012]
GO
/****** Object:  StoredProcedure [dbo].[sp_product_sales]    Script Date: 04/05/2018 16:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[sp_product_sales]
@StartDate date,@EndDate date,
-- @ProductName varchar(8000)
@Category varchar (8000)

as

select OrderDateKey
,CustomerKey
,a.ProductKey
,CurrencyKey
,SalesTerritoryKey
,SalesOrderNumber
,SalesOrderLineNumber
,OrderQuantity
,UnitPrice
,DiscountAmount
,ProductStandardCost
,SalesAmount
,TaxAmt
,Freight
,ProductAlternateKey
,EnglishProductName
,LargePhoto
,EnglishDescription
,[Status] RecordStatus
,EnglishProductCategoryName
,EnglishProductSubcategoryName
,DayNumberOfMonth,EnglishMonthName,CalendarQuarter,CalendarYear
from  FactInternetSales a
inner join  DimProduct b on a.ProductKey=b.ProductKey
inner join  DimProductSubCategory c on b.ProductSubcategoryKey=c.ProductSubcategoryKey
inner join DimProductCategory e on c.ProductCategoryKey=e.ProductCategoryKey
inner join DimDate d on a.OrderDateKey=d.DateKey
where 
FullDateAlternateKey between @StartDate and @EndDate
AND EnglishProductCategoryName in (select * from dbo.fn_split_items(@Category,','))

-- select * from DimDate
/*
select * from DimProductSubcategory

select * from DimProductCategory

select * from DimProduct
*/
--select max(OrderDate) MaxD,min(OrderDate) MinD from FactInternetSales
--exec sp_product_sales '2010-12-29','2014-04-28','Accessories'