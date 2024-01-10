CREATE TABLE countries2 AS (SELECT * FROM countries);
SELECT * FROM countries2;
SELECT * FROM regions;
SELECT * FROM user_constraints WHERE table_name ='COUNTRIES2';
ALTER TABLE countries2 ADD CONSTRAINT countries2_id_pk PRIMARY KEY(country_id);
ALTER TABLE countries2 DROP CONSTRAINT SYS_C007218;
ALTER TABLE countries2 ADD CONSTRAINT region_id_c_id_fk 
FOREIGN KEY(region_id) REFERENCES regions(region_id);

SELECT * FROM user_constraints WHERE table_name ='COUNTRIES2';
SELECT * FROM user_constraints WHERE table_name ='COFFEEBEANS';

--제약조건 수정
ALTER TABLE coffeebeans DROP CONSTRAINT COFFEEBEANS_C_ID_FK;
ALTER TABLE coffeebeans ADD CONSTRAINT coffeebeans_c2_id_fk 
FOREIGN KEY(country_id) REFERENCES countries2(country_id);

CREATE TABLE coffeebeans(
bean_id NUMBER(6)
    CONSTRAINT coffeebeans_bean_id_pr PRIMARY KEY,
bean_name VARCHAR2(20)
    CONSTRAINT coffeebeans_name_nn NOT NULL,
country_id CHAR(2)
    CONSTRAINT coffeebeans_c_id_fk REFERENCES countries2(country_id),
coffee_taste VARCHAR2(20)
    CONSTRAINT coffeeBeans_taste_nn NOT NULL
);
SELECT*FROM coffeebeans ORDER BY bean_id;

-- 커피빈 테이블 시퀀스 설정
CREATE SEQUENCE coffeebeans_id_seq START WITH 1 INCREMENT BY 1;

--DELETE FROM countries2 WHERE country_name = 'Colombia';
-- 컨트리테이블 나라 추가
INSERT INTO countries2(country_id, country_name, region_id)VALUES('KR', 'Republic of Korea', 3);
INSERT INTO countries2(country_id, country_name, region_id)VALUES('NC', 'Nicaragua', 2);
INSERT INTO countries2(country_id, country_name, region_id)VALUES('CB', 'Colombia', 2);
INSERT INTO countries2(country_id, country_name, region_id)VALUES('CR', 'Costa Rica', 2);
INSERT INTO countries2(country_id, country_name, region_id)VALUES('KN', 'Kenya', 4);
INSERT INTO countries2(country_id, country_name, region_id)VALUES('BL', 'Bolivia', 2);
INSERT INTO countries2(country_id, country_name, region_id)VALUES('ES', 'El Salvador', 2);
INSERT INTO countries2(country_id, country_name, region_id)VALUES('ID', 'Indonesia', 3);
INSERT INTO countries2(country_id, country_name, region_id)VALUES('ET', 'Ethiopia', 4);
INSERT INTO countries2(country_id, country_name, region_id)VALUES('UG', 'Uganda', 4);
INSERT INTO countries2(country_id, country_name, region_id)VALUES('PN', 'Papua New Guinea', 3);


--DELETE FROM coffeebeans;

-- 커피빈테이블 데이터 추가
--고소한맛 ver
-- 인도
INSERT INTO coffeebeans(bean_id, bean_name, country_id, coffee_taste)
VALUES(coffeebeans_id_seq.NEXTVAL, 'ARAKU', 'IN', 'NUTTY');
-- 브라질
INSERT INTO coffeebeans VALUES(coffeebeans_id_seq.NEXTVAL, 'SANTAINEZ', 'BR', 'NUTTY');
-- 니콰가라
INSERT INTO coffeebeans VALUES(coffeebeans_id_seq.NEXTVAL, 'SANTAMARIA', 'NC', 'NUTTY');
-- 멕시코
INSERT INTO coffeebeans(bean_id, bean_name, country_id, coffee_taste)
VALUES(coffeebeans_id_seq.NEXTVAL, 'Las Chicharras', 'MX', 'NUTTY');
-- 콜롬비아
INSERT INTO coffeebeans(bean_id, bean_name, country_id, coffee_taste)
VALUES(coffeebeans_id_seq.NEXTVAL, 'Supremo', 'CB', 'NUTTY');
-- 코스타리카
INSERT INTO coffeebeans(bean_id, bean_name, country_id, coffee_taste)
VALUES(coffeebeans_id_seq.NEXTVAL, 'Dota Jazu', 'CR', 'NUTTY');

-- 산미ver
-- 에티오피아
INSERT INTO coffeebeans(bean_id, bean_name, country_id, coffee_taste)
VALUES(coffeebeans_id_seq.NEXTVAL, 'Yirgacheffe CheleBaG1', 'ET', 'ACIDITY');
INSERT INTO coffeebeans(bean_id, bean_name, country_id, coffee_taste)
VALUES(coffeebeans_id_seq.NEXTVAL, 'Natural', 'ET', 'ACIDITY');
-- 케냐
INSERT INTO coffeebeans(bean_id, bean_name, country_id, coffee_taste)
VALUES(coffeebeans_id_seq.NEXTVAL, 'Kiambu AA', 'KN', 'ACIDITY');
-- 볼리비아
INSERT INTO coffeebeans(bean_id, bean_name, country_id, coffee_taste)
VALUES(coffeebeans_id_seq.NEXTVAL, 'Taypiplaya Washed', 'BL', 'ACIDITY');
-- 엘살바도르
INSERT INTO coffeebeans(bean_id, bean_name, country_id, coffee_taste)
VALUES(coffeebeans_id_seq.NEXTVAL, 'Kuska Japa', 'ES', 'ACIDITY');

--묵직ver
-- 인도네시아
INSERT INTO coffeebeans(bean_id, bean_name, country_id, coffee_taste)
VALUES(coffeebeans_id_seq.NEXTVAL, 'Mandheling', 'ID', 'HEAVY');
-- 에티오피아
INSERT INTO coffeebeans(bean_id, bean_name, country_id, coffee_taste)
VALUES(coffeebeans_id_seq.NEXTVAL, 'Moccahara', 'ET', 'HEAVY');
-- 우간다
INSERT INTO coffeebeans(bean_id, bean_name, country_id, coffee_taste)
VALUES(coffeebeans_id_seq.NEXTVAL, 'Bugisu Sipi', 'UG', 'HEAVY');
-- 파푸아뉴기니
INSERT INTO coffeebeans(bean_id, bean_name, country_id, coffee_taste)
VALUES(coffeebeans_id_seq.NEXTVAL, 'Chimbu', 'PN', 'HEAVY');

commit;