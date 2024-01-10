--19_Ʈ������.sql

/*
    # Ʈ������ (Transaction)
    - �ϳ��� �۾� ���� (ex: �۱�)
    - �����ͺ��̽��� �ϳ��� Ʈ����ǿ� ���� ��� �۾��� ���������� �Ϸ�Ǵ� ��쿡��
      ��������� Ȯ������ �� �ִ� ����� �����Ѵ�. (All or Nothing)
    - Ʈ�������� �����ϱ� ���� COMMITM ROLLBACK, SAVEPOINT, ROLLBACK TO ���
    - �ϳ��� Ʈ������� ������ Ŀ�� ���ĺ��� ���ο� Ŀ�� ���̿���
      ����� ��� DML���� �ǹ��Ѵ�.
      (INSERT, UPDATE, DELETE �� Ʈ������� ���� ����̳�
       CREAT, ALTER ���� DDL�� Ʈ������� ���� ����� �ƴϴ�.)
    
*/

SELECT * FROM fruits;

DELETE FROM fruits;
-- COMMIT : ���±����� ���� ������ �����Ͽ� Ȯ�����´�. (�ϳ��� Ʈ������� �������Ѵ�.)
COMMIT;

INSERT INTO fruits VALUES('Apple', 1222, 'C', 'ZM');
INSERT INTO fruits VALUES('PineApple', 1256, 'B', 'ZM');

--  ROLLBACK: �����ֱ��� Ŀ������ ���ư���.
ROLLBACK;

SAVEPOINT mysavepoint1;
UPDATE fruits SET fruit_price = fruit_price + 500;
UPDATE fruits SET fruit_price = fruit_price + 500 WHERE country_id = 'ZM';

SELECT* FROM fruits;
ROLLBACK TO mysavepoint2;
ROLLBACK TO mysavepoint1; -- 1�� ���ư� �������� �ٽ� �̷��� ���ư� �� ����.

-- Ʈ������� �۾� �� �Ϻθ� ����ϰ� ����ؼ� �����ϰ� ���� ���
-- SAVEPOINT�� ROLLBACK TO�� Ȱ���Ѵ�.