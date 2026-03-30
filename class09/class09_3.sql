use shop;
show tables;

-- member 회원 가입 
-- orders 테이블 1번 회원이 주문한 목록 데이터가 있다고 가정 
-- 두테이블이 fk 관계일 때 member 테이블에 접근해서 1번 회원을 삭제할 수 있는가?

select * from member;

select * from orders;

insert into orders(member_id, total_price) values (1,10000);

-- fk위반 이유 : orders 테이블에 member_id인 1번 데이터가 존재하기 때문이다.
-- member 테이블에 1번 회원을 삭제하면 orders 테이블에 member_id 1은 무의미한 데이터가 되기 때문에 막혀있음.
delete from member where id = 1;
-- 2번은 삭제가 되는가?
delete from member where id = 2;

-- 결론 orders 테이블에 존재하는 member_id 의 값 1을 먼저 삭제하고 
-- member 테이블에 pk인 1번 회원을 삭제할 수 있다.

-- orders의 member_id 삭제 
delete from orders where member_id = 1;  

-- if - member의 id가 oders 테이블 포함 다른 테이블에도 연관되어 있다면 연관되어 있는
-- 데이터를 전부 삭제해야한다.

-- 이러한 반복 작업을 방지하기 위해서 사용하는 기법이 
-- ON DELETE CASCADE-연쇄 삭제,ON UPDATE CASCADE-(연쇄 수정)이다.

-- 현재 oreders 테이블에 걸린 정확한 fk 이름을 확인하고자 합니다 ( 명령문, GUI 확인)
show create table orders;

-- 기존에 제약 조건을 삭제합니다. 
-- [단계 1] 기존의 제약 조건을 삭제합니다.
-- (보통 자동 생성된 이름은 orders_ibfk_1 같은 형태입니다) 
alter table orders drop foreign key orders_ibfk_1;

-- [단계 2] cascade 옵션을 추가하여 제약 조건을 추후 새로 정의할 수 있다
-- 기존에는 테이블 생성시 키 제약을 추가했다면 테이블 생성 후에도 키를 변경 수정 삭제 가능
alter table orders add constraint fk_orders_member 
foreign key (member_id) references member(id)
on delete cascade -- 부모 삭제 시 자식도 삭제 됨 
on update cascade; -- 부모 pk 수정 시 fk키도 값이 수정된다.
show create table member;


-- 테스트 
select * from member;
select * from orders;


insert into member(email, name) values ('hong@test.com', '홍길동');
insert into member(email, name) values ('kim@test.com', '김영희');

insert into orders(member_id, total_price) values (4, 10000);

-- 연쇄 수정 확인 
update member set id = 99 where id = 4;

-- 연쇄 삭제 확인 
delete from member where id = 99;