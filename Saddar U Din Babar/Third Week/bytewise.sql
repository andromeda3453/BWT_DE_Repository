-- Task #3

show databases;



use bytewise;



create table employee 
(empNo int,empName varchar(30),
phone varchar(11),
address varchar(30));




insert into employee values

(1,'ABC','03480','Dadu'),

(2,'XYZ','03126','Jamshoro'),

(3,'DEF','0336','Hyderabad');



create table course 
(rollNo int,courseName varchar(10),
courseId int);



insert into course values


(77,'Maths',58),

(78,'Python',73),

(87,'DSA',34);




select s.name,ug.age from student s 
inner join ugstd ug on s.rollNo=ug.rollNo;





SELECT s.name, s.age,c.courseName
FROM student s 

LEFT OUTER JOIN course c ON s.rollNo = c.rollNo;



SELECT s.name, s.age,c.courseName,c.courseId


FROM student s

LEFT JOIN course c

ON s.rollNO = c.rollNO;





SELECT s.name, s.age,c.courseName,c.courseId

FROM student s

Right JOIN course c

ON s.rollNO = c.rollNO;




alter table course add column serialNo int first,
add column courseCode int after courseName;




insert into course (serialNo,courseCode) values

(1,1),(2,2),(3,3);




truncate table course;



insert into course values

(1,77,'Python',1,73),

(2,78,'DSA',2,58),

(3,87,'Maths',3,34);





SELECT c1.courseName AS "Course", c2.rollNo AS "assigned to"
FROM course c1

JOIN course c2 ON c1.serialNo = c2.courseCode;



 


select * from course cross join ugstd;
 
 


select * from masterstd left join ugstd 
 on masterstd.roll=ugstd.rollNO
 where ugstd.name="Azhar";




SELECT masterstd.*
FROM masterstd
RIGHT JOIN ugstd ON ugstd.rollNo = masterstd.roll
WHERE masterstd.roll IS NULL;


-- Task #4

select s.*,c.* from student s 
inner join course c on s.rollNo=c.rollNo;

SELECT student.*
FROM student
RIGHT JOIN course ON student.rollNo = course.rollNo
WHERE student.rollNo!=any (select rollNo from course group by rollNo);

select * from student;



-- 29 March 2023
-- task #5
-- • Single Row Sub Queries 

select * from student where rollNo=
(select rollNo from course where courseName = 'DSA' );

-- Multi Row Sub Queries
 select * from student where rollNo = any
 (select rollNo from course group By rollNo desc);
 
 -- nested sub queries
 select * from student where rollNo = any 
 ( select rollNo from course where serialNo=any
 (select empNo from employee group by empNo));
 
 -- corelated subqueries
 
 select * from student where rollNo IN 
 (
   select rollNo from course where courseId>70
 );
--  select * from student where rollNo;
--  select * from student;
--  select * from employee;
-- select * from course;

