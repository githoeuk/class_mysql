-- 인덱스 실습

use shop;

-- 문제 1. product, orders, member 테이블 현재 인덱스를 확인해보기 
show index from product;
show index from orders;
show index from member;

desc member;

-- 문제 2, member 테이블에 grade 컬럼에 인덱스 추가(VIP 회원 조회 시 자주 사용)
alter table member add index idx_grade(grade);
-- 문제 3. orders 테이블에 status 인덱스 추가 ( 주문 상태별 조회 시 자주 사용)
alter table orders add index idx_status(status);
-- 문제 4. member 테이블에 grade에 걸린 인덱스 삭제 
drop index idx_grade on member;