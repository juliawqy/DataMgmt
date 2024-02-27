CREATE SCHEMA ice6_1;
USE ice6_1;
CREATE TABLE faculty
	(FID int not null,
    FName varchar(10),
    CONSTRAINT performance_pk PRIMARY KEY (FID));
CREATE TABLE course
	(CID varchar(8) not null,
    CName varchar(30),
    CONSTRAINT performance_pk PRIMARY KEY (CID));
CREATE TABLE qualification
	(FID int not null,
    CID varchar(8) not null,
    Date_Qualified date,
    CONSTRAINT performance_pk PRIMARY KEY (FID, CID),
    CONSTRAINT performance_fk1 FOREIGN KEY (FID) REFERENCES faculty(FID),
    CONSTRAINT performance_fk2 FOREIGN KEY (CID) REFERENCES course(CID));
INSERT INTO faculty VALUES
	(2143, 'Ama'),
    (3467, 'Berry'),
    (4756, 'Coke'),
    (5123, 'Dave'),
    (1789, 'Ester');
INSERT INTO course VALUES
	('ISM 3113', 'Syst Analysis'),
    ('ISM 3112', 'Syst Design'),
    ('ISM 4212', 'Database'),
    ('ISM 4930', 'Networking');
INSERT INTO qualification VALUES
	(2143, 'ISM 3112', '1988-09-01'),
    (2143, 'ISM 3113', '1988-05-01'),
    (2143, 'ISM 4212', '1995-01-01');
SELECT * FROM faculty;
SELECT * FROM course;
SELECT * FROM qualification;