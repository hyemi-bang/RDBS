SELECT * FROM tabs;

CREATE TABLE myboard(
    board_id NUMBER(5) CONSTRAINT myboard_id_pk PRIMARY KEY,
    board_title VARCHAR2(100) CONSTRAINT myboard_title_nn NOT NULL,
    board_content VARCHAR2(1000) CONSTRAINT myboard_content_nn NOT NULL,
    board_password VARCHAR2(64),
    board_writer VARCHAR2(20) CONSTRAINT board_writer_nn NOT NULL,
    view_count NUMBER(5) default 0,
    write_date DATE default sysdate
);

--DROP TABLE myboard;
--DROP SEQUENCE myreply_id_seq;

CREATE TABLE myreply(
    reply_id NUMBER(5) CONSTRAINT myreply_id_pk PRIMARY KEY,
    board_id NUMBER(5) 
        CONSTRAINT myrelpy_id_fk REFERENCES myboard(board_id)
        -- 게시판 운영시 DB에서 삭제를 하는게 아닐 수도 있다 (사용자 눈에만 보이지 않고 visible 컬럼을 만들어놓고 보이고 안보이고 체크를 할 수도 있다
       -- ON DELETE CASCADE  : 부모키를 삭제하면 참조하던 자식행을 모두 삭제해버린다. >> 주의하여 사용해야한다
        ON DELETE SET NULL, -- 참조를 잃어버리는 정도로만 사용한다
    reply_writer VARCHAR2(20),
    reply_content VARCHAR2(300),
    reply_password VARCHAR2(64),
    reply_good_count NUMBER(5) default 0,
    reply_bad_count NUMBER(5) default 0,
    reply_date DATE default sysdate
);

CREATE SEQUENCE myboard_id_seq INCREMENT BY 1 START WITH 1 NOCACHE NOCYCLE;
CREATE SEQUENCE myreply_id_seq INCREMENT BY 1 START WITH 1 NOCACHE NOCYCLE;


SELECT * FROM myboard;
SELECT * FROM myreply;

COMMIT;

DESC myreply;