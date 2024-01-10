--18_ON DELETE.sql

/*
    # ON DELETE
    - �ܷ�Ű �����Ҷ� �θ�Ű�� ������ ���� ��å�� �����Ѵ�.
    - ON DELETE RESTRICT : �θ�Ű�� �����Ϸ��� �� �� ������ ���´�. (�⺻��)
    - ON DELETE SET NULL : �θ�Ű�� �����ϰ� �����ϴ� �ڽ�Ű���� ���� NULL�� �ٲ۴�.
    - ON DELETE CASCADE  : �θ�Ű�� �����ϸ� �����ϴ� �ڽ����� ��� �����ع�����. 
*/

SELECT * FROM user_tables;
SELECT * FROM coffee;
SELECT * FROM fruits;

-- counties3�� ������ ����� fruits���� �����ϴ� ������ ���� null�� �ٲٰڴ�.
ALTER TABLE fruits ADD CONSTRAINT fruits_c_id_fk
FOREIGN KEY(country_id) REFERENCES countries3(country_id)
ON DELETE SET NULL; -- ON DELETE ���� �߰�

-- �θ�Ű �����غ���
DELETE FROM countries3 WHERE country_id = 'AU';
-- integrity constraint (HR.COFFEE_C_ID_FK) violated - child record found
-- �������� �ʴ� ������, fruits�� �ƴ϶� coffee���� ���� ��å�� �߰� �ؾ� �ϱ� �����̴�.

COMMIT;
ALTER TABLE coffee DROP CONSTRAINT coffee_c_id_fk;

ALTER TABLE coffee MODIFY(
    country_id CHAR(2)
        CONSTRAINT coffee_c_id_fk REFERENCES countries3(country_id)
        ON DELETE CASCADE
);
-- Ŀ���ʿ��� ������å �ְ�, �����ʿ��� ������å�� �����. ������ ���� �� �ִ�.
-- �θ�Ű �����غ���
DELETE FROM countries3 WHERE country_id = 'AU';
-- "cannot update (%s) to NULL"

ALTER TABLE fruits DROP CONSTRAINT SYS_C007008;
DELETE FROM countries3 WHERE country_id = 'AU';

SELECT * FROM coffee; -- CASCADE���� ������ �����ڵ尡 'AU'���� ���� ��� ������
SELECT * FROM fruits; -- SEL NULL�̾��� ������ �����ڵ尡 'AU'���� ���� ��� ������


