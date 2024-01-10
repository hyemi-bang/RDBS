CREATE TABLE receipt (
    receipt_id NUMBER(30) PRIMARY KEY,
    membership_tel VARCHAR2(20) CONSTRAINT membership_tel__fk REFERENCES membership(membership_tel),
    receipt_menu1 VARCHAR2(80) CONSTRAINT receipt_menu1_nn NOT NULL,
    receipt_price1 NUMBER(5) CONSTRAINT receipt_price1_nn NOT NULL,
    receipt_menu2 VARCHAR2(80),
    receipt_price2 NUMBER(5),
    receipt_menu3 VARCHAR2(80),
    receipt_price3 NUMBER(5),
    receipt_menu4 VARCHAR2(80),
    receipt_price4 NUMBER(5),
    receipt_menu5 VARCHAR2(80),
    receipt_price5 NUMBER(5),
    receipt_menu6 VARCHAR2(80),
    receipt_price6 NUMBER(5),
    receipt_menu7 VARCHAR2(80),
    receipt_price7 NUMBER(5),
    receipt_menu8 VARCHAR2(80),
    receipt_price8 NUMBER(5),
    receipt_menu9 VARCHAR2(80),
    receipt_price9 NUMBER(5),
    total_price NUMBER(5) CONSTRAINT total_pricee__nn NOT NULL,
    receipt_date DATE CONSTRAINT receipt_date__nn NOT NULL
);
INSERT INTO receipt(receipt_id,membership_tel,receipt_menu1,receipt_price1,receipt_menu2,receipt_price2,total_price,receipt_date)
VALUES (81, 01072886490 , '단팥죽(모찌제외)', 4900, '피치 블라스트', 4000, 8900, TO_DATE('2023-12-01', 'YYYY-MM-DD') );
INSERT INTO receipt(receipt_id,membership_tel,receipt_menu1,receipt_price1,receipt_menu2,receipt_price2,total_price,receipt_date)
VALUES (80, 01024521528 , '아메리카노(HOT)', 3000, '연유 라떼(HOT)', 3800, 6800, TO_DATE('2023-11-22', 'YYYY-MM-DD') );

select*from receipt;
COMMIT; -- 커밋 단축키 f11 


create table membership(
    membership_id number(30)
    constraint membership_id_pk primary key,
    membership_tel varchar2(20)
    CONSTRAINT membership_tel_nn NOT NULL
    CONSTRAINT membership_tel_UK UNIQUE,
    mambership_point number(30)
);

