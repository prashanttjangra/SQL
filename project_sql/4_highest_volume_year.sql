SELECT
    year,
    SUM(sales_volume) AS total_units,
    SUM(price_usd * sales_volume) AS total_revenue
FROM sales
GROUP BY year
ORDER BY total_units DESC
LIMIT 1