create database ice6_0;
use ice6_0;
create table test_major 
	(Major varchar(3) not null, 
	Description varchar(30) not null,
	constraint performance_pk primary key (Major, Description));
create table test_student
	(StudentID int not null,
	Name varchar(30),
	Major varchar(10),
	Nationality varchar(30),
	constraint performance_pk primary key (StudentID),
	constraint performance_fk1 foreign key (Major) references test_major(Major));
insert into test_major values 
	('Bus', 'Business'), 
	('IS', 'Information Systems'), 
	('Acc', 'Accountancy'), 
	('SE', 'Software Engineering');
insert into test_student values 
	(001, 'Jack', 'Bus', 'Singaporean'), 
	(002, 'Michael', 'IS', 'Indian'), 
	(003, 'Emily', 'Acc', 'Singaporean'),
	(004, 'Andy', 'IS', 'Singaporean'), 
	(005, 'Mary', 'Bus', 'Indian');
select * from test_major;
select * from test_student;