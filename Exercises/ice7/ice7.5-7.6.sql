USE common;

#ice7.5
SELECT c.cname, c.cid, s.sname
	FROM course c, registration	r, student s
	WHERE s.sid=r.sid AND c.cid=r.cid AND s.sname LIKE "%a%";
    
#ice7.6
SELECT f.fid, f.fname, q.cid
	FROM faculty f LEFT JOIN qualification q
    ON f.fid=q.fid;