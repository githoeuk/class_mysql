use school;

-- 테이블 끝에 pk선언이 가능하다.
-- 하지만 보통 복합키를 등록할 때 많이 사용한다.

create table tb_Student2(
	student_id int auto_increment,
    name varchar(50) not null,
    primary key(student_id)
);

select * from tb_student2;

-- 수강 테이블에 복합키 적용 
create table tb_enrollment2(

    student_id int,
    subject_id int,
    reg_date DATE,
	primary key(Student_id, subject_id) -- <- 복합키
);

desc tb_enrollment2;


use shop;

-- 정상데이터 입력
select * from member;
insert into member(email,name) values ('hong@gmail.com','홍길동');
insert into member(email,name) values ('kim@gmail.com','김영희');

-- unique 위반 : 이미 있는 이메일 입력 시 발생 
insert into member(email,name) values ('hong@gmail.com','이순신');
-- 오류 발생 : Duplicate entry '...'  for key 'email'

-- 상품 테이블에 insert를 할려면 먼저 카테고리 테이블에 값이 있어야 한다.
-- 1. category 데이터 생성 
insert into category(name) values('전자제품'),('의류'),('식품');
desc category;

select * from category;

desc product;
insert into product(category_id,name,price,stock) values
(1,'삼성 갤럭시 S26',12000000.00,50),
(1,'애플 아이폰 16',15000000.00,50),
(2,'나이키 티셔츠',59000.00,50),
(1,'삼성 노트북',22000000.00,50);

select * from product;

-- FK 위반 
insert into product(category_id,name,price,stock) values
(999,'비트코인',90000000.00,1);
