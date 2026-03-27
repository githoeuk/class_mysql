-- DCL(data control language) - 권한 관리 

-- 사용자 생성 (사람, 시스템에게 줄 수 있다)
CREATE USER 'user1'@'localhost' IDENTIFIED BY 'password123';

-- 조회 권한 부여 
GRANT SELECT ON school.student TO 'user1'@'localhost';

-- 권한 회수 
REVOKE SELECT ON school.student FROM 'user1'@'localhost';

-- 도전 문제 1
-- 외부 사용자가 사용할 계정을 생성하고 조회 권한만 부여 후 접속 확인

CREATE USER 'user2'@'192.168.4.16' IDENTIFIED BY 'password123';
GRANT SELECT ON school.student TO 'user2'@'192.168.4.16';

-- 풀이 
-- 계정 생성 
-- 1. 로컬 접속 계정과 별개로 외부 접속용 계정 모두 만들어 줘야 한다. 필요없다면 포컬은 생성 안해도 됨.
CREATE USER 'tenco'@'localhost' IDENTIFIED BY 'abc123'; -- 로컬 내부용 
CREATE USER 'tenco'@'%' IDENTIFIED BY 'abc123'; -- 모든 ip허용

-- 권한 부여 
-- 2. 권한 부여 selcet , insert .. 추가 가능하다. 모든 권한 부여 (ALL PRIVILEGES)
GRANT ALL PRIVILEGES ON school.*TO 'tenco'@'localhost'; -- *.* RDBMS 안에 모든 DB 모든 테이블 접속 허용 
GRANT ALL PRIVILEGES ON school.*TO 'tenco'@'%'; 

-- 권한 확인 
show grants for 'tenco'@'localhost';
show grants for 'tenco'@'%';

-- 참고 -- 
-- 추가된 권한이 바로 적용이 안될 수 있음 
FLUSH privileges; -- 새로고침 명령어 

-- 권한 회수 
REVOKE ALL PRIVILEGES ON school.*from'tenco'@'localhost';  -- from빨간줄은 오류 
REVOKE ALL PRIVILEGES ON school.*from'tenco'@'%'; 

