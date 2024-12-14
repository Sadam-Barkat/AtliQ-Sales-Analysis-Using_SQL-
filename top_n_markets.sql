SELECT 
	  market,
      ROUND(SUM(net_sales)/1000000,2) AS net_sales_mln
      FROM gdb0041.net_sales
      WHERE fiscal_year = 2021
      GROUP BY market
      ORDER BY net_sales_mln DESC
      LIMIT 5;
