SELECT
  w.id,
  wp.age,
  w.coins_needed,
  w.power
FROM
  wands AS w
JOIN
  wands_property AS wp ON w.code = wp.code
WHERE
  wp.is_evil = 0
  AND w.coins_needed = (
    SELECT
      MIN(coins_needed)
    FROM
      wands AS ws
    WHERE
      ws.power = w.power
      AND ws.code = w.code
  )
ORDER BY
  power DESC,
  age DESC;