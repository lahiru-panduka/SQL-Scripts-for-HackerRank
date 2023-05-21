SELECT CAST(ABS(MAX(lat_n) - MIN(lat_n)) + ABS(MAX(long_w) - MIN(long_w)) AS DECIMAL(9, 4))
FROM station;

--ABS() : absolute value
--Decimal(precision,scale)
--precision: values from 1 to 38, default value = 18