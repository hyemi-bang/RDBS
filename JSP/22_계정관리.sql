--22_계정관리.sql// 관리자계정에서 클래스 만들어야한다.

-- 현재 접속한 계정 보기
SHOW user;

-- 계정관리는 hr에서 하지 못하고 관리자 계정에서만 할 수 있다.

-- 새계정 생성하기
CREATE USER testuser IDENTIFIED BY"1234";

-- 사용자 계정 데이터 딕셔너리 뷰
SELECT * FROM all_users;
SELECT username, to_char(created, 'MM/DD HH24:MI:SS') FROM all_users;

-- 처음 계정을 만든 후에는 계정에 권한을 부여해야한다
-- 새로 생성한 계정에 권한 주기 -> GRANT 권한 TO 계정
GRANT CREATE SESSION TO testuser; -- 해당계정에 접속할 수 있는 권한을 부여
GRANT CREATE TABLE TO testuser; -- 해당계정에 테이블 생성권한을 부여
GRANT RESOURCE TO testuser; -- 저장공간을 사용할 수 있는 권한 부여

-- 계정의 권한을 뺏기 / 권한 제한하기 => REVOKE 권한 FROM 계정
REVOKE RESOURCE FROM testuser;

-- 비밀번호 변경하기
ALTER USER testuser IDENTIFIED BY "4321";
ALTER USER testuser IDENTIFIED BY "1234";

-- 계정삭제하기
DROP USER testuser;




