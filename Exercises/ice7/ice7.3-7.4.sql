#ice7.3
USE common;
SELECT DISTINCT c.cname, c.cid 
	FROM course c JOIN qualification q JOIN faculty f 
	ON c.cid=q.cid AND f.fname="Ama" 
	ORDER BY c.cid DESC;
SELECT DISTINCT c.cname, c.cid
	FROM course c, qualification q, faculty f
	WHERE c.cid=q.cid AND f.fname="Ama"
    ORDER BY c.cid DESC;
    
#ice7.4
SELECT DISTINCT f.fid, f.fname
	FROM faculty f, qualification q
    WHERE f.fid=q.fid
    ORDER BY f.fname;
SELECT DISTINCT f.fid, f.fname
	FROM faculty f JOIN qualification q
    ON f.fid=q.fid
    ORDER BY f.fname;
    
#use JOIN...ON and (no join),...WHERE