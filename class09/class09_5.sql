CREATE DATABASE IF NOT EXISTS lib_db;
use lib_db;

-- 도서 테이블
create table book(

book_id int primary key auto_increment,
title varchar(100) not null,
author_id int not null,
price decimal(10,2) not null,
isbn varchar(20) unique

); 

-- 회원 테이블 
create table user(

user_id int primary key auto_increment,
name varchar(20) not null,
phone varchar(20) not null

);

-- 대출 테이블 
create table loan(
 
user_id int not null,
name varchar(20) not null,
day datetime default current_timestamp,
phone varchar(20),
isbn varchar(20) not null,
book_id int not null,


foreign key(user_id) references user(user_id),
foreign key(name) references user(name),
foreign key(phone) references user(phone),
foreign key(isbn) references book(isbn),
foreign key(book_id) references book(book_id)

);

select * from loan;
