--18_ON DELETE.sql

/*
    # ON DELETE
    - 외래키 설정할때 부모키를 삭제할 때의 정책을 결정한다.
    - ON DELETE RESTRICT : 부모키를 삭제하려고 할 때 삭제를 막는다. (기본값)
    - ON DELETE SET NULL : 부모키를 삭제하고 참조하던 자식키들의 값을 NULL로 바꾼다.
    - ON DELETE CASCADE  : 부모키를 삭제하면 참조하던 자식행을 모두 삭제해버린다. 
*/

SELECT * FROM user_tables;
SELECT * FROM coffee;
SELECT * FROM fruits;

-- counties3의 국가를 지우면 fruits에서 참조하던 국가의 값을 null로 바꾸겠다.
ALTER TABLE fruits ADD CONSTRAINT fruits_c_id_fk
FOREIGN KEY(country_id) REFERENCES countries3(country_id)
ON DELETE SET NULL; -- ON DELETE 조건 추가

-- 부모키 삭제해보기
DELETE FROM countries3 WHERE country_id = 'AU';
-- integrity constraint (HR.COFFEE_C_ID_FK) violated - child record found
-- 삭제되지 않는 이유는, fruits뿐 아니라 coffee에도 삭제 정책을 추가 해야 하기 때문이다.

COMMIT;
ALTER TABLE coffee DROP CONSTRAINT coffee_c_id_fk;

ALTER TABLE coffee MODIFY(
    country_id CHAR(2)
        CONSTRAINT coffee_c_id_fk REFERENCES countries3(country_id)
        ON DELETE CASCADE
);
-- 커피쪽에서 삭제정책 있고, 과일쪽에도 삭제정책이 생겼다. 이제는 지울 수 있다.
-- 부모키 삭제해보기
DELETE FROM countries3 WHERE country_id = 'AU';
-- "cannot update (%s) to NULL"

ALTER TABLE fruits DROP CONSTRAINT SYS_C007008;
DELETE FROM countries3 WHERE country_id = 'AU';

SELECT * FROM coffee; -- CASCADE였기 때문에 국가코드가 'AU'였던 행이 모두 삭제됨
SELECT * FROM fruits; -- SEL NULL이었기 때문에 국가코드가 'AU'였던 행이 모두 삭제됨


