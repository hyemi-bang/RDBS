--������ver

CREATE TABLE bread(
     bread_id Number(6)
        CONSTRAINT bread_id_pk PRIMARY KEY,
    bread_name VARCHAR2(20),
    bread_price NUMBER(5)
);
CREATE SEQUENCE bread_id_seq START WITH 1 INCREMENT BY 1;
INSERT INTO bread (bread_id, bread_name, bread_price) VALUES(bread_id_seq.nextval,'�Ļ�', 3000);
INSERT INTO bread (bread_id, bread_name, bread_price) VALUES(bread_id_seq.nextval,'��л�', 5000);
INSERT INTO bread (bread_id, bread_name, bread_price) VALUES(bread_id_seq.nextval,'��׻�', 2500);
INSERT INTO bread (bread_id, bread_name, bread_price) VALUES(bread_id_seq.nextval,'�ٰ�Ʈ', 3800);
INSERT INTO bread (bread_id, bread_name, bread_price) VALUES(bread_id_seq.nextval,'�ұݻ�', 2800);

COMMIT;
--DROP table bread;
--DELETE FROM bread;
--drop sequence bread_id_seq; -- ������ ���� 

CREATE TABLE bread(
    bread_name VARCHAR2(20)
    CONSTRAINT bread_name_uq UNIQUE,
    bread_price NUMBER(5)
);
INSERT INTO bread  VALUES('�Ļ�', 3000);
INSERT INTO bread  VALUES('��л�', 5000);
INSERT INTO bread  VALUES('��׻�', 2500);
INSERT INTO bread  VALUES('�ٰ�Ʈ', 3800);
INSERT INTO bread VALUES('�ұݻ�', 2800);

SELECT * FROM bread;