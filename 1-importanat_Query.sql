WITH cte1 AS (SELECT
	  s.date, s.fiscal_year,
      s.customer_code, 
      p.product, p.variant,
      s.sold_quantity,
      g.gross_price AS gross_price_per_item,
      pre.pre_invoice_discount_pct,
	  ROUND(g.gross_price*s.sold_quantity,2) AS gross_price_total
	  FROM fact_sales_monthly s
	  JOIN dim_product p
	       ON p.product_code = s.product_code
	  JOIN fact_gross_price g
	       ON g.product_code = s.product_code 
           AND g.fiscal_year = s.fiscal_year
      JOIN fact_pre_invoice_deductions pre
           ON pre.customer_code = s.customer_code
           AND pre.fiscal_year = s.fiscal_year
	)
      
	SELECT *,
           (gross_price_total - gross_price_total*pre_invoice_discount_pct) AS net_invoice_sale
	FROM cte1;
     