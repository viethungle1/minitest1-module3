create database minitest1;
use minitest1;
-- Bảng Classes (id, name, language, description)
create table class(
id int primary key auto_increment,
name varchar(50),
language varchar(50),
description varchar(250));
insert into class(id,name,language,description) values(1,"C1","Java","1");
insert into class(name,language,description) values("C2","Python","2");
insert into class(name,language,description) values("C3","NodeJS","3");
insert into class(name,language,description) values("C4","C++","4");
insert into class(name,language,description) values("C5","PHP","5");
select * from class;
drop table class;
-- Bảng Students (id, fullname, address_id, age, phone (unique), classes_id)
create table student(
id int primary key auto_increment,
fullname varchar(50),
address_id int,
age int,
phone varchar(10) unique,
class_id int);
alter table student add constraint classID foreign key(class_id) references class(id);
insert into student(id,fullname,address_id,age,phone,class_id) values (1,"phan quyet thang",2,25,"0123456789",1);
insert into student(fullname,address_id,age,phone,class_id) values ("duong minh hieu",3,16,"0123456788",1);
insert into student(fullname,address_id,age,phone,class_id) values ("do an nhu",4,17,"0123456787",5);
insert into student(fullname,address_id,age,phone,class_id) values ("le viet hung",1,28,"0123456786",2);
insert into student(fullname,address_id,age,phone,class_id) values ("trinh luu khoa",1,22,"0123456785",2);
insert into student(fullname,address_id,age,phone,class_id) values ("nguyen dinh thong",1,30,"0123456784",2);
insert into student(fullname,address_id,age,phone,class_id) values ("nguyen thanh hai",1,28,"0123456783",3);
insert into student(fullname,address_id,age,phone,class_id) values ("nguyen tuan anh",3,30,"0123456782",3);
insert into student(fullname,address_id,age,phone,class_id) values ("tran minh loc",5,30,"0123456781",3);
insert into student(fullname,address_id,age,phone,class_id) values ("vu anh duy",5,28,"0123456780",4);
select * from student;
-- Bảng Course (id, name, description)
create table course(
id int auto_increment primary key,
name varchar(50),
description varchar(250));
insert into course values(1, "@1","Full-stack");
insert into course(name, description) values("@2","Full-stack");
insert into course(name, description) values("@3","Full-stack");
insert into course(name, description) values("@4","Full-stack");
insert into course(name, description) values("@5","Full-stack");
select * from course;
-- Bảng Point(id, course_id, student_id, point)
create table point(
id int auto_increment primary key,
course_id int,
student_id int,
point int);
alter table point add constraint courseID foreign key(course_id) references course(id);
alter table point add constraint studentID foreign key(student_id) references student(id);
insert into point values(1,1,5,10);
insert into point (course_id,student_id, point) values(3,8,9);
insert into point (course_id,student_id, point) values(5,10,8);
insert into point (course_id,student_id, point) values(4,7,9);
insert into point (course_id,student_id, point) values(2,6,9);
insert into point (course_id,student_id, point) values(1,5,7);
insert into point (course_id,student_id, point) values(3,8,9);
insert into point (course_id,student_id, point) values(1,9,9);
insert into point (course_id,student_id, point) values(2,10,6);
insert into point (course_id,student_id, point) values(3,1,1);
insert into point (course_id,student_id, point) values(4,2,8);
insert into point (course_id,student_id, point) values(5,3,4);
insert into point (course_id,student_id, point) values(5,4,7);
insert into point (course_id,student_id, point) values(4,5,7);
insert into point (course_id,student_id, point) values(3,6,10);
select * from point;
-- Bảng Address (id, address)
create table address(
id int primary key auto_increment,
address varchar(200));
insert into address value (1,"Ha Noi");
insert into address(address) value ("Thai Nguyen");
insert into address(address) value ("Hai Duong");
insert into address(address) value ("Nam Dinh");
insert into address(address) value ("Hung Yen");

-- -------------BÀI LÀM-------------
select * from student where fullname like "nguyen%";
select * from student where fullname like "%anh";
select * from student where age>15 and age<18;
select * from student where id=2 or id =3;
select a.address as que_quan,count(a.address) as so_luong from (student s join address a on s.address_id = a.id) group by que_quan;
select c.name as ten_lop,count(s.fullname) as so_luong from (student s join class c on s.address_id = c.id) group by ten_lop;
select student.id, student.fullname, avg(point.point) as diem_trung_binh from ((point join student on point.student_id = student.id) join course on point.course_id=course.id) group by student.fullname;


