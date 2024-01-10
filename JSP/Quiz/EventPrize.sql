-- QUIZ
-- 상품ID/상품명/당첨확률/남은수량/초기수량

CREATE SEQUENCE event_prize_id_seq NOCACHE NOCYCLE;

CREATE TABLE eventprizes (
    prize_id NUMBER(3)
        CONSTRAINT prize_id_pk PRIMARY KEY,
    prize_name VARCHAR2(20),
    prize_rate NUMBER(3, 3),
    remain_qty NUMBER(3),
    init_qty NUMBER(3)          
);

ALTER TABLE eventprizes RENAME CONSTRAINT prize_id_pk TO event_prize_id_pk;
SELECT * FROM eventprizes;
DESC eventprizes;
SELECT * FROM user_constraints WHERE table_name = 'EVENTPRIZES';
DROP TABLE eventprizes;

UPDATE eventprizes SET remain_qty = 10;
COMMIT;

ALTER TABLE eventprizes MODIFY(
    remain_qty NUMBER(3)
        CONSTRAINT event_remain_qty_pos CHECK (remain_qty>=0)
); 