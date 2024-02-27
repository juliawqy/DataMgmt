use ice6_0;
SELECT DISTINCT major FROM test_student; #6.8.1
SELECT DISTINCT major FROM test_student GROUP BY major HAVING COUNT(StudentID) >= 2; #6.8.2