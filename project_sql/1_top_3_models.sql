SELECT region, model, SUM(sales_volume) AS units
FROM sales
GROUP BY region, model
ORDER BY region, units DESC