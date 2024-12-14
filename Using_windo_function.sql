SELECT
      *,
	  amount*100/SUM(amount) over(partition by category) AS pct 
      FROM random_tables.expenses
      ORDER BY category;
