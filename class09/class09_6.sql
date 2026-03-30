create database studycafe_db;
use studycafe_db;

-- 유저, seat, 예약 목록 ,  payment , review , 
create table user(
	user_id BIgint primary key auto_increment,
	name varchar(50) not null,
	phone varchar(20) not null unique,
	birth date not null
);

insert into user(name,phone,birth) values('홍길동','010-1234-1234','1999-09-19');

-- seat 
create table seat(
    seat_id int primary key auto_increment,
    type enum('notebool','book') not null,
    is_used bool not null default false 
);

insert into seat(type,is_used) values
('book',TRUE);

-- reseverbation
create table rsvd(
	
    id int primary key auto_increment,
    user_id bigint not null,
    seat_id int not null,
	start_at datetime default current_timestamp,
    end_at datetime not null,
    
    foreign key(user_id) references user(user_id),
    foreign key(seat_id) references seat(id)
);

select * from rsvd;

insert into rsvd(user_id,seat_id,end_at) values
(1,1,'2026-04-03');

--  review
create table review(
	id int primary key auto_increment,
	user_id bigint not null,
	title text not null,
	content text not null,
	create_at datetime default current_timestamp,

	foreign key (user_id) references user(user_id)
);
insert into review(user_id,title,content) values
(1,'good','good');
-- payment
create table payment(
	id int primary key auto_increment,
	user_id bigint not null,
	start_at datetime default current_timestamp,
	end_at datetime not null,
    paid_time datetime default current_timestamp,
	pay_type enum('cash','card','transfer'),
    pay_price decimal(10,2) not null,
    
	foreign key (user_id) references user(user_id)
	
);
insert into payment(user_id,end_at,pay_type,pay_price) values
(1,'2026-04-02','card',13000);

drop table payment;
select * from review;