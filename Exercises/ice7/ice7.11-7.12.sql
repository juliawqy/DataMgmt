USE common;

#ice7.11
SELECT f.fid
	FROM faculty f, qualification q, course c
	WHERE f.fid=q.fid AND c.cid=q.cid AND c.cname IN ("Syst Analysis", "Syst Design")
    GROUP BY f.fid
    HAVING COUNT(c.cid) = 1;

#ice7.12
SELECT q1.fid, q2.fid, q1.cid, c.cname
	FROM qualification q1, qualification q2, course c
    WHERE q1.cid=q2.cid AND q1.cid=c.cid AND q2.cid=c.cid AND q1.fid<q2.fid;