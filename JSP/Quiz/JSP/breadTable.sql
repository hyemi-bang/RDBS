--¼±»ý´Ôver

CREATE TABLE bread(
     bread_id Number(6)
        CONSTRAINT bread_id_pk PRIMARY KEY,
    bread_name VARCHAR2(20),
    bread_price NUMBER(5)
);
CREATE SEQUENCE bread_id_seq START WITH 1 INCREMENT BY 1;
INSERT INTO bread (bread_id, bread_name, bread_price) VALUES(bread_id_seq.nextval,'½Ä»§', 3000);
INSERT INTO bread (bread_id, bread_name, bread_price) VALUES(bread_id_seq.nextval,'Åë¹Ð»§', 5000);
INSERT INTO bread (bread_id, bread_name, bread_price) VALUES(bread_id_seq.nextval,'¸ð´×»§', 2500);
INSERT INTO bread (bread_id, bread_name, bread_price) VALUES(bread_id_seq.nextval,'¹Ù°ÔÆ®', 3800);
INSERT INTO bread (bread_id, bread_name, bread_price) VALUES(bread_id_seq.nextval,'¼Ò±Ý»§', 2800);

COMMIT;
--DROP table bread;
--DELETE FROM bread;
--drop sequence bread_id_seq; -- ½ÃÄö½º »èÁ¦ 

CREATE TABLE bread(
    bread_name VARCHAR2(20)
    CONSTRAINT bread_name_uq UNIQUE,
    bread_price NUMBER(5)
);
INSERT INTO bread  VALUES('½Ä»§', 3000);
INSERT INTO bread  VALUES('Åë¹Ð»§', 5000);
INSERT INTO bread  VALUES('¸ð´×»§', 2500);
INSERT INTO bread  VALUES('¹Ù°ÔÆ®', 3800);
INSERT INTO bread VALUES('¼Ò±Ý»§', 2800);

SELECT * FROM bread;