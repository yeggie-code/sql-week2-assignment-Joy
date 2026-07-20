create schema greenwood_academy;

create table students(
student_id int primary key,
first_name VARCHAR(50) not null,
last_name varchar(50) not null,
gender varchar(1),
date_of_birth DATE,
class VARCHAR(10),
city VARCHAR(10)
);

create table subjects(
subject_id	INT	PRIMARY key,
subject_name VARCHAR(100) not null unique,
department	VARCHAR(50),
teacher_name	VARCHAR(100),
credits	INT
);

create table exam_results(
result_id	INT	PRIMARY key,
student_id	INT	NOT null,
subject_id	INT	NOT null,
marks	INT	NOT null,
exam_date	DATE,
grade	VARCHAR(2)
);


alter table students 
add phone_number VARCHAR(20);

alter table subjects
rename  credits to credit_hours;

alter table students 
drop phone_number;

insert into students(student_id,first_name,last_name,gender,date_of_birth,class,city
) values 
(1,'Amina','Wanjiku','F','2008-03-12','Form 3','Nairobi'),
(2,'Brian','Ochieng','M','2007-07-25','Form 4','Mombasa'),
(3, 'Cynthia','Mutua', 'F','2008-11-05', 'Form 3', 'Kisumu'),
(4, 'David','Kamau','M','2007-02-18', 'Form 4', 'Nairobi'),
(5, 'Esther', 'Akinyi', 'F', '2009-06-30', 'Form 2', 'Nakuru'),
(6, 'Felix','Otieno','M', '2009-09-14','Form 2', 'Eldoret');
(7,'Grace','Mwangi','F','2008-01-22','Form 3','Nairobi'),
(8,'Hassan','Abdi','M','2007-04-09','Form 4', 'Mombasa'),
(9,'Ivy', 'Chebet', 'F', '2009-12-01','Form 2','Nakuru'),
(10, 'James', 'Kariuki', 'M', '2008-08-17', 'Form 3', 'Nairobi');

select * from students;

insert into subjects(subject_id,subject_name,department,teacher_name,credit_hours)values 
(1, 'Mathematics', 'Sciences', 'Mr. Njoroge', 4),
(2, 'English', 'Languages', 'Ms. Adhiambo',	3),
(3,	'Biology', 'Sciences', 'Ms. Otieno', 4),
(4,	'History', 'Humanities', 'Mr. Waweru', 3),
(5, 'Kiswahili', 'Languages', 'Ms. Nduta', 3),
(6,	'Physics', 'Sciences', 'Mr. Kamande', 4),
(7,	'Geography', 'Humanities', 'Ms. Chebet', 3),
(8,	'Chemistry', 'Sciences', 'Ms. Muthoni',	4),
(9,	'Computer Studies',	'Sciences',	'Mr. Oduya', 3),
(10, 'Business Studies', 'Humanities', 'Ms. Wangari', 3);

select * from subjects;

insert into exam_results(result_id,student_id,subject_id,marks,exam_date,grade)
values 
(1, 1, 1,	78,	'2024-03-15', 'B'),
(2, 1,	2,	85,	'2024-03-16', 'A'),
(3,	2,	1,	92, '2024-03-15', 'A'),
(4,	2,	3,	55,	'2024-03-17', 'C'),
(5,	3,	2,	49,	'2024-03-16', 'D'),
(6,	3,	4,	71,	'2024-03-18', 'B'),
(7,	4,	1,	88,	'2024-03-15', 'A'),
(8,	4,	6,	63,	'2024-03-19', 'C'),
(9,	5,	5,	39,	'2024-03-20', 'F'),
(10, 6,	9,	95,	'2024-03-21', 'A');

select * from exam_results;

update students 
set city = 'Nairobi' 
where student_id = 5;

update exam_results
set marks = 59
where student_id = 5;


delete from exam_results
where result_id = 9;

--query to find all students who are in Form 4

select * from students 
where class = 'Form 4';

--query to find all subjects in the Sciences department

select * from subjects
where department = 'Sciences';

-- query to find all exam results where the marks are greater than or equal to 70

select  * from exam_results
where marks > 70 or marks = 70;

--query to find all female students only
select * from students 
where gender = 'F';

--query to find all students who are in Form 3 AND from Nairobi
select * from students
where class = 'Form 3' and city = 'Nairobi';


--query to find all students who are in Form 2 OR Form 4
select * from students 
where class = 'Form 2' or class = 'Form 4';


--query to find all exam results where marks are between 50 and 80 (inclusive)
select * from exam_results 
where marks between 50 and 80;


--query to find all exams that took place between 15th March 2024 and 18th March 2024.
select * from exam_results 
where exam_date between '2024-03-15' and '2024-03-18';


--query to find all students who live in Nairobi, Mombasa, or Kisumu 
select * from students
where city in ('Nairobi','Mombasa','Kisumu');

--query to find all students who are NOT in Form 2 or Form 3 
select * from students
where class not in ('Form 2','Form 3');


--query to find all students whose first name starts with the letter 'A' or 'E' 
select * from students
where first_name like 'A%' or first_name like 'E%';


--Write a query to find all subjects whose subject name contains the word 'Studies'
select * from subjects
where subject_name like '%Studies%';

--How many students are currently in Form 3? 
select count(*) from students
where class = 'Form 3';


--How many exam results have a mark of 70 or above? 
select count(*) from exam_results
where marks = 70 or marks > 70;

/*label each exam result with a grade description:
•	'Distinction' if marks >= 80
•	'Merit' if marks >= 60
•	'Pass' if marks >= 40
•	'Fail' if marks below 40
*/

select marks,
	case
		when marks >= 80 then 'Distinction'
		when marks >= 60 then 'Merit'
		when marks >= 40 then 'Pass'
		when marks <40 then 'Fail'
	end as performance
from exam_results;


/*to label each student as:
•	'Senior' if they are in Form 3 or Form 4
•	'Junior' if they are in Form 2 or Form 1
*/

select first_name,last_name,class,
	case 
		when class = 'Form 3' or class = 'Form 4' then 'Senior'
		when class = 'Form 2' or class = 'Form 1'  then 'Junior'
	end as student_level
from students;
	
	