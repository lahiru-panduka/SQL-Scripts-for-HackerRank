WITH max_score AS
(
SELECT h.hacker_id, s.challenge_id, MAX(score) AS highest
FROM Hackers h
JOIN Submissions s
ON h.hacker_id = s.hacker_id
GROUP BY s.challenge_id, h.hacker_id
)

SELECT m.hacker_id, hk.name, SUM(highest) AS total
FROM max_score m
LEFT JOIN Hackers hk
ON m.hacker_id = hk.hacker_id
GROUP BY m.hacker_id, hk.name
HAVING SUM(highest) > 0
ORDER BY total DESC, m.hacker_id;