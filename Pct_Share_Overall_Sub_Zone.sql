WITH cte1 AS(
SELECT 
	  c.sub_zone,
	  ROUND(SUM(net_sales)/1000000,2) AS net_sales_mln
	  FROM gdb0041.net_sales s
	  JOIN dim_customer c
		   ON c.customer_code = s.customer_code
	  WHERE s.fiscal_year = 2021
	  GROUP BY c.sub_zone
      )
      
      SELECT 
             sub_zone,
             net_sales_mln*100/SUM(net_sales_mln) OVER()  AS pct_share_overall
             FROM cte1
	  ORDER BY net_sales_mln DESC
      LIMIT 10;
