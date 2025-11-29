WITH agg AS(
    SELECT
        region,
        model,
        SUM(sales_volume) AS total_units
    FROM sales
    GROUP BY region, model
)
SELECT
    region,
    model,
    total_units
FROM(
    SELECT
        region,
        model,
        total_units,
        DENSE_RANK() OVER(PARTITION BY region ORDER BY total_units DESC) AS rnk
    FROM agg
) t
WHERE rnk <= 3
ORDER BY region, rnk