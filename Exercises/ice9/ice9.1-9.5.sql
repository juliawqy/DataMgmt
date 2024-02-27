USE common;

#ice 9.1
SELECT sid, sname FROM student
	WHERE sid IN
    (SELECT r.sid FROM registration r, course c WHERE r.cid=c.cid AND c.cname IN ("Database"))
    AND sid IN
    (SELECT r.sid FROM registration r, course c WHERE r.cid=c.cid AND c.cname IN ("Networking"));

#ice 9.2
SELECT fname FROM faculty
	WHERE fid IN
    (SELECT q.fid FROM qualification q, course c WHERE q.cid=c.cid AND c.cname="Syst Analysis")
    OR fid IN
    (SELECT q.fid FROM qualification q, course c WHERE q.cid=c.cid AND c.cname="Syst Design");

#ice 9.3
SELECT fid FROM faculty
	WHERE fid IN
    (SELECT q.fid FROM qualification q, course c WHERE q.cid=c.cid AND c.cname IN ("Syst Analysis", "Syst Design") 
		GROUP BY q.fid HAVING COUNT(q.fid)=1);

#ice 9.4
SELECT sid, sname FROM student
	WHERE sid IN 
    (SELECT r.sid FROM registration r, course c WHERE r.cid=c.cid AND c.cname IN ("Syst Analysis", "Syst Design")
		GROUP BY r.sid HAVING COUNT(r.sid)=1);
        
#ice 9.5
SELECT fid, fname FROM faculty
	WHERE fid IN
	(SELECT q.fid FROM qualification q, course c WHERE q.cid=c.cid AND c.cname="Syst Design")
    AND fid NOT IN 
    (SELECT q.fid FROM qualification q, course c WHERE q.cid=c.cid AND c.cname NOT IN ("Syst Design"));
    