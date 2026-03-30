CREATE DATABASE IF NOT EXISTS practice_db;
USE practice_db;

CREATE TABLE employee (
    emp_id     INT           PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(50)   NOT NULL,
    dept       VARCHAR(30)   NOT NULL,
    salary     DECIMAL(10,2) NOT NULL,
    position   VARCHAR(20)   NOT NULL,
    hired_date DATE          NOT NULL,
    is_active  BOOLEAN       DEFAULT TRUE
);

INSERT INTO employee (name, dept, salary, position, hired_date, is_active) VALUES
('김민준', '개발팀',    4500000, '시니어',   '2019-03-15', TRUE),
('이서연', '디자인팀',  3200000, '주니어',   '2022-07-01', TRUE),
('박준혁', '개발팀',    3800000, '미드레벨', '2020-11-20', TRUE),
('최수아', '마케팅팀',  2900000, '주니어',   '2023-01-10', FALSE),
('정도현', '개발팀',    5200000, '시니어',   '2018-06-01', TRUE),
('한지우', '디자인팀',  3500000, '미드레벨', '2021-04-05', TRUE),
('오채원', '마케팅팀',  3100000, '미드레벨', '2021-09-15', TRUE),
('임서준', '개발팀',    2800000, '주니어',   '2023-08-20', FALSE);

-- 1
select * from employee where dept = '개발팀';
-- 2
select name,dept,salary from employee where salary < 35000000;
-- 3
select name, position , salary from employee where position in('시니어','미드레벨');
-- 4 
select * from employee where is_active = TRUE and salary between 3000000 and 4500000;
-- 5 
select name,dept from employee where name like '김%' or '%팀';