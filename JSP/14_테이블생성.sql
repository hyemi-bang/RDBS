--14_테이블 생성.sql

/*
     #CRUD
     - 대부분의 프로그램들이 가지고 있는 기본적인 기능
     - Create / 데이터 생성
     - Read / 데이터 읽기
     - Update / 데이터 수정
     - Delete / 데이터 삭제
     
     # DB의 종류
     
     1> DML (Data Manipulate Language, 데이터조작어)
     - 테이블의 데이터를 조작하는 명령어들
     - INSERT : 테이블에 데이터 추가하기 (Create)
     - SELECT : 테이블의 데이터 읽기 (Read)
     - UPDATE : 테이블의 데이터 수정하기 (Update)
     - DELETE : 테이블의 데이터 삭제하기 (Delete)
     
     2> DDL (Data Definition Language, 데이터 정의어)
     - 다양한 DB오브젝트를 정의하는 명령어
      (DB오브젝트 : 테이블, 시퀀스, 뷰, 인덱스, 계정 ...)
     - CREATE   : DB 오브젝트 생성 (C)
     - ALTER    : DB 오브젝트 수정 (U)
     - DROP     : DB 오브젝트 삭제 (휴지통에서 복구 가능) (D)
     - TRUNCATE : DB 오브젝드 완전 삭제 (복구 불가능) (D)
     
     3> DCL (Data Control Language, 데이터 제어 명령어)
     - 데이터의 흐름을 제어하기 위해 사용하는 명령어들
     - GRANT    : 권한 부여 ( 권한이 없으면 데이터 접근을 막는다 )
     - REVOKE   : 권한 회수 
     - ROLLBACK : 작업 되돌리기
     - COMMIT   : 작업 확정짓기 (롤백이 불가능한 상태로 만들기)
*/

SELECT * FROM tabs;


/*
    # 테이블 생성하기
    
    CREATE TABLE 테이블명 (컬럼1 컬럼타입1, 컬럼2 컬럼타입2 ....)
*/

CREATE TABLE fruits(
    fruit_name VARCHAR2(30),
    fruit_price NUMBER(6),
    fruit_grade VARCHAR2(2),
    country_id CHAR(2)
);

DESC fruits;

/*
    #테이블 삭제
    
    DROP TABLE 테이블명;
*/
DROP TABLE fruits;

-- DROP로 삭제한 DB오브젝트 휴지통에서 확인할 수 있다.
SHOW recyclebin;

-- 휴지통에 있는 테이블 복구하기
FLASHBACK TABLE fruits TO BEFORE DROP;
DESC fruits;

-- 휴지통 비우기, 테이블 복구하기는 이제 안된다.
PURGE recyclebin;


-- 기존 테이블을 복사하여 새 테이블 만들기
CREATE TABLE employees2 AS (SELECT * FROM employees);

-- 테이블의 데이터 및 구조가 함께 복사된다
SELECT * FROM employees2;
DESC employees2;

-- 여러가지 테스트 가능
SELECT * FROM employees2 INNER JOIN departments USING (department_id);

/*
    # 테이블 구조만 복사하기 (데이터는 필요 없을때)
    
*/
CREATE TABLE employees3 AS (SELECT * FROM employees WHERE 1 = 0);
-- 107행을 돌리면서 1=0을 만족시킬수 있는 건 없기 때문데, 데이터는 하나도 복사되지 않는다.
-- 일부러 거짓 조건을 사용하여 테이블의 구조만 복사한것
DESC employees3;
SELECT * FROM employees3;

/*
    # TRUNCATE : DB 오브젝드 완전 삭제 (복구 불가능) (D)
     TRUNCATE TABLE 테이블명 : 구조만 남기고 모든 내용을 잘라버린다.
*/

TRUNCATE TABLE employees2;
SELECT * FROM employees2;

DROP TABLE employees2;
DROP TABLE employees3;
PURGE recyclebin;

/*
 1:N 관계의 개체들을 테이블로 생성해보세요
 
*/

CREATE TABLE onlinelibraries (
    library_id VARCHAR2(10) primary key,
    book_name VARCHAR2(100),
    book_location VARCHAR2(5),
    book_price NUMBER(10),
    author VARCHAR2(20),
    publisher VARCHAR2(10), -- 도서 출판사
    publish_date DATE,
    book_category VARCHAR2(10)
);


CREATE TABLE readers(
    reader_id VARCHAR2(10),
    reader_name VARCHAR2(5),
    library_id VARCHAR2(10)
);

DROP TABLE onlinelibraries;
DROP TABLE readers;

/*
테이블이름 : 축구팀
컬럼명 : 소속팀, 팀이름, 감독, 경기장번호, 주장....
컬럼타입 : number, varchar2, varchar2, number, number
기본키컬럼 : team_id
외래키 커럼 : 주장

테이블이름 : 축구선수
컬럼명 : 선수번호(pk), 이름, 나이, 포지션, 국적(fk), 소속팀번호(fk)....
컬럼타입 : number, varchar2, number
기본키컬럼 : 선수번호
외래키 커럼 : 국적, 소속팀번호
*/
CREATE TABLE SoccerStadium (
    stadium_id NUMBER(5),
    stadium_name VARCHAR2(30),
    stadium_address VARCHAR2(100)
);

CREATE TABLE SoccerTeam(
    team_id NUMBER(5),
    team_name VARCHAR2(30),
    team_owner VARCHAR2(10),
    home_stadium_id NUMBER(5), --  SoccerStadium과의 1:1관계 외래키사용
    team_leader_id NUMBER(8) -- SoccerPlayer player_id 와의 1:1관계 외래키 사용
);

CREATE TABLE SoccerPlayer(
    player_id NUMBER(8),
    player_eng_name VARCHAR2(25), -- 영어는 한 글자가 1바이트 차지
    player_kor_name VARCHAR2(40), -- 한글은 한 글자가 3바이트 차지
    player_position VARCHAR2(3),
    player_back_number NUMBER(2),
    country_id CHAR(2), -- countries 테이블에서 가져올 fk 외래키
    team_in NUMBER(5) -- SoccerTeam 테이블에서 가져올 fk 외래키
);













