use school;

select * from enrollment;
select * from student;
select * from subject;


-- 문제 1
SELECT
    s.name          AS 학생이름,
    su.subject_name AS 과목명,
    e.score         AS 점수
FROM enrollment e
inner JOIN student s  ON e.student_id = s.student_id
inner JOIN subject su ON e.subject_id = su.subject_id;

-- 문제 2.
SELECT
    s.name          AS 학생이름,
    su.subject_name AS 과목명,
    e.score         AS 점수
FROM student.s
left JOIN enrollment e  ON s.student_id = e.student_id
left JOIN subject su    ON s.subject_id = su.subject_id;


use shop;
-- 문제 3.

select * from orders;
select * from member;

SELECT
    m.name        AS 회원명,
    o.id          AS 주문번호,
    o.total_price AS 주문금액,
    o.status      AS 주문상태
FROM orders o
inner JOIN member m ON o.member_id = m.id;

-- 문제 4
SELECT
    m.name        AS 회원명,
    o.id          AS 주문번호,
    o.total_price AS 주문금액,
    o.status      AS 주문상태
FROM member m
LEFT JOIN orders o ON m.id = o.member_id;

-- 문제 5
select * from order_item;
select * from orders;
select * from member;

SELECT
    o.id        AS 주문번호,
    o.status	AS 주문상태,
    m.name      AS 회원명,
    p.name      AS 상품명,
    oi.quantity AS 수량,
    oi.price    AS 상품가격
FROM order_item oi
INNER JOIN orders o ON oi.order_id = o.id
INNER JOIN member m ON oi.id = m.id
INNER JOIN product p ON oi.product_id = p.category_id;
