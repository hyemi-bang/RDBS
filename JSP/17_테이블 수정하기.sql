--17_테이블 수정하기.sql

/*
    # 테이블에 새 컬럼 추가하기
    - ALTER TABLE 테이블명 ADD (컬럼명 컬럼타입 제약조건, ...);
    - 새 컬럼이 추가되면 기존에 존재하던 행들은 해당 컬럼값이 null이 된다.
    - 새 컬럼 NOT NULL 컬럼을 추가할 때는 기본값을 반드시 설정해야 한다.
*/

ALTER TABLE coffee ADD (
    coffee_taste VARCHAR2(20),
    coffee_satis NUMBER(2, 1)
);

ALTER TABLE coffee DROP COLUMN coffee_taste;
ALTER TABLE coffee DROP COLUMN coffee_satis;

SELECT * FROM coffee;

ALTER TABLE coffee ADD (
    coffee_taste VARCHAR2(20) DEFAULT 'Bitter'
        CONSTRAINT coffee_taste_nn NOT NULL,
    coffee_satis NUMBER(2, 1)
);

-- countries 를 countries2로 복사할때 기본키 제약조건은 함께 복사되지 않는다.
CREATE TABLE countries2 AS (SELECT * FROM countries);
-- 함께 복사되는 제약조거는 컬럼에 딸려있는 not null 뿐일것이다. (check도 될 수도 ..?)
DESC countries2;
SELECT * FROM user_constraints WHERE table_name ='COUNTRIES2';

-- countries2.country_id를 외래키로 가져다 쓰기 위해 기본키 제약조건을 추가하였다.
ALTER TABLE countries2 MODIFY(
    country_id CHAR(2)
        CONSTRAINT countries2_c_id_pk PRIMARY KEY
);

ALTER TABLE coffee ADD(
    country_id CHAR(2)
        CONSTRAINT coffee_c_id_fk REFERENCES countries2(country_id)
);

UPDATE coffee SET country_id = 'AU';

-- 테이블 컬럼 이름 변경하기 : ALTER TABLE 테이블명 RENAME COLUMN 원래이름 TO 바꿀이름;
ALTER TABLE coffee RENAME COLUMN coffee_satis TO coffee_satisfaction;

-- 테이블 제약조건 이름 변경하기 : ALTER TABLE 테이블명 RENAME CONSTRAINT 원래 TO 바꿀;
ALTER TABLE coffee RENAME CONSTRAINT coffee_price_positive TO coffee_price_pos;
SELECT * FROM user_constraints WHERE table_name ='COFFEE';

-- 테이블 이름 변경하기 : RENAME 테이블명 TO 바꿀이름;
RENAME countries2 TO countries3;
--> 외래키로 참조하고 있던 부모 테이블의 이름을 바꿔도 DB가 알아서 동기화
--> 제약조건명은 동기화 해주지 않음으로 직접 수정해야한다.
ALTER TABLE countries3 RENAME CONSTRAINT countries2_c_id_pk TO countries3_c_id_pk;










