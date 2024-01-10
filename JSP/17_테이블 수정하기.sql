--17_���̺� �����ϱ�.sql

/*
    # ���̺� �� �÷� �߰��ϱ�
    - ALTER TABLE ���̺�� ADD (�÷��� �÷�Ÿ�� ��������, ...);
    - �� �÷��� �߰��Ǹ� ������ �����ϴ� ����� �ش� �÷����� null�� �ȴ�.
    - �� �÷� NOT NULL �÷��� �߰��� ���� �⺻���� �ݵ�� �����ؾ� �Ѵ�.
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

-- countries �� countries2�� �����Ҷ� �⺻Ű ���������� �Բ� ������� �ʴ´�.
CREATE TABLE countries2 AS (SELECT * FROM countries);
-- �Բ� ����Ǵ� �������Ŵ� �÷��� �����ִ� not null ���ϰ��̴�. (check�� �� ���� ..?)
DESC countries2;
SELECT * FROM user_constraints WHERE table_name ='COUNTRIES2';

-- countries2.country_id�� �ܷ�Ű�� ������ ���� ���� �⺻Ű ���������� �߰��Ͽ���.
ALTER TABLE countries2 MODIFY(
    country_id CHAR(2)
        CONSTRAINT countries2_c_id_pk PRIMARY KEY
);

ALTER TABLE coffee ADD(
    country_id CHAR(2)
        CONSTRAINT coffee_c_id_fk REFERENCES countries2(country_id)
);

UPDATE coffee SET country_id = 'AU';

-- ���̺� �÷� �̸� �����ϱ� : ALTER TABLE ���̺�� RENAME COLUMN �����̸� TO �ٲ��̸�;
ALTER TABLE coffee RENAME COLUMN coffee_satis TO coffee_satisfaction;

-- ���̺� �������� �̸� �����ϱ� : ALTER TABLE ���̺�� RENAME CONSTRAINT ���� TO �ٲ�;
ALTER TABLE coffee RENAME CONSTRAINT coffee_price_positive TO coffee_price_pos;
SELECT * FROM user_constraints WHERE table_name ='COFFEE';

-- ���̺� �̸� �����ϱ� : RENAME ���̺�� TO �ٲ��̸�;
RENAME countries2 TO countries3;
--> �ܷ�Ű�� �����ϰ� �ִ� �θ� ���̺��� �̸��� �ٲ㵵 DB�� �˾Ƽ� ����ȭ
--> �������Ǹ��� ����ȭ ������ �������� ���� �����ؾ��Ѵ�.
ALTER TABLE countries3 RENAME CONSTRAINT countries2_c_id_pk TO countries3_c_id_pk;










