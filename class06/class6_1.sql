-- not null 반드시 값을 입력해야 한다 .

create database shop2;
use shop2;

CREATE TABLE member (
    id    INT         PRIMARY KEY,
    email VARCHAR(100) NOT NULL,  -- NULL 불가, 반드시 입력
    name  VARCHAR(50)  NOT NULL,  -- NULL 불가
    phone VARCHAR(20)              -- NULL 허용 (선택 입력)
); 

-- NOT NULL 컬럼에 값을 넣지 않으면 오류
INSERT INTO member (id, name) VALUES (1, '김철수');
-- → 오류: email 은 NOT NULL 이라 반드시 값이 있어야 함

-- 올바른 입력
INSERT INTO member (id, email, name)
VALUES (1, 'kim@test.com', '김철수');

select * from member;

-- --------------------------------------
-- default 값을 입력하지 않으면 자동으로 기본값이 들어감 
drop table member;


CREATE TABLE member (
    id       INT         PRIMARY KEY AUTO_INCREMENT,
    email    VARCHAR(100) NOT NULL,
    name     VARCHAR(50)  NOT NULL,
    grade    VARCHAR(10)  DEFAULT '일반',  -- 기본값 '일반'
    is_active BOOLEAN     DEFAULT TRUE,   -- 기본값 TRUE
    created_at DATETIME   DEFAULT CURRENT_TIMESTAMP -- 현재 시간 자동 입력
);

-- grade, is_active, created_at 생략 → 기본값 자동 적용
INSERT INTO member (email, name)
VALUES ('kim@test.com', '김철수');

SELECT * FROM member;
-- grade='일반', is_active=1, created_at=현재시간 으로 저장됨

-- -------------------------------

drop table member;

-- id 를 직접 넣지 않아도 자동으로 1, 2, 3... 증가
INSERT INTO member (email, name) VALUES
('hong@test.com',  '홍길동'),
('lee@test.com',  '이영희'),
('park@test.com', '박민준');

SELECT * FROM member;
-- id: 1, 2, 3 자동 부여

delete from member; -- 전부 삭제 후 다시 입력 -> AUTO_INCREMENT 처음부터 다시 적용 X 

-- -------------------------------------------

-- 방법 1: 문자열 형식 (권장)
INSERT INTO enrollment (enrollment_id, student_id, subject_id, score, enrolled_at)
VALUES (1, 1001, 101, 88.5, '2024-03-02');

-- 방법 2: 구분자 없는 문자열 형식
VALUES (2, 1001, 102, 92.0, '20240302');

-- 잘못된 날짜 → 오류 발생
VALUES (3, 1001, 103, 90.0, '20241325'); -- 13월은 없음 → 오류!
