------------------------------------------
-- Dynamic Pivot Query
-------------------------------------------
-------------------------------------------------------------------------
CREATE PROCEDURE dbo.DynamicPivotTableProject
  	@ColumnToPivot1  NVARCHAR(255),
	@ColumnToPivot2  NVARCHAR(255),
  	@ListToPivot    NVARCHAR(255),
	@Pnum NVARCHAR(255)
AS
BEGIN
 
  DECLARE @SqlStatement NVARCHAR(MAX)
  SET @SqlStatement = N'
    SELECT '''+@ColumnToPivot1+''' AS title ,'+@ListToPivot+'   FROM (
      SELECT
        Labor,ProjectedMonth
      FROM Projects where ProjectID = cast('+@Pnum+' AS int)
    ) Results
    PIVOT (
      SUM([Labor])
      FOR [ProjectedMonth]
      IN (
        '+@ListToPivot+'
      )
    ) AS PivotTable
	union all
    SELECT '''+@ColumnToPivot2+''' AS title ,'+@ListToPivot+'   FROM (
      SELECT
        Equipment,ProjectedMonth
      FROM Projects where ProjectID = cast('+@Pnum+' AS int)
    ) Results
    PIVOT (
      SUM([Equipment])
      FOR [ProjectedMonth]
      IN (
        '+@ListToPivot+'
      )
    ) AS PivotTable2

  '
   EXEC(@SqlStatement)
 
END


-- Run Query
----------------------------------------------------------------------------------------------------------
-- User can pass Column Names ( Labor and Equipemnt) along Column Values for Pivot and Finally ProjectID for Query 
EXEC dbo.DynamicPivotTableProject
  N'Labor', N'Equipment'
  ,N'[2021-09-01],[2021-10-01],[2021-11-01]',1

 ----------------------------------------------------------------------------------------------------------