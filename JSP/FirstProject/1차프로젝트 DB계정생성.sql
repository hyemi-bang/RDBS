-----------------------관리자계정에서 순서대로 실행------------------------------------------------------

CREATE USER firstProject IDENTIFIED BY "1111";

GRANT CREATE SESSION TO firstProject; -- 해당 계정에 접속할 수 있는 권한을 부여
GRANT CREATE TABLE TO firstProject; -- 해당 계정에 테이블 생성 권한을 부여
GRANT RESOURCE TO firstProject;
------------------------------------------------------------------------------------------------------

-- 위의 작업 후 1차프로젝트 계정에서 아래 실행 (주석으로 막은 부분 제외 순서대로)
------------- member테이블 ---------

-- 테이블 생성--
CREATE TABLE member (
m_no NUMBER(5), 
m_id varchar2(100)
constraint m_id_pk Primary Key,
m_pwd varchar2(100) 
constraint m_pwd_nn NOT NULL,
m_name varchar2(100) NOT NULL,
m_phoneNum varchar2(100)
constraint m_phoneNum_nn NOT NULL,
m_email varchar2(100)
constraint m_email_nn NOT NULL, 
m_reservation_no varchar2(100),
m_memberOrNot varchar2(10)
);

CREATE SEQUENCE m_no_seq START WITH 1 INCREMENT BY 1 NOCACHE; -- 시퀀스 생성
-- drop table member;  (시퀀스 포함 테이블 완전삭제)


-- 테이블에 값 넣는 예시 
INSERT INTO member (m_no, m_id, m_pwd,m_name,m_phoneNum,m_email,m_reservation_no,m_memberOrNot) 
values(m_no_seq.nextval, 
'xogud', 
'1234', 
'김태형',
'010-5767-4637',
'xogud021@nate.com',
'R123kdflsa',
'O');
select * from member;
-- truncate table member -- 멤버테이블 내의 데이터 삭제 (시퀀스는 유지)
-- drop sequence m_no_seq; 시퀀스 삭제
