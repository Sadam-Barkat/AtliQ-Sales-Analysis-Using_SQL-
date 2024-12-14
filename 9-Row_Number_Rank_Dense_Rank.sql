WITH cte1 AS(
SELECT 
      *,
      ROW_NUMBER() OVER(partition by category order by amount desc) AS rn,
      RANK() OVER(partition by category order by amount desc) AS rnk,
      DENSE_RANK() OVER(partition by category order by amount desc) AS drank
      FROM random_tables.expenses
      )
SELECT 
      *
      FROM cte1
      WHERE rn<=2;
      