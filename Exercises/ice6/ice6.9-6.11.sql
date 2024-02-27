use common;
SELECT * FROM room;
SELECT type, COUNT(type) AS TotalCount FROM room GROUP BY type; #6.9
SELECT type, COUNT(type) AS TotalCount FROM room GROUP BY type HAVING (TotalCount >= 2); #6.10
SELECT type, MIN(capacity), MAX(capacity) FROM room GROUP BY type; #6.11