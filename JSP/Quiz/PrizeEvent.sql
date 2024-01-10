
-- 테이블생성
-- 테이블은 경품의 이름, 당첨 확률, 남은 수량 등의 정보를 저장
CREATE TABLE prizes (
    prize_id NUMBER(15)
        CONSTRAINT prize_id_pk PRIMARY KEY,
    prize_name VARCHAR2(255)
        CONSTRAINT prize_nm_nn NOT NULL
        CONSTRAINT prize_nm_uk UNIQUE,
    prize_amount NUMBER(15)
        CONSTRAINT prize_am_nn NOT NULL
        CONSTRAINT prize_am_chk CHECK(prize_amount >= 0),
    winning_probability NUMBER(5, 2)
        CONSTRAINT prob_chk CHECK(winning_probability >= 0 AND winning_probability <= 1)
        CONSTRAINT prob_nn NOT NULL
);
DROP TABLE prizes;
DESC prizes;
SELECT * FROM prizes;
SELECT * FROM user_constraints WHERE table_name = 'PRIZES';

--  "lg gram 15" 15장 , "뮤지컬 R석 티켓 2장" 50장, "공기청정기" 5장, "스타벅스 아메리카노 상품권"300장

INSERT INTO prizes (prize_id, prize_name, prize_amount, winning_probability) VALUES(01, 'lg gram 15', 15, 0.25);
INSERT INTO prizes (prize_id, prize_name, prize_amount, winning_probability) VALUES(02, '뮤지컬 R석 티켓', 30, 0.3);
INSERT INTO prizes (prize_id, prize_name, prize_amount, winning_probability) VALUES(03, '공기청정기', 5, 0.05);
INSERT INTO prizes (prize_id, prize_name, prize_amount, winning_probability) VALUES(04, '스타벅스 아메리카노 상품권', 300, 0.4);


--------------------------------------

CREATE TABLE winners(
    winner_id VARCHAR2(10)
        CONSTRAINT winner_id_pk PRIMARY KEY,
    prize_id NUMBER(10)
        CONSTRAINT prize_fk REFERENCES prizes(prize_id),
    winner_name VARCHAR2(255)
);

SELECT * FROM winners;
SELECT * FROM user_constraints WHERE table_name = 'WINNERS';
DROP TABLE winners;
