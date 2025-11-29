# Introduction
Focusing on BMW's global sales from 2010 to 2024, this project explores top-selling models across all regions, popular variants, and key insights hidden inside BMW's sales performance.

Check the queries out here: [project_sql_queries](/project_sql/)

# Background
Driven by a quest to understand BMW's performance over the years, this project was created to uncover the best-selling models and key sales drivers, making it easier for others to explore BMW's sales landscape with clarity.

### The questions I wanted to answer through my SQL queries were:
1. What are the top 3 models in each region by units sold?
2. Which models earn the most revenue per unit sold?
3. Which fuel type generates the most revenue overall?
4. Which year has the highest overall BMW sales volume?
5. How does sales volume vary by transmission type?

# Tools I Used
- **SQL:** The backbone of my analysis, enabling me to explore the dataset and extract meaningful insights from sales records.
- **PostgreSQL:** The database management system I used to store, clean, and manage the BMW sales data efficiently.
- **Visual Studio Code:** My go-to environment for writing and running SQL queries while managing the project structure.
- **Git & GitHub:** Essential for version control and showcasing my SQL scripts and analysis, ensuring transparency and smooth project tracking.

# The Analysis
### 1. Top 3 Models in Each Region by Units Sold
To identify the top 3 models sold in each region by units sold, this query highlights those leading performers.
 ``` sql
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
```
*Here's a breakdown of the top-performing models revealed by this query*

- With sales across 4 of 6 regions, the 7 series and i8 show global reach and consistent market presence.
- The i8 emerges as the best-selling model in Europe and also tops the overall sales ranking in the query.

### 2. Models That Earn the Most Revenue per Unit Sold
This query highlights the highest revenue-earning models
```sql
SELECT
    model,
    SUM(price_usd * sales_volume) AS total_revenue,
    SUM(sales_volume) AS total_units,
    (SUM(price_usd * sales_volume) / NULLIF(SUM(sales_volume),0)) AS revenue_per_unit
FROM sales
GROUP BY model
ORDER BY revenue_per_unit DESC
```
*Here's a breakdown of the results from this query*

- The 3 series, i8, and 7 series emerge as BMW's top revenue-generating models, showing they play the biggest role in driving overall earnings.
- The X3 and X1 both record high total units and solid revenue, highlighting the popularity of BMW's compact SUV lineup.

### 3. Fuel Type That Generates the Most Revenue Overall
Exploring which fuel type generates the most revenue overall
```sql
SELECT
    fuel_type,
    SUM(price_usd * sales_volume) AS total_revenue,
    SUM(sales_volume) AS total_units
FROM sales
GROUP BY fuel_type
ORDER BY total_revenue DESC
```
*Here's a breakdown of the most preferred fuel types*

- Hybrid vehicles generate the highest revenue overall, showing customers' willingness to pay for systems that offer improved fuel efficiency and lower emissions.
- Petrol models remain BMW's second-largest revenue contributor, reflecting the continued strength of traditional combustion engines.

### 4. Year With the Highest Overall Sales Volume
This query helped to identify the year with the highest overall BMW sales volume
```sql
SELECT
    year,
    SUM(sales_volume) AS total_units,
    SUM(price_usd * sales_volume) AS total_revenue
FROM sales
GROUP BY year
ORDER BY total_units DESC
LIMIT 1
```
*Here's a breakdown of the most successful year of sales*

- 2022 recorded the highest number of BMW units sold, making it the strongest sales year in the dataset.
- With the largest sales volume in 2022, this year reflects peak customer demand across BMW's lineup.

### 5. Variation of Sales Volume by Transmission Type
Identifying units sold and average price across transmission types
```sql
SELECT
    transmission,
    SUM(sales_volume) AS total_units,
    ROUND(AVG(price_usd), 2) AS avg_price
FROM sales
GROUP BY transmission
ORDER BY total_units DESC
```
*Here's a breakdown of how the two transmission types compare*

- Manual transmission models dominate unit sales, showing their continued appeal in BMW's buyers.
- Automatic models higher average price reflects that automatics are positioned in more premium, feature-rich, or luxury-oriented BMW models.

# What I Learned
Throughout this project, I significantly strengthened my SQL skillset and analytical capabilities:

- **Complex Query Crafting:** Mastered advanced SQL techniques, using subqueries and WITH clauses for clean, efficient query structuring.
- **Data Aggregation:** Got comfortable with GROUP BY and transformed aggregate functions like COUNT() and AVG() into reliable data-summarizing tools.
- **Analytical Thinking:** Enhanced my problem-solving abilities, turning real-world questions into clear, insightful SQL queries.

# Conclusions
### Insights
1. Different regions show distinct buying behaviors — with models like the 7 Series appearing in 4 out of 6 regions, indicating broad global appeal.
2. BMW’s revenue is driven by a blend of mass-market hits (3 Series) and high-value premium models (i8 and 7 Series), reflecting a balanced product strategy between volume and luxury.
3. Hybrid vehicles generate the highest revenue overall, showing strong customer willingness to pay for improved fuel efficiency and lower emissions. Petrol follows closely, while electric and diesel trail behind.
4. 2022 emerges as the strongest sales year in the dataset, marking the peak in BMW’s unit sales and overall market momentum.
5. Manual transmission models record higher total unit sales but lower average prices, suggesting they dominate the more affordable BMW segments. Automatics, though lower in volume, are priced higher and lean toward premium offerings.

### Closing Thoughts
This project strengthened my SQL skills and provided valuable insights into BMW’s sales performance across models, regions, fuel types, and transmission categories. The findings from the analysis highlight the key factors driving BMW’s revenue and the variations in customer preferences across different segments. This work also reinforced the importance of strong analytical thinking when working with real-world datasets.