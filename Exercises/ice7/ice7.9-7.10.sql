USE common;

#ice7.9
SELECT c.cid, c.cname, COUNT(r.sid) as StudentsCount
	FROM course c LEFT JOIN registration r
    ON c.cid=r.cid AND r.semester="I-2002"
    GROUP BY c.cid;
    
#ice7.10
SELECT r.sid
	FROM registration r, course c
    WHERE c.cid=r.cid AND c.cname IN ("Database", "Networking")
    GROUP BY r.sid
    HAVING COUNT(c.cid) = 2;
SELECT DISTINCT r.sid #using subquery (but a bit dumb since is and
	FROM registration r, course c
    WHERE r.cid=c.cid AND r.sid IN
		(SELECT r.sid FROM registration r, course c
        WHERE r.cid=c.cid AND cname="Database")
	AND r.sid IN
		(SELECT r.sid FROM registration r, course c
        WHERE r.cid=c.cid AND cname="Networking");