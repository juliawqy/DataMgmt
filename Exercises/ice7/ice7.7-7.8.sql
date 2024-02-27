USE common;

#ice7.7
SELECT f.fid, f.fname, COUNT(q.cid) AS CoursesCanTeach
	FROM faculty f LEFT JOIN qualification q
    ON f.fid=q.fid
    GROUP BY f.fid;
    
#ice7.8
SELECT s.sid, s.sname, COUNT(r.cid) AS CoursesTaken
	FROM student s LEFT JOIN registration r
    ON s.sid=r.sid AND r.semester="I-2002"
    GROUP BY s.sid;
SELECT s.sid, s.sname, COUNT(r.cid) AS CoursesTaken
	FROM student s, registration r
    WHERE s.sid=r.sid AND r.semester="I-2002"
    GROUP BY s.sid; #using implicit join will not return a null, hence will not have count 0 so need use explicit join