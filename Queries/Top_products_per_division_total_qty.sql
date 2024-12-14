WITH cte1 AS(
			SELECT
				  p.division,
				  p.product,
				  SUM(sold_quantity) AS total_qty
			FROM fact_sales_monthly s
			JOIN dim_product p
				 ON p.product_code = s.product_code
			WHERE s.fiscal_year = 2021      
			GROUP BY p.product, p.division
            ),
            
 cte2 AS(
			SELECT
				  *,
				  DENSE_RANK() OVER(partition by division order by total_qty desc) AS drank
			FROM cte1)
SELECT
      *
FROM cte2
WHERE drank<=3;      
  
