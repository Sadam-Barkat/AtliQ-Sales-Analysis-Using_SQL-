WITH forecast_error AS (
SELECT 
      s.customer_code,
      SUM(s.sold_quantity) AS total_sold_qty,
      SUM(s.forecast_quantity) AS total_forecast_qty,
      SUM((forecast_quantity-sold_quantity)) AS net_error,
      SUM((forecast_quantity-sold_quantity))*100/SUM(forecast_quantity) AS net_error_pct,
      SUM(ABS((forecast_quantity-sold_quantity))) AS abs_error,
      SUM(ABS((forecast_quantity-sold_quantity)))*100/SUM(forecast_quantity) AS abs_error_pct
      FROM gdb0041.fact_actual_estimate s
      WHERE s.fiscal_year = 2021
      GROUP BY s.customer_code)

SELECT
       e.*,
       c.customer,
	  IF(abs_error_pct>100, 0 , 100-abs_error_pct) AS forecast_accuracy
      FROM forecast_error e
      JOIN dim_customer c
           USING(customer_code)
      ORDER BY forecast_accuracy DESC;










