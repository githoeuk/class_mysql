-- 샘플 DB 구성

-- drop database library;

create database if not exists library;
use library;

-- 도서관 시스템의 DB를 구축

-- 학생 테이블 
create table student(
	id int primary key auto_increment,
    name varchar(20) not null
);

-- 도서 테이블 
create table book(
	id int primary key auto_increment,
    title varchar(50) not null
);

-- 대여 테이블
create table borrow(
	id int primary key auto_increment,
    student_id int not null,
    book_id int not null,
    
    foreign key (student_id) references student(id),
    foreign key (book_id) references book(id)
);

-- 리뷰테이블
create table review(
	id int primary key auto_increment,
    student_id int not null,
    book_id int not null,
    star int not null,
    
    foreign key(student_id) references student(id),
    foreign key(book_id) references book(id)
);


INSERT INTO student (name) VALUES 
('김철수'), ('이영희'), ('박민준'), ('최지아'), ('한수연');

INSERT INTO book (title) VALUES 
('자바 기초'), ('SQL 완전정복'), ('파이썬 입문');

INSERT INTO borrow (student_id, book_id) VALUES
(1, 1), (1, 2),   
(2, 1), (2, 3),   
(3, 2), (4, 1),           
(5, 3);           

INSERT INTO review (student_id, book_id, star) VALUES
(1, 1, 5), (1, 2, 4), (2, 1, 4), (3, 2, 3), (4, 1, 5);