SELECT Doctor, Professor, Singer, Actor

FROM (
    SELECT *,
        ROW_NUMBER() OVER(PARTITION BY occupation ORDER BY name) AS rn
        --row_number() will number occupations from 1; each occupation will start from 1 and go until next occupation start; ex: here doctor is repeated 3 times, hence 1, 2, 3.
    FROM occupations
) AS numbered_table
--PIVOT is to flip the table 
PIVOT (
    MAX(name)
    FOR occupation IN ([Doctor], [Professor], [Singer], [Actor])
) AS pt;