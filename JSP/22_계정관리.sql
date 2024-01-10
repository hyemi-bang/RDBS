--22_��������.sql// �����ڰ������� Ŭ���� �������Ѵ�.

-- ���� ������ ���� ����
SHOW user;

-- ���������� hr���� ���� ���ϰ� ������ ���������� �� �� �ִ�.

-- ������ �����ϱ�
CREATE USER testuser IDENTIFIED BY"1234";

-- ����� ���� ������ ��ųʸ� ��
SELECT * FROM all_users;
SELECT username, to_char(created, 'MM/DD HH24:MI:SS') FROM all_users;

-- ó�� ������ ���� �Ŀ��� ������ ������ �ο��ؾ��Ѵ�
-- ���� ������ ������ ���� �ֱ� -> GRANT ���� TO ����
GRANT CREATE SESSION TO testuser; -- �ش������ ������ �� �ִ� ������ �ο�
GRANT CREATE TABLE TO testuser; -- �ش������ ���̺� ���������� �ο�
GRANT RESOURCE TO testuser; -- ��������� ����� �� �ִ� ���� �ο�

-- ������ ������ ���� / ���� �����ϱ� => REVOKE ���� FROM ����
REVOKE RESOURCE FROM testuser;

-- ��й�ȣ �����ϱ�
ALTER USER testuser IDENTIFIED BY "4321";
ALTER USER testuser IDENTIFIED BY "1234";

-- ���������ϱ�
DROP USER testuser;




