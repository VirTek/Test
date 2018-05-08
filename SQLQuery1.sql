create proc sp_category
as
select distinct EnglishProductCategoryName from [dbo].[DimProductCategory]