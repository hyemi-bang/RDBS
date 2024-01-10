--16_2_제약조건.sql

/*
    # 제약조건 추가
    
    2. 테이블 생성 후에 제약조건 따로 추가하기
    - ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 제약조건타입(컬럼명);
    - NOT NULL, CHECK, DEFAULT는 MODIFY로 컬럼을 수정해야한다.
            --> ALTER TABLE 테이블명 MODIFY(컬럼1 타입1 CONSTRAINT...);
                                          ㄴ--> CREATE TABLE과 문법이 같다
*/

CREATE TABLE snacks(
    snack_id    NUMBER(5),
    snack_name  VARCHAR2(50),
    snack_price NUMBER(6)
);

SELECT * FROM snacks;

-- 이미 만들어진 테이블에 제약조건 추가하기
ALTER TABLE snacks ADD CONSTRAINT snack_id_pk PRIMARY KEY(snack_id);
ALTER TABLE snacks ADD CONSTRAINT snack_name_uk UNIQUE(snack_name);
ALTER TABLE snacks ADD CONSTRAINT snack_name_nn NOT NULL(snack_name);
--NOT NULL, CHECK 제약조건은 ALTER TABLE 테이블이 아닌 다른 문법을 사용해야한다.
-- MODIFY로 컬럼을 수정해야한다.

-- 테이블의 컬럼을 수정하면서 제약조건을 추가할 수 있다 
-- ALTER TABLE 테이블명 MODIFY(컬럼1 타입1 CONSTRAINT...);
ALTER TABLE snacks MODIFY(
    snack_name VARCHAR2(100) -- 제약조건 뿐 아니라 컬럼 타입도 수정가능
        CONSTRAINT snack_name_nn NOT NULL,
    snack_price NUMBER(6) DEFAULT 1000
        CONSTRAINT snack_price_positive CHECK (snack_price >=0)
        CONSTRAINT snack_price_nn NOT NULL
);

SELECT * FROM user_constraints WHERE table_name = 'SNACKS';

INSERT INTO snacks (snack_id, snack_name) VALUES(1, '포카칩');
INSERT INTO snacks (snack_id, snack_name, snack_price) VALUES(1, '포카칩', null);
SELECT * FROM snacks;

/*
    #테이블 제약조건 삭제하기
    - ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건명;
    - 자동 생성된 이름은 지우기가 힘드므로 자동생성된 이름을 잘 찾아라~~
*/
SELECT * FROM user_constraints WHERE table_name = 'SNACKS';
ALTER TABLE snacks DROP CONSTRAINT snack_price_nn;

/*
    # 테이블 제약조건 이름 변경하기
    - ALTER TABLE 테이블명 RENAME CONSTRAINT 원래이름 TO 바꿀이름;
*/

ALTER TABLE snacks RENAME CONSTRAINT snack_id_pk TO snacks_snack_id_pk;

/*
    # 제약조건 추가
    
    3. CREATE TABLE 내부에서 컬럼을 모두 정의한 이후 따로 제약조건을 후술하는 방식
    - DEFAULT와 NOT NULL은 컬럼 레벨에서 정의해야한다    
*/

CREATE TABLE Clothes (
    -- 컬럼 레벨
    clothes_id NUMBER(5),
    clothes_type VARCHAR2(15)
         CONSTRAINT clothes_type_nn NOT NULL,
    clothes_name VARCHAR2(50),
    clothes_size VARCHAR2(10),
    -- 테이블 레벨
    -- 제약조건을 후술/ 마저 정의할 수 있다.
    CONSTRAINT clothes_id_pk PRIMARY KEY(clothes_id),
    -- CONSTRAINT clothes_type_nn NOT NULL 이 위치에서 
    -- NOT NULL정의할 수 없음으로 위에서 정의해야한다 ()를 사용할 수 없어서
    CONSTRAINT clothes_size CHECK(clothes_size IN ('SS','S','M','L','XL','XXL'))
);

SELECT * FROM user_constraints WHERE table_name = 'CLOTHES';

/*
    #외래키 설정하기
    - 외래키 제약조건은 설정할 때 다른 테이블의 PK, UK를 지정해야한다
    - 외래키로 설정된 컬럼은 값을 추가할 떄 참조하는 컬럼에 존재하는 값 또는 null만 추가가능
*/
--1.컬럼레벨(테이블 생성과 동시에)에서 외래키 제약조건 설정하기

CREATE TABLE CoffeeBeans(
    bean_id NUMBER(6)
        CONSTRAINT coffeebeans_been_id_pk PRIMARY KEY,
    bean_name VARCHAR2(30)
        CONSTRAINT coffeebeans_bean_name_nn NOT NULL,
    country_id CHAR(2)
        CONSTRAINT coffeebeans_c_id_fk REFERENCES countries(country_id)
);

ALTER TABLE coffeebeans DROP CONSTRAINT coffeebeans_c_id_fk;

-- 2. ALTER TABLE - ADD CONSTRAINT로 외래키 추가
--  FOREIGN KEY (외래키컬럼) REFERENCES 부모테이블(부모컬럼);
ALTER TABLE coffeebeans ADD CONSTRAINT coffeebeans_c_id_fk 
FOREIGN KEY(country_id) REFERENCES countries(country_id);
SELECT * FROM user_constraints WHERE table_name = 'COFFEEBEANS';

SELECT * FROM user_constraints WHERE table_name = 'COUNTRIES';
SELECT * FROM countries;

INSERT INTO coffeebeans VALUES(1, '짐바브웨어커피콩', 'ZW');
INSERT INTO coffeebeans VALUES(2, '한국커피콩', 'KR');
INSERT INTO coffeebeans VALUES(3, '어디껀지모르는커피콩', null);
INSERT INTO coffeebeans VALUES(4, '일본커피콩', 'JP');
SELECT * FROM CoffeeBeans;

DROP TABLE coffeebeans;
PURGE recyclebin;

-- 3.  CREATE TABLE 내부에서 제약조건 후술하기
CREATE TABLE Coffeebeans(
    bean_id NUMBER(5),
    bean_name VARCHAR2(30)
        CONSTRAINT coffeebeans_bean_name_nn NOT NULL,
    country_id CHAR(2),
        CONSTRAINT coffeebeans_b_id_pk PRIMARY KEY(bean_id),
        CONSTRAINT coffeebeans_c_id_fk FOREIGN KEY(country_id)
            REFERENCES countries(country_id)
);

-- 연습> 1:N 테이블에 제약조건 올바르게 추가해보기
SELECT * FROM user_constraints WHERE table_name = 'ONLINELIBRARIES';

SELECT * FROM onlinelibraries;
ALTER TABLE onlinelibraries ADD CONSTRAINT library_id_pk PRIMARY KEY(library_id);
ALTER TABLE onlinelibraries MODIFY(
    book_category VARCHAR2(40) 
        CONSTRAINT b_category_nn NOT NULL
);
ALTER TABLE onlinelibraries MODIFY(
   book_name VARCHAR2(100)
        CONSTRAINT book_name_uk UNIQUE
);

SELECT * FROM user_constraints WHERE table_name = 'READERS';
SELECT * FROM readers;
ALTER TABLE readers ADD CONSTRAINT reader_id_pk PRIMARY KEY(reader_id);
ALTER TABLE readers MODIFY(
    reader_name VARCHAR2(30)
        CONSTRAINT reader_nm_nn NOT NULL
);
ALTER TABLE readers ADD CONSTRAINT reader_fa_fk
FOREIGN KEY (reader_favorite_book) REFERENCES onlinelibraries (book_name);

