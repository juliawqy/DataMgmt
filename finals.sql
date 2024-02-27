#Name: WONG Qian Yu (ID: qianyu.wong.2022)
USE vms;

#Q1
SELECT name, primarytel FROM user u, sa WHERE sa.acctname=u.acctname ORDER BY name DESC;

#Q2
SELECT void, name FROM vo WHERE name LIKE "%SMU%";

#Q3
SELECT void, acctname FROM affiliation a WHERE EXTRACT(YEAR FROM dateofaffiliation)=2020;

#Q4
SELECT DISTINCT id, COUNT(DISTINCT runid) FROM run WHERE noofhours>24 GROUP BY id;

#Q5
SELECT name, u.acctname FROM user u, ru
WHERE ru.acctname=u.acctname AND u.acctname in
	(SELECT ru.acctname FROM ru, affiliation a, register r 
    WHERE ru.acctname=a.acctname AND r.acctname=a.acctname AND r.void=a.void
	GROUP BY r.void HAVING COUNT(DISTINCT r.void)=1 > FOR SUM(numhrs) > 100 );
    
SELECT ru.acctname FROM ru, affiliation a, register r 
    WHERE ru.acctname=a.acctname AND r.acctname=a.acctname AND r.void=a.void
    AND 
		SELECT SUM(numhrs) FROM register GROUP BY void HAVING COUNT(DISTINCT void)=1
	> 100;

#Q6
SELECT acctname, COUNT(DISTINCT name) FROM register r1 
WHERE completed=1 GROUP BY acctname;

#Q7
SELECT void, name, MIN(vocount) as NoOfPosts FROM 
	(SELECT COUNT(DISTINCT void) AS vocount FROM post GROUP BY void) AS temp, vo
    GROUP BY void;

#Q8
SELECT EXTRACT(MONTH FROM startdate), EXTRACT(YEAR FROM startdate) 

#Q9
SELECT void, vo.name, startdate, message FROM 

#Q10


#Q11

DELIMITER $$
CREATE PROCEDURE sp_checkEndorsement(IN void INT, OUT NumOfCoursesOrganized INT, OUT ParentExist CHAR(3), OUT NumOfParents INT)
BEGIN
	DECLARE checkparent CHAR(3);
    DECLARE numparents INT;
    SET checkparent = "No";
    SET numparents = 0;
    
	SELECT COUNT(DISTINCT id) INTO NumOfCoursesOrganized FROM c_organize c, vo 
		WHERE vo.void=c.void GROUP BY c.void;
	IF (SELECT parent FROM vo_parent v, vo 
		WHERE vo.void=v.child AND vo.void=v.parent) != NULL THEN
			SET checkparent = "Yes";
			SET numparents = (SELECT COUNT(DISTINCT parent) FROM vo_parent v, vo 
								WHERE vo.void=v.child AND vo.void=v.parent);
	END IF;
    SET ParentExist = checkparent;
    SET NumOfParents = numparents;
END$$
DELIMITER ;

CALL sp_checkEndorsement(112, @r1, @r2, @r3);
