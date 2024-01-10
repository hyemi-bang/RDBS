--20_������.sql

/*
    #������ (Sequence)
    - �⺻Ű�� ����ϱ� ���ϵ��� ��ȣ�� �ڵ����� �������ִ� db object
    CREATE SEQUENCE ��������
                    [START WITH n] - ���۹�ȣ ����
                    [INCREMENT BY n] - ���� ���� ����
                    [MAXVALUE n | NOMAXVALUE] - �ִ� ���� ����
                    [MINVALUE n | NOMINVALUE] - �ּ� ���� ����
                    [CYCLE | NOCYCLE] - ���� ��ȯ ���� ����
                    [CACHE n | NOCACHE] - ��ȣ�� �̸� �������� ���� ����
*/

-- ������ ������ ��ųʸ� ��
 SELECT * FROM user_sequences;
 SELECT * FROM all_sequences;
 
 -- ������ �����ϱ�
 CREATE SEQUENCE coffee_seq1; -- ������ �⺻���� ������
 CREATE SEQUENCE fruit_id_seq START WITH 10 INCREMENT BY 10;
 
 -- �׽�Ʈ�� ���̺� dual : ������ ���� ���̺� 1ĭ,1�ุ ����
 SELECT * FROM dual;
 SELECT 10*10 FROM dual;
 SELECT upper('apple') FROM dual;
 
 
 -- ������.nextval : ������ȣ�� ����Ѵ� (�ٽô� ���� ��ȣ�� ���ư� �� ����.)
 SELECT coffee_seq1.nextval FROM dual;
 SELECT fruit_id_seq.nextval FROM dual;
 
 -- ������.currval : ���� ��ȣ�� Ȯ���Ѵ� (�� ó������ ����� �� ����)
 -- nextval�� �ѹ��̶� ������ �Ŀ� Ȯ�� �����ϴ�
 SELECT coffee_seq1.currval FROM dual;


DELETE FROM fruits;
ALTER TABLE fruits ADD CONSTRAINT fruit_id_pk PRIMARY KEY(fruit_id);

 -- �������� ����� ���̺� insert�ϱ�
 -- �⺻Ű ���� ���� ����ϸ� ����� ������ �������� ����� ����Ѵ�
 INSERT INTO fruits(fruit_id, fruit_name, fruit_price)
 VALUES (fruit_id_seq.nextval, 'Apple', 1234);

SELECT * FROM fruits;

CREATE SEQUENCE bank_waiting_seq
    START WITH 10 INCREMENT BY 20 MAXVALUE 100 CYCLE NOCACHE;
DROP SEQUENCE bank_waiting_seq; --  ��������

CREATE SEQUENCE bank_waiting_seq
    START WITH 10 INCREMENT BY 20
    MINVALUE 10 MAXVALUE 100 CYCLE NOCACHE;
 
SELECT bank_waiting_seq.nextval FROM dual; 

-- ������ �����ϱ� : DROP SEQUENCE ��������;
-- ������ �����ϱ� : ALTER SEQUENCE �������� [�ɼ��� create sequence�� ����]



 
 
 
 
 