-- P(20) Decreasing
----------------------------------------

WITH CountDown AS (
    SELECT 20 AS counter
    UNION ALL
    SELECT counter - 1
    FROM CountDown
    WHERE counter > 0
)
SELECT REPLICATE('* ', counter)
FROM CountDown