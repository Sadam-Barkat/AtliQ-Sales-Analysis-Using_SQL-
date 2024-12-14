SELECT
      *,
      SUM(amount) OVER(partition by category order by date) AS total_expence_till_date
      FROM random_tables.expenses;