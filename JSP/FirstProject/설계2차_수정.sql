-- ���� ���� ���̺�
create table userInfo(
user_id number(5)
constraint user_id__pk PRIMARY KEY,
user_name varchar2(50)
constraint user_name_nn NOT NULL, 
user_address varchar2(100),  -- Ȥ�ö� ����� �ϰ� �ȴٸ�..? ��� �ϰ� �Ǹ� �ֹ� ������ �ּ� insert
user_phone number(15)
constraint user_phone_nn NOT NULL
constraint user_phoneNum_u UNIQUE, 
user_membership_number number(10)
constraint membership_nn NOT NULL
);
select * from userInfo;
CREATE SEQUENCE user_id_seq START WITH 1 INCREMENT BY 1 NOCACHE; -- ������ ����(1���� ���� 1�� ����)

-- �ʿ� �� �ּ� ���� �� ���
-- drop sequence user_id_seq; -- ������ ���� 
-- drop table userInfo; -- ���̺� ����
-- truncate table userInfo; -- ���̺� �� ���� ����

-- ī�װ� ���̺�
create table category(
category_id number(5)
constraint category_id_pk PRIMARY KEY,
category_name varchar2(20)
constraint category_name_nn NOT NULL
);

CREATE SEQUENCE category_id_seq START WITH 1 INCREMENT BY 1 NOCACHE; -- ������ ����(1���� ���� 1�� ����)

-- INSERT ����
-- INSERT INTO category(category_id, category_name) values (1, '���̽�ũ��');

select * from category;
-- ���̺� ���� Ȥ�� ���� ���� �� menu���̺� ���� ���� �ؾ���
-- drop table category;   
-- truncate table category;

create table menu(
menu_id number(5)
constraint menu_id_pk PRIMARY KEY, 
menu_name varchar2(50)
constraint menu_name_nn NOT NULL, 
menu_category number(5)
constraint menu_category_fk REFERENCES category(category_id)
);
CREATE SEQUENCE menu_id_seq START WITH 1 INCREMENT BY 1 NOCACHE; -- ������ ����(1���� ���� 1�� ����)
-- drop sequence menu_id_seq;
-- drop table menu;
-- truncate table menu;

create table order_menu(
 order_id number(8)
 constraint order_id_pk PRIMARY KEY, 
 order_no number(5)
 constraint order_no_nn NOT NULL, 
 item1 varchar2(30)
 constraint item1_nn NOT NULL,
 amount1 number(5)
 constraint amount1_nn NOT NULL,
 item2 varchar2(30), 
 amount2 number(5), 
 item3 varchar2(30), 
 amount3 number(5), 
 item4 varchar2(30), 
 amount4 number(5), 
 item5 varchar2(30), 
 amount5 number(5), 
 item6 varchar2(30), 
 amount6 number(5), 
 item7 varchar2(30), 
 amount7 number(5), 
 item8 varchar2(30), 
 amount8 number(5), 
 item9 varchar2(30), 
 amount9 number(5)
  );
  
CREATE SEQUENCE order_id_seq START WITH 1 INCREMENT BY 1 NOCACHE; -- ������ ����(1���� ���� 1�� ����)
select * from order_menu;
--truncate table order_menu;
--drop table order_menu;

create table size_ice(
size_id number(5)
constraint size_id_pk PRIMARY KEY, 
size_cup varchar2(10)
constraint size_cup_nn NOT NULL, 
price number(20)
constraint size_price_nn NOT NULL
);
CREATE SEQUENCE size_id_seq START WITH 1 INCREMENT BY 1 NOCACHE; -- ������ ����(1���� ���� 1�� ����)

select * from size_ice;

-- truncate table size_ice;
-- drop table size_ice;

-- ����ũ ���̺� 
create table cake(
cake_id number(5)
constraint cake_id_pk PRIMARY KEY, 
cake_name varchar2(20)
constraint cake_name_nn NOT NULL,  
cake_price number(20)
constraint cake_price_nn NOT NULL
);

CREATE SEQUENCE cake_id_seq START WITH 1 INCREMENT BY 1 NOCACHE; -- ������ ����(1���� ���� 1�� ����)
--drop sequence cake_id_seq;
select * from cake;

--truncate table cake;
--drop table cake;

-- ����� ���� ���̺�
create table membership(
membership_id number(5)
constraint membership_id_pk PRIMARY KEY, 
membership_num number(15)
constraint membership_num_u UNIQUE, 
user_name varchar2(50)
constraint mem_user_name_nn NOT NULL,
user_phoneNum number(15)
constraint user_phoneNum__fk REFERENCES userInfo(user_phone), 
membership_point number(20)
constraint mem_point_nn NOT NULL
);

CREATE SEQUENCE membership_id_seq START WITH 1 INCREMENT BY 1 NOCACHE; -- ������ ����(1���� ���� 1�� ����)

-- drop sequence membership_id_seq;

select * from membership;
-- truncate table membership;
-- drop table membership;

-- ����� �����丮 ���̺� (�ֹ� �ø��� insert)
create table membership_History(
membership_history_id number(10)
constraint membership_history_id_pk PRIMARY KEY, 
membership_num number(15)
constraint membership_num_fk REFERENCES membership(membership_num), 
user_name varchar2(50)
constraint user_name__nn NOT NULL,
user_phoneNum number(15)
constraint user_phone_fk REFERENCES userInfo(user_phone),  
record_date date, 
amount number(15), 
order_id number(8)
constraint order_id_fk REFERENCES order_menu(order_id)
);

CREATE SEQUENCE membership_history_id_seq START WITH 1 INCREMENT BY 1 NOCACHE; -- ������ ����(1���� ���� 1�� ����)
-- drop sequence membership_history_id_seq;

select * from membership_History;

-- drop table membership_history;
-- truncate table membership_history;
















  