SELECT SID, Sname FROM student WHERE (SID < 50000);  #6.2
SELECT FID, CID, Date_Qualified FROM qualification WHERE EXTRACT(YEAR FROM Date_Qualified) >= 1993; #6.3 >= 1993 needs to be out the func
SELECT Fname FROM faculty WHERE Fname LIKE '%a%'; #6.4
SELECT FID, Date_Qualified FROM qualification WHERE (CID IN ('ISM 3112', 'ISM 3113') AND EXTRACT(MONTH FROM Date_Qualified) = 09); #6.5
SELECT COUNT(SID) AS StudentCount FROM registration WHERE (CID IN ('ISM 4212') AND semester IN ('I-2001')); #6.6
SELECT COUNT(DISTINCT SID) AS TotalNumber FROM registration WHERE (semester IN ('I-2001')); #6.7