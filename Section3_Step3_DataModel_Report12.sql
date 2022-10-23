-- Run Report for Dynamic Movie Name using Wild Card
----------------------------------------------------------------------------------------------------------

CREATE PROCEDURE dbo.GetMovieSummary
@MovieName nvarchar(200)
AS
BEGIN
	--set @MovieName = '%' + @MovieName + '%'
  DECLARE @SqlStatement NVARCHAR(MAX)
  SET @SqlStatement = N'
SELECT dd.Movie, dd.GENRE, dd.MPAARating, dd.Year,(TOTALFORYEAR) TOTAL FROM [dbo].[Fact_moviestatistics] ff 
right join [dbo].[DI_movie] dd on dd.SkeyMovie = ff.SkeyMovie
where dd.Movie  like ''%'+@MovieName+'%''  order by TOTALFORYEAR desc
  '
   EXEC(@SqlStatement)
 
END
EXEC dbo.GetMovieSummary
  N'Harry'
------------------------------------------------
