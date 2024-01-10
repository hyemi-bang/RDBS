--15_테이블 추가,수정,삭제.sql

/*
    #테이블에 데이터 추가하기
    - INSERT INTO 테이블명(컬럼1,컬럼2...) VALUES(값1,값2...);
    - INSERT INTO 테이블명 VALUES(반드시 모든 컬럼 값을 순서대로);
*/

CREATE TABLE fruits(
    fruit_name VARCHAR2(30),
    fruit_price NUMBER(6),
    fruit_grade VARCHAR2(2),
    country_id CHAR(2) NOT NULL
);
DROP TABLE fruits;
PURGE recyclebin;

SELECT * FROM fruits;
INSERT INTO fruits(fruit_name, fruit_price, fruit_grade, country_id)
VALUES('Apple', 1300, 'A+', 'KR');

-- INSERT시에 컬럼 순서를 꼭 지킬 필요는 없다
-- 컬럼 순서를 바꾸었다면, 값의 순서도 바꿔줘야한다.
INSERT INTO fruits(country_id, fruit_grade, fruit_price, fruit_name)
VALUES('AU', 'SS',3300, 'Banana');

/*
    # INSERT시에 컬럼을 모두 적지 않을 수 있다.
    단 적지 않은 컬럼에는 자동으로 NULL이 들어간다.
    적지 않은 컬럼이 null을 허용하지 않는 컬럼인 경우 에러가 발생한다 
    (만들때 예외처리 not null)
    cannot insert NULL into ("HR"."FRUITS"."COUNTRY_ID")
*/

-- 생략한 컬럼중 하나인 country_id에서 NULL을 허용하지 않아서 INSERT가 거부되었다.
-- 생략한 컬럼인 fruit_price와 fruit_grade에는 null이 들어갔다.
INSERT INTO fruits(fruit_name, fruit_price)
VALUES('Grape', 3000);

INSERT INTO fruits(fruit_name, country_id) VALUES('Grape', 'FR');

-- 컬럼명을 생략하면 모든 컬럼의 값을 순서대로 적어야한다.
INSERT INTO fruits VALUES ('Peach', 1800, 'A', 'KR');

-- 서브쿼리로 INSERT하기 (테이블 구조가 동일한 경우 가능)
INSERT INTO fruits (SELECT * FROM fruits);

SELECT * FROM fruits WHERE country_id = 'KR';


/*
    #테이블 데이터 수정하기
    - UPDATE 테이블명 SET 컬럼1=값1, 컬럼2=값2 ... WHERE 조건절;
    - 만약 조건을 지정하지 않으면 모든 행이 수정된다
    - 하나의 행만 수정하기 위해서 기본키(또는 후보키)와 함께 자주 활용된다
*/

COMMIT; -- 현재까지의 변경사항을 저장한다.(DCL)
SELECT * FROM fruits;

UPDATE fruits SET fruit_name = 'PineApple';
-- 조건을 지정하지 않으면 해당 테이블의 모든 행이 수정됨으로 주의

ROLLBACK; -- 변경사항을 모두 취소하고 가장 최근의 COMMIT 상태로 돌아간다 (DCL)

-- 조건을 지정해야 원하는 행만 수정할 수 있다.
UPDATE fruits
SET
    fruit_name = 'PineApple',
    fruit_price = 5000
WHERE
    fruit_name = 'Apple';
    
/*
    # 테이블 데이터 삭제하기
    - DELETE FROM 테이블명 WHERE 조건절;
    - 조건을 적지 않으면 해당 테이블의 모든 데이터가 삭제된다 (※주의※)
*/

COMMIT;
DELETE FROM fruits; -- 조건을 적지 않으면 모든 행이 삭제된다
ROLLBACK;

-- 조건을 적어야 원하는 행만 삭제할 수 있다.
DELETE FROM fruits WHERE fruit_grade IS NULl;


SELECT * FROM fruits;
SELECT * FROM tabs;

CREATE TABLE onlinelibraries (
    library_id VARCHAR2(10),
    book_name VARCHAR2(100),
    book_location VARCHAR2(5),
    book_price NUMBER(10),
    author VARCHAR2(30),
    publisher VARCHAR2(30), -- 도서 출판사
    publish_date DATE,
    book_category VARCHAR2(20)
);

