-----------------------�����ڰ������� ������� ����------------------------------------------------------

CREATE USER firstProject IDENTIFIED BY "1111";

GRANT CREATE SESSION TO firstProject; -- �ش� ������ ������ �� �ִ� ������ �ο�
GRANT CREATE TABLE TO firstProject; -- �ش� ������ ���̺� ���� ������ �ο�
GRANT RESOURCE TO firstProject;
------------------------------------------------------------------------------------------------------

-- ���� �۾� �� 1��������Ʈ �������� �Ʒ� ���� (�ּ����� ���� �κ� ���� �������)
------------- member���̺� ---------

-- ���̺� ����--
CREATE TABLE member (
m_no NUMBER(5), 
m_id varchar2(100)
constraint m_id_pk Primary Key,
m_pwd varchar2(100) 
constraint m_pwd_nn NOT NULL,
m_name varchar2(100) NOT NULL,
m_phoneNum varchar2(100)
constraint m_phoneNum_nn NOT NULL,
m_email varchar2(100)
constraint m_email_nn NOT NULL, 
m_reservation_no varchar2(100),
m_memberOrNot varchar2(10)
);

CREATE SEQUENCE m_no_seq START WITH 1 INCREMENT BY 1 NOCACHE; -- ������ ����
-- drop table member;  (������ ���� ���̺� ��������)


-- ���̺� �� �ִ� ���� 
INSERT INTO member (m_no, m_id, m_pwd,m_name,m_phoneNum,m_email,m_reservation_no,m_memberOrNot) 
values(m_no_seq.nextval, 
'xogud', 
'1234', 
'������',
'010-5767-4637',
'xogud021@nate.com',
'R123kdflsa',
'O');
select * from member;
-- truncate table member -- ������̺� ���� ������ ���� (�������� ����)
-- drop sequence m_no_seq; ������ ����
