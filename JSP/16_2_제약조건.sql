--16_2_��������.sql

/*
    # �������� �߰�
    
    2. ���̺� ���� �Ŀ� �������� ���� �߰��ϱ�
    - ALTER TABLE ���̺�� ADD CONSTRAINT �������Ǹ� ��������Ÿ��(�÷���);
    - NOT NULL, CHECK, DEFAULT�� MODIFY�� �÷��� �����ؾ��Ѵ�.
            --> ALTER TABLE ���̺�� MODIFY(�÷�1 Ÿ��1 CONSTRAINT...);
                                          ��--> CREATE TABLE�� ������ ����
*/

CREATE TABLE snacks(
    snack_id    NUMBER(5),
    snack_name  VARCHAR2(50),
    snack_price NUMBER(6)
);

SELECT * FROM snacks;

-- �̹� ������� ���̺� �������� �߰��ϱ�
ALTER TABLE snacks ADD CONSTRAINT snack_id_pk PRIMARY KEY(snack_id);
ALTER TABLE snacks ADD CONSTRAINT snack_name_uk UNIQUE(snack_name);
ALTER TABLE snacks ADD CONSTRAINT snack_name_nn NOT NULL(snack_name);
--NOT NULL, CHECK ���������� ALTER TABLE ���̺��� �ƴ� �ٸ� ������ ����ؾ��Ѵ�.
-- MODIFY�� �÷��� �����ؾ��Ѵ�.

-- ���̺��� �÷��� �����ϸ鼭 ���������� �߰��� �� �ִ� 
-- ALTER TABLE ���̺�� MODIFY(�÷�1 Ÿ��1 CONSTRAINT...);
ALTER TABLE snacks MODIFY(
    snack_name VARCHAR2(100) -- �������� �� �ƴ϶� �÷� Ÿ�Ե� ��������
        CONSTRAINT snack_name_nn NOT NULL,
    snack_price NUMBER(6) DEFAULT 1000
        CONSTRAINT snack_price_positive CHECK (snack_price >=0)
        CONSTRAINT snack_price_nn NOT NULL
);

SELECT * FROM user_constraints WHERE table_name = 'SNACKS';

INSERT INTO snacks (snack_id, snack_name) VALUES(1, '��īĨ');
INSERT INTO snacks (snack_id, snack_name, snack_price) VALUES(1, '��īĨ', null);
SELECT * FROM snacks;

/*
    #���̺� �������� �����ϱ�
    - ALTER TABLE ���̺�� DROP CONSTRAINT �������Ǹ�;
    - �ڵ� ������ �̸��� ����Ⱑ ����Ƿ� �ڵ������� �̸��� �� ã�ƶ�~~
*/
SELECT * FROM user_constraints WHERE table_name = 'SNACKS';
ALTER TABLE snacks DROP CONSTRAINT snack_price_nn;

/*
    # ���̺� �������� �̸� �����ϱ�
    - ALTER TABLE ���̺�� RENAME CONSTRAINT �����̸� TO �ٲ��̸�;
*/

ALTER TABLE snacks RENAME CONSTRAINT snack_id_pk TO snacks_snack_id_pk;

/*
    # �������� �߰�
    
    3. CREATE TABLE ���ο��� �÷��� ��� ������ ���� ���� ���������� �ļ��ϴ� ���
    - DEFAULT�� NOT NULL�� �÷� �������� �����ؾ��Ѵ�    
*/

CREATE TABLE Clothes (
    -- �÷� ����
    clothes_id NUMBER(5),
    clothes_type VARCHAR2(15)
         CONSTRAINT clothes_type_nn NOT NULL,
    clothes_name VARCHAR2(50),
    clothes_size VARCHAR2(10),
    -- ���̺� ����
    -- ���������� �ļ�/ ���� ������ �� �ִ�.
    CONSTRAINT clothes_id_pk PRIMARY KEY(clothes_id),
    -- CONSTRAINT clothes_type_nn NOT NULL �� ��ġ���� 
    -- NOT NULL������ �� �������� ������ �����ؾ��Ѵ� ()�� ����� �� ���
    CONSTRAINT clothes_size CHECK(clothes_size IN ('SS','S','M','L','XL','XXL'))
);

SELECT * FROM user_constraints WHERE table_name = 'CLOTHES';

/*
    #�ܷ�Ű �����ϱ�
    - �ܷ�Ű ���������� ������ �� �ٸ� ���̺��� PK, UK�� �����ؾ��Ѵ�
    - �ܷ�Ű�� ������ �÷��� ���� �߰��� �� �����ϴ� �÷��� �����ϴ� �� �Ǵ� null�� �߰�����
*/
--1.�÷�����(���̺� ������ ���ÿ�)���� �ܷ�Ű �������� �����ϱ�

CREATE TABLE CoffeeBeans(
    bean_id NUMBER(6)
        CONSTRAINT coffeebeans_been_id_pk PRIMARY KEY,
    bean_name VARCHAR2(30)
        CONSTRAINT coffeebeans_bean_name_nn NOT NULL,
    country_id CHAR(2)
        CONSTRAINT coffeebeans_c_id_fk REFERENCES countries(country_id)
);

ALTER TABLE coffeebeans DROP CONSTRAINT coffeebeans_c_id_fk;

-- 2. ALTER TABLE - ADD CONSTRAINT�� �ܷ�Ű �߰�
--  FOREIGN KEY (�ܷ�Ű�÷�) REFERENCES �θ����̺�(�θ��÷�);
ALTER TABLE coffeebeans ADD CONSTRAINT coffeebeans_c_id_fk 
FOREIGN KEY(country_id) REFERENCES countries(country_id);
SELECT * FROM user_constraints WHERE table_name = 'COFFEEBEANS';

SELECT * FROM user_constraints WHERE table_name = 'COUNTRIES';
SELECT * FROM countries;

INSERT INTO coffeebeans VALUES(1, '���ٺ����Ŀ����', 'ZW');
INSERT INTO coffeebeans VALUES(2, '�ѱ�Ŀ����', 'KR');
INSERT INTO coffeebeans VALUES(3, '������𸣴�Ŀ����', null);
INSERT INTO coffeebeans VALUES(4, '�Ϻ�Ŀ����', 'JP');
SELECT * FROM CoffeeBeans;

DROP TABLE coffeebeans;
PURGE recyclebin;

-- 3.  CREATE TABLE ���ο��� �������� �ļ��ϱ�
CREATE TABLE Coffeebeans(
    bean_id NUMBER(5),
    bean_name VARCHAR2(30)
        CONSTRAINT coffeebeans_bean_name_nn NOT NULL,
    country_id CHAR(2),
        CONSTRAINT coffeebeans_b_id_pk PRIMARY KEY(bean_id),
        CONSTRAINT coffeebeans_c_id_fk FOREIGN KEY(country_id)
            REFERENCES countries(country_id)
);

-- ����> 1:N ���̺� �������� �ùٸ��� �߰��غ���
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