CREATE TABLE readers(
    reader_id VARCHAR2(10),
    reader_name VARCHAR2(30),
    reader_favorite_book VARCHAR2(100), -- 책 이름 book_name
    reader_favorite_category VARCHAR2(20) -- 도서 구분 book_category
);

DROP TABLE onlinelibraries;
DROP TABLE readers;
PURGE recyclebin;

-- 연습1> 직접 설계하고 정의한 테이블에 알맞은 데이터들을 넣기

INSERT INTO onlinelibraries (library_id, book_name, book_location, book_price,
author, publisher, publish_date, book_category)
VALUES ('LIB001', 'The City and Its Uncertain Walls', 'A101', 29.20,
'Murakami Haruki', 'Munhakdongne', TO_DATE('2023-09-06', 'YYYY-MM-DD'),
'contemporary nove');
UPDATE onlinelibraries SET book_price = 38000 WHERE book_price =29;

INSERT INTO onlinelibraries VALUES ('LIB001', 'The Essential: Albert Camus',
'A201', 15300, 'Albert Camus', 'KYOBO_Midumsa', 
TO_DATE('2022-12-23', 'YYYY-MM-DD'), 'classic novel');

INSERT INTO onlinelibraries VALUES ('LIB001', 
'The Essential: F. Scott Fitzgerald', 'A201', 16200, 'F.Scott Fitzgerald', 
'KYOBO_Midumsa', TO_DATE('2023-09-08', 'YYYY-MM-DD'), 'classic novel');
UPDATE onlinelibraries SET library_id = 'LIB002' WHERE book_category ='classic novel';

INSERT INTO onlinelibraries VALUES ('LIB001', 'Wild Problems', 'B201', 32500, 
'RUSS ROBERTS', 'JM_Publishers', TO_DATE('2022-08-18', 'YYYY-MM-DD'), 
'Self-improvement'); 

INSERT INTO onlinelibraries VALUES ('LIB001', 'Be Your Future Self Now', 'B222', 17800, 
'Hardy, Benjamin', 'Hay House', TO_DATE('2023-08-01', 'YYYY-MM-DD'), 'HRM');

INSERT INTO onlinelibraries VALUES ('LIB020', 'Harry Potter and the Sorcerers Stone',
'A301', 6300, 'Joan K. Rowling', 'Bloomsbury', 
TO_DATE('2014-09-01', 'YYYY-MM-DD'), 'Fiction');

INSERT INTO onlinelibraries (library_id,book_location, book_category) VALUES('LIB001','A211', 'Marketing/Sales');
INSERT INTO onlinelibraries (library_id,book_location, book_category) VALUES('LIB001','A215', 'Essay');  
INSERT INTO onlinelibraries (library_id,book_location, book_category) VALUES('LIB001','A212', 'Psychology');


INSERT INTO readers (reader_id, reader_name, reader_favorite_book, reader_favorite_category)
VALUES ('READ001', 'John', 'Be Your Future Self Now', 'HRM');

INSERT INTO readers (reader_id, reader_name, reader_favorite_book, reader_favorite_category)
VALUES ('READ002', 'Ham', 'Stolen Focus', 'sociology');

INSERT INTO readers (reader_id, reader_name, reader_favorite_book, reader_favorite_category)
VALUES ('READ003', 'Hari', 'Harry Potter and the Sorcerers Stone', 'Fiction');

INSERT INTO readers (reader_id, reader_name, reader_favorite_book, reader_favorite_category)
VALUES ('READ004', 'Jo Hanna', 'Animal Farm', 'classic novel');

-- 연습2> 두 테이블 이상을 JOIN하여 원하는 데이터를 조회하기

SELECT * FROM onlinelibraries;
SELECT * FROM readers;


SELECT * FROM readers r, onlinelibraries o 
WHERE r.reader_favorite_book = o.book_name
AND r.reader_favorite_category = o.book_category;


SELECT book_name FROM readers r, onlinelibraries o 
WHERE r.reader_favorite_category = o.book_category;


COMMIT;

