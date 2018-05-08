select ProductAlternateKey,ProductAlternateKey,EnglishProductName,EnglishDescription,[Status] from DimProduct a where Status ='current'

 select * from DimProduct

select * from  INFORMATION_SCHEMA.columns


select * from FactInternetSales

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
,[Status] 
from  FactInternetSales a
inner join  DimProduct b on a.ProductKey=b.ProductKey


select distinct SalesOrderLineNumber from FactInternetSales order by SalesOrderLineNumber desc

select distinct SalesOrderLineNumber from FactInternetSales order by SalesOrderLineNumber desc