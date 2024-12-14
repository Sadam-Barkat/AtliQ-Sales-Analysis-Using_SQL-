#---Month
#---Product Name
#---Variant
#---Sold Quantity
#---Gross Price Per Item
#---Gross Price Total

SELECT s.date, YEAR(date) AS fiscsal_year, s.customer_code, p.product, p.variant,
s.sold_quantity, g.gross_price,
ROUND(g.gross_price*s.sold_quantity,2) AS gross_price_tota
FROM fact_sales_monthly s
JOIN dim_product p
ON p.product_code = s.product_code
JOIN fact_gross_price g
ON g.product_code = s.product_code AND g.fiscal_year = get_fiscal_year(s.date)
WHERE customer_code=90002002
AND  get_fiscal_year(date)=2021
AND  get_fiscal_quarter(date)="Q3"
ORDER BY date ASC;