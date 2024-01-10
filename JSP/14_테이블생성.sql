--14_���̺� ����.sql

/*
     #CRUD
     - ��κ��� ���α׷����� ������ �ִ� �⺻���� ���
     - Create / ������ ����
     - Read / ������ �б�
     - Update / ������ ����
     - Delete / ������ ����
     
     # DB�� ����
     
     1> DML (Data Manipulate Language, ���������۾�)
     - ���̺��� �����͸� �����ϴ� ��ɾ��
     - INSERT : ���̺� ������ �߰��ϱ� (Create)
     - SELECT : ���̺��� ������ �б� (Read)
     - UPDATE : ���̺��� ������ �����ϱ� (Update)
     - DELETE : ���̺��� ������ �����ϱ� (Delete)
     
     2> DDL (Data Definition Language, ������ ���Ǿ�)
     - �پ��� DB������Ʈ�� �����ϴ� ��ɾ�
      (DB������Ʈ : ���̺�, ������, ��, �ε���, ���� ...)
     - CREATE   : DB ������Ʈ ���� (C)
     - ALTER    : DB ������Ʈ ���� (U)
     - DROP     : DB ������Ʈ ���� (�����뿡�� ���� ����) (D)
     - TRUNCATE : DB �������� ���� ���� (���� �Ұ���) (D)
     
     3> DCL (Data Control Language, ������ ���� ��ɾ�)
     - �������� �帧�� �����ϱ� ���� ����ϴ� ��ɾ��
     - GRANT    : ���� �ο� ( ������ ������ ������ ������ ���´� )
     - REVOKE   : ���� ȸ�� 
     - ROLLBACK : �۾� �ǵ�����
     - COMMIT   : �۾� Ȯ������ (�ѹ��� �Ұ����� ���·� �����)
*/

SELECT * FROM tabs;


/*
    # ���̺� �����ϱ�
    
    CREATE TABLE ���̺�� (�÷�1 �÷�Ÿ��1, �÷�2 �÷�Ÿ��2 ....)
*/

CREATE TABLE fruits(
    fruit_name VARCHAR2(30),
    fruit_price NUMBER(6),
    fruit_grade VARCHAR2(2),
    country_id CHAR(2)
);

DESC fruits;

/*
    #���̺� ����
    
    DROP TABLE ���̺��;
*/
DROP TABLE fruits;

-- DROP�� ������ DB������Ʈ �����뿡�� Ȯ���� �� �ִ�.
SHOW recyclebin;

-- �����뿡 �ִ� ���̺� �����ϱ�
FLASHBACK TABLE fruits TO BEFORE DROP;
DESC fruits;

-- ������ ����, ���̺� �����ϱ�� ���� �ȵȴ�.
PURGE recyclebin;


-- ���� ���̺��� �����Ͽ� �� ���̺� �����
CREATE TABLE employees2 AS (SELECT * FROM employees);

-- ���̺��� ������ �� ������ �Բ� ����ȴ�
SELECT * FROM employees2;
DESC employees2;

-- �������� �׽�Ʈ ����
SELECT * FROM employees2 INNER JOIN departments USING (department_id);

/*
    # ���̺� ������ �����ϱ� (�����ʹ� �ʿ� ������)
    
*/
CREATE TABLE employees3 AS (SELECT * FROM employees WHERE 1 = 0);
-- 107���� �����鼭 1=0�� ������ų�� �ִ� �� ���� ������, �����ʹ� �ϳ��� ������� �ʴ´�.
-- �Ϻη� ���� ������ ����Ͽ� ���̺��� ������ �����Ѱ�
DESC employees3;
SELECT * FROM employees3;

/*
    # TRUNCATE : DB �������� ���� ���� (���� �Ұ���) (D)
     TRUNCATE TABLE ���̺�� : ������ ����� ��� ������ �߶������.
*/

TRUNCATE TABLE employees2;
SELECT * FROM employees2;

DROP TABLE employees2;
DROP TABLE employees3;
PURGE recyclebin;

/*
 1:N ������ ��ü���� ���̺�� �����غ�����
 
*/

CREATE TABLE onlinelibraries (
    library_id VARCHAR2(10) primary key,
    book_name VARCHAR2(100),
    book_location VARCHAR2(5),
    book_price NUMBER(10),
    author VARCHAR2(20),
    publisher VARCHAR2(10), -- ���� ���ǻ�
    publish_date DATE,
    book_category VARCHAR2(10)
);


CREATE TABLE readers(
    reader_id VARCHAR2(10),
    reader_name VARCHAR2(5),
    library_id VARCHAR2(10)
);

DROP TABLE onlinelibraries;
DROP TABLE readers;

/*
���̺��̸� : �౸��
�÷��� : �Ҽ���, ���̸�, ����, ������ȣ, ����....
�÷�Ÿ�� : number, varchar2, varchar2, number, number
�⺻Ű�÷� : team_id
�ܷ�Ű Ŀ�� : ����

���̺��̸� : �౸����
�÷��� : ������ȣ(pk), �̸�, ����, ������, ����(fk), �Ҽ�����ȣ(fk)....
�÷�Ÿ�� : number, varchar2, number
�⺻Ű�÷� : ������ȣ
�ܷ�Ű Ŀ�� : ����, �Ҽ�����ȣ
*/
CREATE TABLE SoccerStadium (
    stadium_id NUMBER(5),
    stadium_name VARCHAR2(30),
    stadium_address VARCHAR2(100)
);

CREATE TABLE SoccerTeam(
    team_id NUMBER(5),
    team_name VARCHAR2(30),
    team_owner VARCHAR2(10),
    home_stadium_id NUMBER(5), --  SoccerStadium���� 1:1���� �ܷ�Ű���
    team_leader_id NUMBER(8) -- SoccerPlayer player_id ���� 1:1���� �ܷ�Ű ���
);

CREATE TABLE SoccerPlayer(
    player_id NUMBER(8),
    player_eng_name VARCHAR2(25), -- ����� �� ���ڰ� 1����Ʈ ����
    player_kor_name VARCHAR2(40), -- �ѱ��� �� ���ڰ� 3����Ʈ ����
    player_position VARCHAR2(3),
    player_back_number NUMBER(2),
    country_id CHAR(2), -- countries ���̺��� ������ fk �ܷ�Ű
    team_in NUMBER(5) -- SoccerTeam ���̺��� ������ fk �ܷ�Ű
);













