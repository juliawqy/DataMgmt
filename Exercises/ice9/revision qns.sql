use common;

#R1
SELECT r.sid FROM registration r, course c WHERE r.cid=c.cid AND c.cname = "Database";

#R2
SELECT q.fid FROM course c, qualification q WHERE c.cid=q.cid AND c.cname = "Syst Analysis";

#R3
SELECT f.fname FROM faculty f, course c, qualification q WHERE f.fid=q.fid AND c.cid=q.cid AND c.cname = "Syst Analysis";
#implicit join^
#explicit join: SELECT f.fname JOIN faculty f JOIN course c JOIN qualification q ON (f.fid=q.fid AND c.cid=q.cid AND c.cname = "Syst Analysis");
#harder to unds but need to know:
#SELECT f.fname FROM (course c JOIN qualification q ON c.cid=q.cid AND c.cname = "Syst Analysis") JOIN faculty f ON f.fid=q.fid;

#R4
SELECT q.fid FROM course c, qualification q 
	WHERE c.cid=q.cid AND c.cname IN ("Syst Design", "Syst Analysis") 
    GROUP BY q.fid HAVING COUNT(DISTINCT cname)=2; #COUNT(q.fid)=2 oh actually same, just means got 2 returned rows, can put * also

#R5
SELECT fid FROM qualification GROUP BY fid HAVING COUNT(cid)=1; #COUNT(fid)=1

#R6
SELECT s.sid, r.cid FROM registration r RIGHT JOIN student s ON (s.sid=r.sid AND r.semester = "I-2002");
# if use WHERE, its done AFTER the JOIN