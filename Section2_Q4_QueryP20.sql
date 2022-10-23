-- P(20) Incrementing
-------------------------------------------
WITH CountUp AS (
    SELECT 1 AS counter
    UNION ALL
    SELECT counter + 1
    FROM CountUp
    WHERE counter < 20
)
SELECT REPLICATE('* ', counter)
FROM CountUp