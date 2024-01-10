--16_��������.sql

/*
    # ���Ἲ
    - ������ ���� ����
    - �����͸� ���Ծ��� ���·� �ùٸ��� �����ϴ� ��
    - �����͸� �ùٸ��� �����ϱ� ���ؼ��� �پ��� ������ ���Ἲ�� �������Ѿ��Ѵ�
    - �����ͺ��̽����� �پ��� ���Ἲ���� ��Ű�� ���� ����ϴ� ���� ���������̴�
    
    # ��ü ���Ἲ
    - ���̺��� �����ʹ� �ݵ�� �ϳ��� ���� ������ �� �־���Ѵ�.
    - �� ���� ������ �� ���� �����ʹ� ��ü ���Ἲ�� �������̴�.
    - ��ü ���Ἲ�� ��Ű�� ���� �⺻Ű(PK) ���������� ����Ѵ�.
    
    # �������Ἲ
    - ���� ���迡 �ִ� �����ʹ� ��ȿ�� �����͸� �����ؾ��Ѵ�.
    - DB���� �������� ���� ���Ἲ�� ��Ű�� ���� �ܷ�Ű(FK)���������� ����Ѵ�.
    
    # �����ι��Ἲ
    - �ϳ��� �������� �����ϴ� ��ü���� ��� ���� Ÿ���̾�� �Ѵ�.
    - DB������ �÷� Ÿ���� �����Ͽ� �ش� �÷��� ������ ���Ἲ�� �����Ѵ�.
    
    # ������ ���Ἲ
    - �����Ͱ� ��Ȯ��, �ϰ���, ��ȿ���� �����ϴ� ��
    - CHECK, UNIQUE, NOT NULL ���� ���� ������ ���� ������ ���Ἲ�� ������ �� �ִ�.
    
    # DB�� �������ǵ�
    - UNIQUE : �ش� �����ο� �ߺ��Ǵ� ���� ������� �ʴ´� (NULL���)
    - NOT NULL : �ش� �����ο� NULL�� ������� �ʴ´�
    - PRIMARY KEY : �⺻Ű, PK, NOT NULL + UNIQUE, �� ���̺� 1���� ��������
                 - > �⺻Ű���� NULL���� �ߺ��� ���� ������ �ȵȴ�
                 - > PRIMARY KEY �������� �ɾ��ָ� �ڵ����� NOT NULL ó��
    - FOREIGN KEY : �ش� �������� �ܷ�Ű�� ����. ��� �÷��� ������ �� �����ؾ��Ѵ�.
                    �⺻Ű �Ǵ� UNIQUE ���������� ������ �÷��� ������ �� �ִ�.
    - CHECK : ���ϴ� ������ ���� �����Ͽ� �ش� ������ �����ϴ� ��ü�� �߰����
*/


/*
    #CONSTRAINT_TYPE
    - P : Primary Key
    - R : References (Forign Key)
    - U : Unique
    - C : Check, Not Null
    �� https://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_1047.htm#REFRN20047
*/

-- ���� ����(hr)�� �����ϴ� �������� ����
SELECT * FROM user_constraints; 
SELECT * FROM user_constraints WHERE table_name = 'EMPLOYEES'; 

-- ��� ������ �����ϴ� �������� ����
SELECT * FROM all_constraints;

/*
    # ������ ��ųʸ� (Data Dictionary)
    - �����Ϳ� ���� ������ (������ ����, ��Ÿ ������)
    - ���� db�� ��Ȳ�� ����, db�� �˾Ƽ� �����ϴ� ������
    - db ����ڴ� ������ ��ųʸ��� ���� ������ �� ����.
    
    # ������ ��ųʸ� ��
    - ������ ��ųʸ��� ����ڰ� Ȯ���� �� �ֵ��� �����ϴ� view (��)
        -> VIEW : DB������Ʈ �� �ϳ��� ��ü �÷��� �Ϻθ� ���� ���� ���·�
                  ��ȸ�� �� �ִ� �̴� ���̺� (���� ���̺��� �κ�����)
    - �տ� user_�� �٤��̸� ���� ���� DB ������ ������ ��ųʸ��� Ȯ���� �� �ִ�
    - �տ� all_�� ���̸� ��ü ������ ������ ��ųʸ��� Ȯ���� �� �ִ�.
    
*/

-- ��� ������ �� �� �ִ� ������ ��ųʸ� ��
SELECT * FROM all_users;

-- ���� ������ ���̺� ����� �� �� �ִ� ������ ��ųʸ� ��
SELECT * FROM user_tables;
-- ��� ������ ���̺� ����� �� �� �ִ� ������ ��ųʸ� ��
SELECT * FROM all_tables;

/*
    # �������� �߰�
    
    1. ���̺� ������ ���ÿ� �������� �߰��ϱ�
    - ���̺� ������ �÷���� �÷�Ÿ�� �ڿ� ���������� �߰��� �� �ִ�.
    - ������ �߰�/������ ���������� ������ �޴´�
    - �������� �̸��� �������� ������ ����Ŭ���� ������ �ڵ� �̸��� ����Ѵ�.
        (� �߸��� �Ͽ� ���������� �����ߴ��� �˱� ���������)
    -"�÷��� �÷�Ÿ�� CONSTRAINT �������Ǹ� ��������Ÿ��"�� ���� ���������� ���� ��������
    - �� �����ο� �������� ���������� ������ �� �ִ�.
*/

CREATE TABLE coffee(
    coffee_id NUMBER(4) PRIMARY KEY,
    coffee_name VARCHAR2(40) NOT NULL UNIQUE,
    coffee_price NUMBER(5) CHECK(coffee_price >= 0),
    coffee_size CHAR (1) CHECK(coffee_size IN('T','G','V')) NOT NULL
);

INSERT INTO coffee VALUES (1, '�Ƹ޸�ī��', 2800, null);
INSERT INTO coffee VALUES (2, '�Ƹ޸�ī��(T)', 1200, 'T');

INSERT INTO coffee VALUES (3, '�Ƹ޸�ī��(L)', 2300, 'L');
-- ORA-02290: check constraint (HR.SYS_C007015) violated 
-- coffee_size�� L�� �ο����� �ʾұ� ������ ���� �����ε�,
-->> ���������� �������� �ʾ� ����Ŭ���� �ڵ����� ������ ���� ���̴�.

SELECT * FROM coffee;
SELECT * FROM user_constraints;

-- ���̺��� �����ϸ� �������ǵ� �Բ� �������.
DROP TABLE coffee;
PURGE recyclebin;

CREATE TABLE coffee(
    coffee_id NUMBER(4)  -- SYS000 ��� ���� ������ �������Ǹ� ���
        CONSTRAINT coffee_id_pk PRIMARY KEY,
    coffee_name VARCHAR2(40)
        CONSTRAINT coffee_name_uk UNIQUE
        CONSTRAINT coffee_name_nn NOT NULL,
    coffee_price NUMBER(5)
        CONSTRAINT coffee_price_positive CHECK(coffee_price >= 0)
        CONSTRAINT coffee_price_nn NOT NULL,
    coffee_size CHAR(1)
        CONSTRAINT coffee_size_nn NOT NULL
        CONSTRAINT coffee_size_chk CHECK(coffee_size IN('T','G','V'))
);

SELECT * FROM user_constraints WHERE table_name='COFFEE';

INSERT INTO coffee VALUES (1, 'Americano', 2000, 'T');
INSERT INTO coffee VALUES (2, 'Caffe Latte', 2300, 'T');
INSERT INTO coffee VALUES (3, 'Vanila Latte', 3800, 'V');
