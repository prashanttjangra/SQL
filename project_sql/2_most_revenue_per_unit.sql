SELECT
    model,
    SUM(price_usd * sales_volume) AS total_revenue,
    SUM(sales_volume) AS total_units,
    (SUM(price_usd * sales_volume) / NULLIF(SUM(sales_volume),0)) AS revenue_per_unit
FROM sales
GROUP BY model
ORDER BY revenue_per_unit DESC