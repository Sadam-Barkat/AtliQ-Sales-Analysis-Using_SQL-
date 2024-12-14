WITH cte1 AS(
SELECT 
      c.customer,
      c.region,
	  ROUND(SUM(net_sales)/1000000,2) AS net_sales_mln
	  FROM gdb0041.net_sales s
	  JOIN dim_customer c
		   ON c.customer_code = s.customer_code
	  WHERE s.fiscal_year = 2021
	  GROUP BY c.region, c.customer
      )
      
      SELECT  
             *,
             net_sales_mln*100/SUM(net_sales_mln) OVER(partition by region)  AS pct_share_overall
             FROM cte1
	  ORDER BY region, net_sales_mln DESC
     # LIMIT 10;
      