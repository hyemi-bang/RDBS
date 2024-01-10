--20_시퀀스.sql

/*
    #시퀀스 (Sequence)
    - 기본키로 사용하기 편리하도록 번호를 자동으로 생성해주는 db object
    CREATE SEQUENCE 시퀀스명
                    [START WITH n] - 시작번호 설정
                    [INCREMENT BY n] - 증가 숫자 설정
                    [MAXVALUE n | NOMAXVALUE] - 최대 숫자 설정
                    [MINVALUE n | NOMINVALUE] - 최소 숫자 설정
                    [CYCLE | NOCYCLE] - 숫자 순환 여부 설정
                    [CACHE n | NOCACHE] - 번호를 미리 만들어놓을 양을 설정
*/

-- 시퀀스 데이터 딕셔너리 뷰
 SELECT * FROM user_sequences;
 SELECT * FROM all_sequences;
 
 -- 시퀀스 생성하기
 CREATE SEQUENCE coffee_seq1; -- 모든것이 기본값인 시퀀스
 CREATE SEQUENCE fruit_id_seq START WITH 10 INCREMENT BY 10;
 
 -- 테스트용 테이블 dual : 연습을 위한 테이블 1칸,1행만 있음
 SELECT * FROM dual;
 SELECT 10*10 FROM dual;
 SELECT upper('apple') FROM dual;
 
 
 -- 시퀀스.nextval : 다음번호를 사용한다 (다시는 이전 번호로 돌아갈 수 없다.)
 SELECT coffee_seq1.nextval FROM dual;
 SELECT fruit_id_seq.nextval FROM dual;
 
 -- 시퀀스.currval : 현재 번호를 확인한다 (맨 처음에는 사용할 수 없다)
 -- nextval을 한번이라도 실행한 후에 확인 가능하다
 SELECT coffee_seq1.currval FROM dual;


DELETE FROM fruits;
ALTER TABLE fruits ADD CONSTRAINT fruit_id_pk PRIMARY KEY(fruit_id);

 -- 시퀀스를 사용해 테이블에 insert하기
 -- 기본키 값을 직접 계산하면 힘들기 때문에 시퀀스를 만들어 사용한다
 INSERT INTO fruits(fruit_id, fruit_name, fruit_price)
 VALUES (fruit_id_seq.nextval, 'Apple', 1234);

SELECT * FROM fruits;

CREATE SEQUENCE bank_waiting_seq
    START WITH 10 INCREMENT BY 20 MAXVALUE 100 CYCLE NOCACHE;
DROP SEQUENCE bank_waiting_seq; --  삭제가능

CREATE SEQUENCE bank_waiting_seq
    START WITH 10 INCREMENT BY 20
    MINVALUE 10 MAXVALUE 100 CYCLE NOCACHE;
 
SELECT bank_waiting_seq.nextval FROM dual; 

-- 시퀀스 삭제하기 : DROP SEQUENCE 시퀀스명;
-- 시퀀스 수정하기 : ALTER SEQUENCE 시퀀스명 [옵션은 create sequence와 같음]



 
 
 
 
 