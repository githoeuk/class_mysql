use shop;
-- 관계 차수

desc member;
desc member_address;

-- 1 대 1 관계

create table member_address(
	id int primary key auto_increment,
    address varchar(200) not null,
    member_id bigint unique, -- unique = 1 대 1 설정
	foreign key (member_id) references member(id)
    );
    
    insert into member_address (Address, member_id) values
    ('서울시 강남구 역삼동' , 1),
    ('부산시 해운대구',2);

select * from member_address;

-- 1 대 n 관계 
	