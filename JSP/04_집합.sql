--04_����.sql
SELECT * FROM employees; --107��
SELECT first_name FROM employees WHERE first_name LIKE '%a%'; -- 66��
SELECT first_name FROM employees WHERE first_name LIKE '%e%'; -- 56��

-- SELECT�� ������ ����� �� �ְ�, ���������� ������� ������ �� ���̴�.

-- INTERSECT : ������
-- e�� ���� a�� ���� ������
SELECT first_name FROM employees WHERE first_name LIKE '%a%'
INTERSECT
SELECT first_name FROM employees WHERE first_name LIKE '%e%'; -- 23�� 

--UNION : ������
-- first_name�� a�ְų� e�ִ� ��� ���
SELECT first_name FROM employees WHERE first_name LIKE '%a%'
UNION
SELECT first_name FROM employees WHERE first_name LIKE '%e%'; -- 81��

--UNION ALL : �ߺ��� ���� ���� ������
-- first_name�� a�ִ� ��� ��ȸ�ϰ� e�ִ� ����� ��ȸ
SELECT first_name FROM employees WHERE first_name LIKE '%a%'
UNION ALL
SELECT first_name FROM employees WHERE first_name LIKE '%e%'; -- 122�� ��ȸ

--MINUS : ������
 -- first_name a�� ����, e�� �������� ���
SELECT first_name FROM employees WHERE first_name LIKE '%a%'
MINUS
SELECT first_name FROM employees WHERE first_name LIKE '%e%';
-- first_name e�� ����, a�� �������� ���
SELECT first_name FROM employees WHERE first_name LIKE '%e%'
MINUS
SELECT first_name FROM employees WHERE first_name LIKE '%a%'; 