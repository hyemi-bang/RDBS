--19_트랜젝션.sql

/*
    # 트랜젝션 (Transaction)
    - 하나의 작업 단위 (ex: 송금)
    - 데이터베이스는 하나의 트랜잭션에 속한 모든 작업이 정상적으로 완료되는 경우에만
      변경사항을 확정지을 수 있는 기능을 제공한다. (All or Nothing)
    - 트랜젝션을 관리하기 위해 COMMITM ROLLBACK, SAVEPOINT, ROLLBACK TO 사용
    - 하나의 트랜잭션은 마지막 커밋 이후부터 새로운 커밋 사이에서
      실행된 모든 DML만을 의미한다.
      (INSERT, UPDATE, DELETE 는 트랜잭션의 관리 대상이나
       CREAT, ALTER 등의 DDL은 트랜잭션의 관리 대상이 아니다.)
    
*/

SELECT * FROM fruits;

DELETE FROM fruits;
-- COMMIT : 여태까지의 변경 사항을 저장하여 확정짓는다. (하나의 트랜잭션을 마무리한다.)
COMMIT;

INSERT INTO fruits VALUES('Apple', 1222, 'C', 'ZM');
INSERT INTO fruits VALUES('PineApple', 1256, 'B', 'ZM');

--  ROLLBACK: 가장최근의 커밋으로 돌아간다.
ROLLBACK;

SAVEPOINT mysavepoint1;
UPDATE fruits SET fruit_price = fruit_price + 500;
UPDATE fruits SET fruit_price = fruit_price + 500 WHERE country_id = 'ZM';

SELECT* FROM fruits;
ROLLBACK TO mysavepoint2;
ROLLBACK TO mysavepoint1; -- 1번 돌아간 시점에서 다시 미래로 돌아갈 수 없다.

-- 트랜잭션의 작업 중 일부만 취소하고 계속해서 진행하고 싶은 경우
-- SAVEPOINT와 ROLLBACK TO를 활용한다.