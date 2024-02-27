#ice7.1
USE common;
SELECT s.sid, s.sname, r.cid FROM registration r JOIN student s ON r.sid=s.sid AND r.semester="I-2001" ; #explicit join
SELECT s.sid, s.sname, r.cid FROM registration r, student s WHERE r.sid=s.sid AND r.semester="I-2001"; #implict join

#ice7.2
SELECT f.fname FROM faculty f JOIN qualification q ON f.fid=q.fid AND EXTRACT(YEAR FROM q.date_qualified)="1995"; #explicit join
SELECT f.fname FROM faculty f, qualification q WHERE f.fid=q.fid AND EXTRACT(YEAR FROM q.date_qualified)="1995"; #implicit join