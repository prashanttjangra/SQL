SELECT
    fuel_type,
    SUM(price_usd * sales_volume) AS total_revenue,
    SUM(sales_volume) AS total_units
FROM sales
GROUP BY fuel_type
ORDER BY total_revenue DESC