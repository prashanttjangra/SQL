SELECT
    transmission,
    SUM(sales_volume) AS total_units,
    ROUND(AVG(price_usd), 2) AS avg_price
FROM sales
GROUP BY transmission
ORDER BY total_units DESC