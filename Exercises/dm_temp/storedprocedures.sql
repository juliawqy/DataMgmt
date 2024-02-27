USE dm_temp;

CREATE PROCEDURE GetAllStudents()
	SELECT * from student;
CALL GetAllStudents();

CREATE PROCEDURE GetStudentsByCourse (IN courseid CHAR(8))
	SELECT * FROM registration WHERE cid=courseid;
CALL GetStudentsByCourse("ISM 4212");

CREATE PROCEDURE GetCountOfFac(IN courseid CHAR(8), OUT total INT) #OUT is like the output setting for the procedure, total is a local variable
#counted as 2 parameters, IN parameter (where to look) and OUT parameter (variable to store)
	SELECT COUNT(*) INTO total FROM qualification WHERE cid=courseid; #total is the return variable (basically an intermediate variable to store final output
CALL GetCountOfFac("ISM 3112", @total); #@total stores the value in the variable total to use after this line, doesn't need to be the same as prev local variable (ie can be @help)
SELECT @total;

SELECT * FROM qualification  

DELIMITER $$
CREATE PROCEDURE GetSumCourse (IN courseid CHAR(8), OUT total INT)
	BEGIN
		DECLARE facultycount INT;
        DECLARE studentcount INT;
        SELECT COUNT(*) INTO facultycount FROM qualification WHERE cid=courseid;
        SELECT COUNT(*) INTO studentcount FROM registration WHERE cid=courseid;
        SET total = facultycount + studentcount;
	END$$
DELIMITER ;
CALL GetSumCourse("ISM 3112", @total);
SELECT @total;

DELIMITER $$
CREATE TRIGGER before_registration_insert
	BEFORE INSERT ON registration FOR EACH ROW
    BEGIN
		DECLARE course_count INT;
        SET course_count = (SELECT COUNT(*) FROM registration WHERE sid=NEW.sid AND semester=NEW.semester);
        IF course_count=5 THEN
			signal sqlstate '45000' set message_text = "Trigger Error: Insertion fail, student has already registered for 5 courses in the semester";
		END IF;
	END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER before_performance_insert
	BEFORE INSERT ON performance FOR EACH ROW
    BEGIN
		DECLARE currentTotalWt DOUBLE;
        DECLARE newWt DOUBLE;
        DECLARE newTotalWt DOUBLE;
        DECLARE msgTxt VARCHAR(256);
        SET currentTotalWt = (SELECT SUM(weight) FROM performance p #check current total course assessment weightage of student
			INNER JOIN assessment a ON p.aid = a.aid AND p.sid = NEW.sid AND cid = NEW.cid);
		SET newWt = (SELECT weight FROM assessment WHERE aid=NEW.aid); #check weightage of new assgn
        SET newTotalWt = newWt + currentTotalWt;
        IF (newTotalWt) > 1 THEN
			SET msgTxt = CONCAT("Trigger Error: Invalid insertion, weightage would exceed 100% with the insertion. New Value:",
								newTotalWt);
			SIGNAL SQLSTATE "45000" SET message_text = msgTxt;
		END IF;
	END $$
DELIMITER ;
SELECT * FROM assessment;
INSERT INTO assessment VALUES (4, "Quiz 1", 0.15);
	
CREATE TRIGGER after_performance_update
	AFTER UPDATE ON performance FOR EACH ROW
    INSERT INTO performance_log VALUES (OLD.sid, OLD.cid, OLD.aid, OLD.mark, CURRENT_TIMESTAMP);
