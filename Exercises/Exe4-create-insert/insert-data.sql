#inserting data
insert into student values
(38214, 'Ama'),
(54907, 'Bob'),
(66324, 'Clark'),
(70542, 'Dave'),
(15789, 'Eme');

insert into course values
('ISM 3113', 'Syst Analysis'),
('ISM 3112', 'Syst Design'),
('ISM 4212', 'Database'),
('ISM 4930', 'Networking'),
("ISM 5555", "Course 5"),
("ISM 6666", "Course 6");

insert into registration values
(38214, 'ISM 4212', 'I-2001', 74.8),
(54907, 'ISM 4212', 'I-2001', 91.4),
(54907, 'ISM 4930', 'I-2001', 67.2),
(54907, 'ISM 3112', 'I-2001', 61.6),
(54907, 'ISM 3113', 'I-2001', 93.0),
(66324, 'ISM 3113', 'I-2002', 76.0),
(66324, 'ISM 3112', 'I-2001', 69.9),
(70542, 'ISM 3112', 'I-2001', 73.4),
(70542, 'ISM 4212', 'I-2002', 75.9);

insert into faculty values
(2143, 'Ama'),
(3467, 'Berry'),
(4756, 'Coke'),
(5123, 'Dave'),
(1789, 'Ester');

insert into qualification values
(2143, 'ISM 3112', '1988-09-01'),
(2143, 'ISM 3113', '1988-05-01'),
(2143, 'ISM 4212', '1995-01-01'),
(2143, 'ISM 4930', '2000-11-25'),
(3467, 'ISM 4212', '1995-06-01'),
(3467, 'ISM 4930', '1996-09-01'),
(4756, 'ISM 3113', '1991-09-01'),
(4756, 'ISM 3112', '1991-07-01'),
(5123, 'ISM 3112', '1992-06-01');

insert into room values
(1, 'meeting room', 6),
(2, 'class room', 20),
(3, 'class room', 20),
(4, 'meeting room', 3),
(5, 'class room', 40),
(6, 'seminar room', 50),
(7, 'seminar room', 70),
(8, 'meeting room', 3),
(9, 'study room', 2);

insert into assessment values
(1, 'Midterm Exam', 0.3),
(2, 'Final Exam', 0.4),
(3, 'Project', 0.3);

insert into performance values
(38214, 'ISM 4212', 1, 64),
(38214, 'ISM 4212', 2, 79),
(38214, 'ISM 4212', 3, 80),
(54907, 'ISM 4212', 1, 92),
(54907, 'ISM 4212', 2, 89),
(54907, 'ISM 4212', 3, 94),
(54907, 'ISM 4930', 1, 60),
(54907, 'ISM 4930', 2, 72),
(54907, 'ISM 4930', 3, 68),
(54907, 'ISM 3112', 1, 54),
(54907, 'ISM 3112', 2, 61),
(54907, 'ISM 3112', 3, 70),
(54907, 'ISM 3113', 1, 88),
(54907, 'ISM 3113', 2, 93),
(54907, 'ISM 3113', 3, 98),
(66324, 'ISM 3113', 1, 78),
(66324, 'ISM 3113', 2, 82),
(66324, 'ISM 3113', 3, 66),
(66324, 'ISM 3112', 1, 67),
(66324, 'ISM 3112', 2, 72),
(66324, 'ISM 3112', 3, 70),
(70542, 'ISM 3112', 1, 68),
(70542, 'ISM 3112', 2, 77),
(70542, 'ISM 3112', 3, 74),
(70542, 'ISM 4212', 1, 84),
(70542, 'ISM 4212', 2, 78),
(70542, 'ISM 4212', 3, 65);
