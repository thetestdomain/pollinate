-- Run Report for Genre of Movies 
----------------------------------------------------------------------------------------------------------
CREATE PROCEDURE dbo.GetMovieGenre
AS
BEGIN
  DECLARE @SqlStatement NVARCHAR(MAX)
  SET @SqlStatement = N'
SELECT dd.GENRE, sum(TICKETSSOLD) SOLD FROM [dbo].[Fact_moviestatistics] ff 
right join [dbo].[DI_movie] dd on dd.SkeyMovie = ff.SkeyMovie 
group by dd.GENRE order by sum(TICKETSSOLD) desc
  '
   EXEC(@SqlStatement)
 
END

EXEC dbo.GetMovieGenre