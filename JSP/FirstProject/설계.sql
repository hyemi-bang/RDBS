-- 테이블 생성
create table flavor( 
    flavor_id number(5)
    constraint flover_id_pk primary KEY,
    flavor_name varchar2(80)
    CONSTRAINT flavor_name_nn NOT NULL
);

create table category5(
    category5_id number(5)
    constraint category5_id_pk primary key,
    category5_name varchar2(80)
    CONSTRAINT category5_name_nn NOT NULL
);

create table icecream(
    icecream_id number(5)
    constraint icecream_id_pk primary key,
    icecream_name varchar2(80)
     CONSTRAINT icecream_name_nn NOT NULL,
    icecream_price number(30)
     CONSTRAINT icecream_price_nn NOT NULL,
    category5_id number(5) CONSTRAINT category5_id_fk REFERENCES category5(category5_id)
);

create table cake( 
    cake_id number(5)
    CONSTRAINT cake_id_pk primary key,
    cake_name varchar2(80)
     CONSTRAINT cake_name_nn NOT NULL,
    cake_price number(5)
    CONSTRAINT cake_price_nn NOT NULL,
    category5_id number(5)
    CONSTRAINT category_id_fk  REFERENCES category5(category5_id)
);

create table coffee(
    coffee_id number(5)
    constraint coffee_id_pk primary key,
    coffee_name varchar2(80)
     CONSTRAINT coffee_name_nn NOT NULL,
    coffee_price number(5)
      CONSTRAINT coffee_price_nn NOT NULL,
    category5_id number(5)
    CONSTRAINT category5_cg_id_fk REFERENCES category5(category5_id)
);

create table dessert(
    dessert_id number(5)
    constraint dessert_id_pk primary key,
    dessert_name varchar2(80)
    CONSTRAINT dessert_name_nn NOT NULL,
    dessert_price number(5)
      CONSTRAINT dessert_price_nn NOT NULL,
    category5_id number(5)
     CONSTRAINT category_cg_id_fk REFERENCES category5(category5_id)
);

create table beverage(
    beverage_id number(5)
    constraint beverage_id_pk primary key,
    beverage_name varchar2(80)
    CONSTRAINT beverage_name_nn NOT NULL,
    beverage_price number(5)
    CONSTRAINT beverage_price_nn NOT NULL,
    category5_id number(5)
    CONSTRAINT category5__id_fk REFERENCES category5(category5_id)
);

create table menu(
    menu_id number(5)
    CONSTRAINT quantity_id_pk primary KEY,
    menu_name varchar2(80)
    CONSTRAINT menu_name_nn NOT NULL
    CONSTRAINT menu_name_UK UNIQUE, 
    choice1 VARCHAR2(80),
    choice2 VARCHAR2(80),
    choice3 VARCHAR2(80),
    choice4 VARCHAR2(80),
    choice5 VARCHAR2(80),
    choice6 VARCHAR2(80),
    menu_price number(5)
    CONSTRAINT menu_price_positive CHECK(menu_price >= 0)
    CONSTRAINT menu_price_nn NOT NULL,
    category5_id number(5)
    CONSTRAINT category5_ctgo_id_fk REFERENCES category5(category5_id),
    receipt_date DATE CONSTRAINT receipt_date_nn NOT NULL
);


create table membership(
    membership_id number(30)
    constraint membership_id_pk primary key,
    membership_tel varchar2(20)
    CONSTRAINT membership_tel_nn NOT NULL
    CONSTRAINT membership_tel_UK UNIQUE,
    mambership_point number(30)
);

CREATE TABLE receipt (
    receipt_id NUMBER(30) PRIMARY KEY,
    membership_tel VARCHAR2(20) CONSTRAINT membership_tel__fk REFERENCES membership(membership_tel),
    receipt_menu1 VARCHAR2(80) CONSTRAINT receipt_menu1_nn NOT NULL,
    receipt_price1 NUMBER(5) CONSTRAINT receipt_price1_nn NOT NULL,
    receipt_menu2 VARCHAR2(80),
    receipt_price2 NUMBER(5),
    receipt_menu3 VARCHAR2(80),
    receipt_price3 NUMBER(5),
    receipt_menu4 VARCHAR2(80),
    receipt_price4 NUMBER(5),
    receipt_menu5 VARCHAR2(80),
    receipt_price5 NUMBER(5),
    receipt_menu6 VARCHAR2(80),
    receipt_price6 NUMBER(5),
    receipt_menu7 VARCHAR2(80),
    receipt_price7 NUMBER(5),
    receipt_menu8 VARCHAR2(80),
    receipt_price8 NUMBER(5),
    receipt_menu9 VARCHAR2(80),
    receipt_price9 NUMBER(5),
    total_price NUMBER(5) CONSTRAINT total_pricee__nn NOT NULL,
    receipt_date DATE CONSTRAINT receipt_date__nn NOT NULL
);


-- 모든 기본키에 부여할 시퀀스 만듬
create sequence flavor_id_seq;
create sequence choice_id_seq;
create sequence receipt_id_seq;
create sequence membership_id_seq;
create sequence beverage_id_seq;
create sequence dessert_id_seq;
create sequence coffee_id_seq;
create sequence cake_id_seq;
create sequence icecream_id_seq;
create sequence menu_id_seq;
create sequence category5_id_seq;

-- 시퀀스 부여
insert into flavor(flavor_id) values (flavor_id_seq.nextval);
insert into choice(choice_id) values (choice_id_seq.nextval);
insert into receipt(receipt_id) values (receipt_id_seq.nextval);
insert into membership(membership_id) values (membership_id_seq.nextval);
insert into beverage(beverage_id) values (beverage_id_seq.nextval);
insert into dessert(dessert_id) values (dessert_id_seq.nextval);
insert into coffee(coffee_id) values (coffee_id_seq.nextval);
insert into cake(cake_id) values (cake_id_seq.nextval);
insert into icecream(icecream_id) values (icecream_id_seq.nextval);
insert into menu(menu_id) values (menu_id_seq.nextval);
insert into category5(category5_id) values (category5_id_seq.nextval);
