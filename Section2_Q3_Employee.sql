-- Query

-- Use Concat and Left function to output

select CONCAT("Name" ,'(' , LEFT("Occupation", 1) ,')') as MyName from OCCUPATIONS order by "Name" asc


select CONCAT( 'There are total of ', count("Occupation"),' ', lower("Occupation"),'s') from OCCUPATIONS group by "Occupation" order by count("Occupation"), "Occupation" asc 