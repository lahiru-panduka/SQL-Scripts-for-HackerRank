SELECT
  con.contest_id,
  con.hacker_id,
  con.name,
  sum(ss.total_sub),
  sum(ss.total_accepted_sub),
  sum(vs.total_views),
  sum(vs.unique_views)
FROM contests AS con
INNER JOIN colleges AS col
ON con.contest_id = col.contest_id
INNER JOIN challenges AS cha
ON col.college_id = cha.college_id
LEFT JOIN (
  SELECT
    challenge_id,
    SUM(total_views) AS total_views,
    SUM(total_unique_views) AS unique_views
  FROM View_Stats
  GROUP BY challenge_id
) AS vs
ON cha.challenge_id = vs.challenge_id
LEFT JOIN (
  SELECT
    challenge_id,
    SUM(total_submissions) AS total_sub,
    SUM(total_accepted_submissions) AS total_accepted_sub
  FROM submission_stats
  GROUP BY challenge_id
) AS ss
ON cha.challenge_id = ss.challenge_id
GROUP BY con.contest_id, con.hacker_id, con.name
HAVING sum(ss.total_sub) > 0 OR sum(ss.total_accepted_sub) > 0 OR sum(vs.total_views) > 0 OR sum(vs.unique_views) > 0
ORDER BY con.contest_id;