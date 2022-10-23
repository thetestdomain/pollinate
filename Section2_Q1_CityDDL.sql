CREATE TABLE IF NOT EXISTS CITY
(
    "ID" bigint,
    "NAME" nvarchar(17),
    "COUNTRYCODE" nvarchar(3),
    "DISTRICT" nvarchar(20),
    "POPULATION" bigint
)

-- Using Inverted Coma to bypass reserved name and Using Captital Letter for Column Names
select * from CITY where "ID" = 1661


-- Query for Getting City Names in Descending Order 
SELECT name FROM [dbo].[cities] order by  name desc
