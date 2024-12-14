SELECT 
	  c.customer,
      ROUND(SUM(net_sales)/1000000,2) AS net_sales_mln
      FROM gdb0041.net_sales s
      JOIN dim_customer c
           ON c.customer_code = s.customer_code
      WHERE fiscal_year = 2021
      GROUP BY c.customer
      ORDER BY net_sales_mln DESC
      LIMIT 5;