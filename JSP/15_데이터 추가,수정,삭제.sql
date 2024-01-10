--15_���̺� �߰�,����,����.sql

/*
    #���̺� ������ �߰��ϱ�
    - INSERT INTO ���̺��(�÷�1,�÷�2...) VALUES(��1,��2...);
    - INSERT INTO ���̺�� VALUES(�ݵ�� ��� �÷� ���� �������);
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

-- INSERT�ÿ� �÷� ������ �� ��ų �ʿ�� ����
-- �÷� ������ �ٲپ��ٸ�, ���� ������ �ٲ�����Ѵ�.
INSERT INTO fruits(country_id, fruit_grade, fruit_price, fruit_name)
VALUES('AU', 'SS',3300, 'Banana');

/*
    # INSERT�ÿ� �÷��� ��� ���� ���� �� �ִ�.
    �� ���� ���� �÷����� �ڵ����� NULL�� ����.
    ���� ���� �÷��� null�� ������� �ʴ� �÷��� ��� ������ �߻��Ѵ� 
    (���鶧 ����ó�� not null)
    cannot insert NULL into ("HR"."FRUITS"."COUNTRY_ID")
*/

-- ������ �÷��� �ϳ��� country_id���� NULL�� ������� �ʾƼ� INSERT�� �źεǾ���.
-- ������ �÷��� fruit_price�� fruit_grade���� null�� ����.
INSERT INTO fruits(fruit_name, fruit_price)
VALUES('Grape', 3000);

INSERT INTO fruits(fruit_name, country_id) VALUES('Grape', 'FR');

-- �÷����� �����ϸ� ��� �÷��� ���� ������� ������Ѵ�.
INSERT INTO fruits VALUES ('Peach', 1800, 'A', 'KR');

-- ���������� INSERT�ϱ� (���̺� ������ ������ ��� ����)
INSERT INTO fruits (SELECT * FROM fruits);

SELECT * FROM fruits WHERE country_id = 'KR';


/*
    #���̺� ������ �����ϱ�
    - UPDATE ���̺�� SET �÷�1=��1, �÷�2=��2 ... WHERE ������;
    - ���� ������ �������� ������ ��� ���� �����ȴ�
    - �ϳ��� �ุ �����ϱ� ���ؼ� �⺻Ű(�Ǵ� �ĺ�Ű)�� �Բ� ���� Ȱ��ȴ�
*/

COMMIT; -- ��������� ��������� �����Ѵ�.(DCL)
SELECT * FROM fruits;

UPDATE fruits SET fruit_name = 'PineApple';
-- ������ �������� ������ �ش� ���̺��� ��� ���� ���������� ����

ROLLBACK; -- ��������� ��� ����ϰ� ���� �ֱ��� COMMIT ���·� ���ư��� (DCL)

-- ������ �����ؾ� ���ϴ� �ุ ������ �� �ִ�.
UPDATE fruits
SET
    fruit_name = 'PineApple',
    fruit_price = 5000
WHERE
    fruit_name = 'Apple';
    
/*
    # ���̺� ������ �����ϱ�
    - DELETE FROM ���̺�� WHERE ������;
    - ������ ���� ������ �ش� ���̺��� ��� �����Ͱ� �����ȴ� (�����ǡ�)
*/

COMMIT;
DELETE FROM fruits; -- ������ ���� ������ ��� ���� �����ȴ�
ROLLBACK;

-- ������ ����� ���ϴ� �ุ ������ �� �ִ�.
DELETE FROM fruits WHERE fruit_grade IS NULl;


SELECT * FROM fruits;
SELECT * FROM tabs;

CREATE TABLE onlinelibraries (
    library_id VARCHAR2(10),
    book_name VARCHAR2(100),
    book_location VARCHAR2(5),
    book_price NUMBER(10),
    author VARCHAR2(30),
    publisher VARCHAR2(30), -- ���� ���ǻ�
    publish_date DATE,
    book_category VARCHAR2(20)
);

CREATE TABLE readers(
    reader_id VARCHAR2(10),
    reader_name VARCHAR2(30),
    reader_favorite_book VARCHAR2(100), -- å �̸� book_name
    reader_favorite_category VARCHAR2(20) -- ���� ���� book_category
);

DROP TABLE onlinelibraries;
DROP TABLE readers;
PURGE recyclebin;

-- ����1> ���� �����ϰ� ������ ���̺� �˸��� �����͵��� �ֱ�

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

-- ����2> �� ���̺� �̻��� JOIN�Ͽ� ���ϴ� �����͸� ��ȸ�ϱ�

SELECT * FROM onlinelibraries;
SELECT * FROM readers;


SELECT * FROM readers r, onlinelibraries o 
WHERE r.reader_favorite_book = o.book_name
AND r.reader_favorite_category = o.book_category;


SELECT book_name FROM readers r, onlinelibraries o 
WHERE r.reader_favorite_category = o.book_category;


COMMIT;

